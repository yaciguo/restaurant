package com.ispan.eeit64.service.impl;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.eeit64.entity.CategoryBean;
import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.repository.CategoryRepository;
import com.ispan.eeit64.repository.OrderRepository;

@Service
@Transactional
public class DataAnalysisServiceImpl {
    public final int YEAR = 0;
    public final int MONTH = 1;
    public final int DAY = 2;

    public final int METHOD_CATEGORY = 1;
    public final int METHOD_DISH = 2;
    public final int METHOD_YEAR = 3;
    public final int METHOD_MONTH = 4;
    public final int METHOD_DAY = 5;
    
    public final int VALUE_TYPE_QUANTITY = 1;
    public final int VALUE_TYPE_SALESPRICE = 2;
    public final int VALUE_TYPE_SALESPRICEPROPORTION = 3;
    public final int VALUE_TYPE_PROFIT = 4;
    public final int VALUE_TYPE_COUNTORDERS = 5;
    public final int VALUE_TYPE_COST = 6;
    
    public final Map<Integer,String> ALL_METHOD = Map.of(
        this.METHOD_CATEGORY, "Category",
        this.METHOD_DISH, "Dish",
        this.METHOD_YEAR, "Year",
        this.METHOD_MONTH, "Month",
        this.METHOD_DAY, "Day"
    );

    public final Map<Integer, String> ALL_VALUE_TYPE = Map.of(
        this.VALUE_TYPE_QUANTITY, "Quantity",
        this.VALUE_TYPE_SALESPRICE, "Sales_Price",
        this.VALUE_TYPE_SALESPRICEPROPORTION, "Sales_Price_Proportion",
        this.VALUE_TYPE_PROFIT, "Profit",
        this.VALUE_TYPE_COUNTORDERS, "Count_Orders",
        this.VALUE_TYPE_COST, "Cost"
    );



    @Autowired
    OrderRepository dao;
    @Autowired
    CategoryRepository cDao;

    public List<Map<String,Object>> splitDate(int method, Date origStartDate, Date origEndDate){
        SimpleDateFormat y = new SimpleDateFormat("yyyy");
        SimpleDateFormat ym = new SimpleDateFormat("yyyy-MM");
        SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = new Date(origStartDate.getTime());
        Date endDate = new Date(origEndDate.getTime());
        List<Map<String,Object>> sections = new ArrayList<>();
        while(startDate.getTime() < endDate.getTime()){
            Map<String,Object> map = new HashMap<>();
            map.put("start", startDate.getTime());
            if(method == this.METHOD_YEAR){
                map.put("target", y.format(startDate));
                startDate.setMonth(0);
                startDate.setDate(1);
                startDate.setYear(startDate.getYear()+1);
            }else if(method == this.METHOD_MONTH){
                map.put("target", ym.format(startDate));
                startDate.setDate(1);
                startDate.setMonth(startDate.getMonth()+1);
            }else if(method == this.METHOD_DAY){
                map.put("target", ymd.format(startDate));
                startDate.setDate(startDate.getDate()+1);
            }
            if(startDate.getTime() < endDate.getTime()){
                map.put("end", startDate.getTime());
            }else{
                map.put("end", endDate.getTime());
            }
            sections.add(map);
        }
        return sections;
    }

    public List<Map<String,Object>> getCategoryAndDish(){
        List<CategoryBean> cList = cDao.findAll();
        List<Map<String,Object>> result = new ArrayList<>();
        for(CategoryBean cBean : cList){
            Map<String,Object> cMap = new HashMap<>();
            cMap.put("id", cBean.getId());
            cMap.put("name", cBean.getName());
            List<Map<String,Object>> dList = new ArrayList<>();
            cMap.put("items", dList);
            for(DishBean dBean : cBean.getDishBean()){
                Map<String,Object> dMap = new HashMap<>();
                dMap.put("id", dBean.getId());
                dMap.put("name", dBean.getName());
                dList.add(dMap);
            }
            result.add(cMap);
        }

        return result;
    }

    public List<Map<String,Object>> getCategory(){
        List<CategoryBean> cList = cDao.findAll();
        List<Map<String,Object>> result = new ArrayList<>();
        Map<String,Object> map = new HashMap<>();
        map.put("name", "全品項");
        map.put("id", 0);
        List<Map<String,Object>> list = new ArrayList<>();
        map.put("items", list);
        for(CategoryBean cBean : cList){
            Map<String,Object> cMap = new HashMap<>();
            cMap.put("id", cBean.getId());
            cMap.put("name", cBean.getName());
            list.add(cMap);
        }
        result.add(map);
        return result;
    }
        
    public Map<String, List<Map<String, Object>>> getAllData(Date startDate, Date endDate) {        
        List<CategoryBean> cList = cDao.findAll();
        Set<Integer> cIds = new HashSet<>();
        Set<Integer> dIds = new HashSet<>();
        for(CategoryBean cBean : cList){
            cIds.add(cBean.getId());
            for(DishBean dBean : cBean.getDishBean()){
                dIds.add(dBean.getId());
            }
        }
        
        Map<String, Map<String, Object>> allresult = new HashMap<>();
        for(Integer method : this.ALL_METHOD.keySet()){
            Set<Integer> ids = new HashSet<>();
            if(method == this.METHOD_CATEGORY){
                ids = cIds;
            }else if(method == this.METHOD_DISH){
                ids = dIds;
            }else{
                ids = null;
            }

            Map<String, Object> map = new HashMap<>();
            allresult.put(this.ALL_METHOD.get(method), map);
            for(Integer value_type : this.ALL_VALUE_TYPE.keySet()){
                List<Map<String,Object>> result = new ArrayList<>();
                result = getData(method, value_type, ids, startDate, endDate);
                map.put( this.ALL_VALUE_TYPE.get(value_type), result);
            }
        }

        Map<String, List<Map<String, Object>>> allData = new HashMap<>();
        for(Integer method : this.ALL_METHOD.keySet()){
            Map<String, Object> map = allresult.get(this.ALL_METHOD.get(method));
            List<Map<String,Object>> result;

            List<Map<String, Object>> methodData = new ArrayList<>();
            allData.put(this.ALL_METHOD.get(method), methodData);
            for(Integer value_type : this.ALL_VALUE_TYPE.keySet()){
                result = (List<Map<String, Object>>) map.get(this.ALL_VALUE_TYPE.get(value_type));
                for(int i=0; i<result.size(); i++){
                    Map<String,Object> data = result.get(i);
                    Map<String,Object> oneData = i<methodData.size() ? methodData.get(i) : null;
                    if(oneData == null){
                        oneData = new HashMap<>();
                        oneData.put("target", data.get("target"));
                        methodData.add(i, oneData);
                    }
                    oneData.put(this.ALL_VALUE_TYPE.get(value_type), data.get("value"));
                }
            }
        }
        
        return allData;
    }

    public List<Map<String,Object>> getData(int method, int value_type, Set<Integer> ids, Date startDate, Date endDate){
        Timestamp startTime = new Timestamp(startDate.getTime());
        Timestamp endTime = new Timestamp(endDate.getTime());

        List<Object[]> result = new ArrayList<>();
        List<Map<String,Object>> dateList = new ArrayList<>();
        if(method == this.METHOD_CATEGORY){
            result = getCategoryResult(value_type, ids, startTime, endTime);
        }else if(method == this.METHOD_DISH){
            result = getDishResult(value_type, ids, startTime, endTime);
        }else if(method == this.METHOD_YEAR || method == this.METHOD_MONTH || method == this.METHOD_DAY){            
            dateList = splitDate(method, startDate, endDate);
            result = getDateResult(value_type, dateList);
        }

        List<Map<String,Object>> data = new ArrayList<>();
        for(Object[] obj : result){
            Map<String,Object> map = new HashMap<>();
            map.put("target", obj[0]);
            map.put("value", obj[1] == null ? 0 : obj[1]);
            data.add(map);
        }
        return data;
    }


    public List<Object[]> getCategoryResult(int value_type, Set<Integer> ids, Timestamp startTime, Timestamp endTime){
        List<Object[]> result = new ArrayList<>();
        if(value_type == this.VALUE_TYPE_QUANTITY){
            result = dao.sumQuantityByCategoryIdsAndOrderTime(ids, startTime, endTime);
        }else if(value_type == this.VALUE_TYPE_PROFIT){
            result = dao.sumProfitByCategoryIdsAndOrderTime(ids, startTime, endTime);
        }else if(value_type == this.VALUE_TYPE_COUNTORDERS){
            result = dao.countOrdersByCategoryIdsAndOrderTime(ids, startTime, endTime);
        }else if(value_type == this.VALUE_TYPE_SALESPRICE){
            result = dao.sumSalesPriceByCategoryIdsAndOrderTime(ids, startTime, endTime);
        }else if(value_type == this.VALUE_TYPE_COST){
            result = dao.sumCostByCategoryIdsAndOrderTime(ids, startTime, endTime);
        }else if(value_type == this.VALUE_TYPE_SALESPRICEPROPORTION){
            Integer sumSalesPrice = dao.sumSalesPriceByAllCategoryIdsAndOrderTime(startTime, endTime);
            result = dao.sumSalesPriceByCategoryIdsAndOrderTime(ids, startTime, endTime);
            for(Object[] obj : result){
                BigDecimal bd = new BigDecimal((long)obj[1]/(float)sumSalesPrice*100);
                bd = bd.setScale(2, RoundingMode.DOWN);
                obj[1] = bd.doubleValue();
            }
        }
        return result;
    }
    
    public List<Object[]> getDishResult(int value_type, Set<Integer> ids, Timestamp startTime, Timestamp endTime){
        List<Object[]> result = new ArrayList<>();
        if(value_type == this.VALUE_TYPE_QUANTITY){
            result = dao.sumQuantityByDishIdsAndOrderTime(ids, startTime, endTime);
        }else if(value_type == this.VALUE_TYPE_PROFIT){
            result = dao.sumProfitByDishIdsAndOrderTime(ids, startTime, endTime);
        }else if(value_type == this.VALUE_TYPE_COUNTORDERS){
            result = dao.countOrdersByDishIdsAndOrderTime(ids, startTime, endTime);
        }else if(value_type == this.VALUE_TYPE_SALESPRICE){
            result = dao.sumSalesPriceByDishIdsAndOrderTime(ids, startTime, endTime);
        }else if(value_type == this.VALUE_TYPE_COST){
            result = dao.sumCostByDishIdsAndOrderTime(ids, startTime, endTime);
        }else if(value_type == this.VALUE_TYPE_SALESPRICEPROPORTION){
            Integer sumSalesPrice = dao.sumSalesPriceByAllDishIdsAndOrderTime(startTime, endTime);
            result = dao.sumSalesPriceByDishIdsAndOrderTime(ids, startTime, endTime);
            for(Object[] obj : result){
                BigDecimal bd = new BigDecimal((long)obj[1]/(float)sumSalesPrice*100);
                bd = bd.setScale(2, RoundingMode.DOWN);
                obj[1] = bd.doubleValue();
            }
        }
        return result;
    }
    
    public List<Object[]> getDateResult(int value_type, List<Map<String,Object>> dateList){
        List<Object[]> result = new ArrayList<>();
        Integer allValue = null;
        System.out.println(dateList);
        if(value_type == this.VALUE_TYPE_SALESPRICEPROPORTION){            
            Timestamp startTime = new Timestamp((Long)dateList.get(0).get("start"));
            Timestamp endTime = new Timestamp((Long)dateList.get(dateList.size()-1).get("end"));
            allValue = dao.sumSalesPriceByOrderTime(startTime, endTime);
        }
        for(Map<String,Object> map : dateList ){
            Timestamp startTime = new Timestamp((Long)map.get("start"));
            Timestamp endTime = new Timestamp((Long)map.get("end"));

            Object value = null;
            
            if(value_type == this.VALUE_TYPE_QUANTITY){
                value = dao.sumQuantityByOrderTime( startTime, endTime);
            }else if(value_type == this.VALUE_TYPE_PROFIT){
                value = dao.sumProfitByOrderTime( startTime, endTime);
            }else if(value_type == this.VALUE_TYPE_COUNTORDERS){
                value = dao.countOrdersByOrderTime( startTime, endTime);
            }else if(value_type == this.VALUE_TYPE_SALESPRICE){
                value = dao.sumSalesPriceByOrderTime( startTime, endTime);
            }else if(value_type == this.VALUE_TYPE_COST){
                value = dao.sumCostByOrderTime( startTime, endTime);
            }else if(value_type == this.VALUE_TYPE_SALESPRICEPROPORTION){
                value = dao.sumSalesPriceByOrderTime( startTime, endTime);
                if(value == null){
                    value = 0;
                }
                
                BigDecimal bd = new BigDecimal((Integer)value/(float)allValue*100);
                bd = bd.setScale(2, RoundingMode.DOWN);
                value = bd.doubleValue();
            }            

            Object[] obj = {
                (String)map.get("target"), 
                value
            };
            result.add(obj);
        }

        return result;
    }

    
}
