package com.ispan.eeit64.service.impl;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.eeit64.repository.OrderRepository;

@Service
@Transactional
public class DataAnalysisServiceImpl {
    public final int YEAR = 0;
    public final int MONTH = 1;
    public final int DAY = 2;

    public final int DISH_METHOD = 0;
    public final int CATEGORY_METHOD = 1;
    public final int YEAR_METHOD = 2;
    public final int MONTH_METHOD = 3;
    public final int DAY_METHOD = 4;

    @Autowired
    OrderRepository dao;

    public List<Map<String,Object>> splitDate(int method, Date startDate, Date endDate){
        SimpleDateFormat y = new SimpleDateFormat("yyyy");
        SimpleDateFormat ym = new SimpleDateFormat("yyyy-MM");
        SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
        List<Map<String,Object>> sections = new ArrayList<>();
        while(startDate.getTime() < endDate.getTime()){
            Map<String,Object> map = new HashMap<>();
            map.put("start", startDate.getTime());
            if(method == this.YEAR){
                map.put("target", y.format(startDate));
                startDate.setMonth(0);
                startDate.setDate(1);
                startDate.setYear(startDate.getYear()+1);
            }else if(method == this.MONTH){
                map.put("target", ym.format(startDate));
                startDate.setDate(1);
                startDate.setMonth(startDate.getMonth()+1);
            }else if(method == this.DAY){
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

    public List<Map<String,Object>> getQuantity(int method, Set<Integer> ids, Date startDate, Date endDate){
        Timestamp startTime = new Timestamp(startDate.getTime());
        Timestamp endTime = new Timestamp(endDate.getTime());
        List<Object[]> result = new ArrayList<>();
        List<Map<String,Object>> dateList = new ArrayList<>();
        if(method == this.CATEGORY_METHOD){
            result = dao.sumQuantityByCategoryIdsAndOrderTime(ids, startTime, endTime);
        }else if(method == this.DISH_METHOD){
            result = dao.sumQuantityByDishIdsAndOrderTime(ids, startTime, endTime);
        }else if(method == this.YEAR_METHOD){
            dateList = splitDate(this.YEAR, startDate, endDate);
        }else if(method == this.MONTH_METHOD){
            dateList = splitDate(this.MONTH, startDate, endDate);
        }else if(method == this.DAY_METHOD){
            dateList = splitDate(this.DAY, startDate, endDate);
        }
        if(method == this.YEAR_METHOD || method == this.MONTH_METHOD || method == this.DAY_METHOD){
            for(Map<String,Object> map : dateList ){                
                Object[] obj = {
                    (String)map.get("target"), 
                    dao.sumQuantityByOrderTime(
                        new Timestamp((Long)map.get("start")),
                        new Timestamp((Long)map.get("end")))
                };
                result.add(obj);
            }
        }

        List<Map<String,Object>> data = new ArrayList<>();
        for(Object[] obj : result){
            Map<String,Object> map = new HashMap<>();
            map.put("target", obj[0]);
            map.put("value", obj[1]);
            data.add( map);
        }
        return data;
    }

    public List<Map<String,Object>> getProfit(int method, Set<Integer> ids, Date startDate, Date endDate){
        Timestamp startTime = new Timestamp(startDate.getTime());
        Timestamp endTime = new Timestamp(endDate.getTime());
        List<Object[]> result = new ArrayList<>();
        List<Map<String,Object>> dateList = new ArrayList<>();
        if(method == this.CATEGORY_METHOD){
            result = dao.sumProfitByCategoryIdsAndOrderTime(ids, startTime, endTime);
        }else if(method == this.DISH_METHOD){
            result = dao.sumProfitByDishIdsAndOrderTime(ids, startTime, endTime);
        }else if(method == this.YEAR_METHOD){
            dateList = splitDate(this.YEAR, startDate, endDate);
        }else if(method == this.MONTH_METHOD){
            dateList = splitDate(this.MONTH, startDate, endDate);
        }else if(method == this.DAY_METHOD){
            dateList = splitDate(this.DAY, startDate, endDate);
        }
        if(method == this.YEAR_METHOD || method == this.MONTH_METHOD || method == this.DAY_METHOD){
            for(Map<String,Object> map : dateList ){                
                Object[] obj = {
                    (String)map.get("target"), 
                    dao.sumProfitByOrderTime(
                        new Timestamp((Long)map.get("start")),
                        new Timestamp((Long)map.get("end")))
                };
                result.add(obj);
            }
        }

        List<Map<String,Object>> data = new ArrayList<>();
        for(Object[] obj : result){
            Map<String,Object> map = new HashMap<>();
            map.put("target", obj[0]);
            map.put("value", obj[1]);
            data.add( map);
        }
        return data;
    }

    public List<Map<String,Object>> getCountOrders(int method, Set<Integer> ids, Date startDate, Date endDate){
        Timestamp startTime = new Timestamp(startDate.getTime());
        Timestamp endTime = new Timestamp(endDate.getTime());
        List<Object[]> result = new ArrayList<>();
        List<Map<String,Object>> dateList = new ArrayList<>();
        if(method == this.CATEGORY_METHOD){
            result = dao.countOrdersByCategoryIdsAndOrderTime(ids, startTime, endTime);
        }else if(method == this.DISH_METHOD){
            result = dao.countOrdersByDishIdsAndOrderTime(ids, startTime, endTime);
        }else if(method == this.YEAR_METHOD){
            dateList = splitDate(this.YEAR, startDate, endDate);
        }else if(method == this.MONTH_METHOD){
            dateList = splitDate(this.MONTH, startDate, endDate);
        }else if(method == this.DAY_METHOD){
            dateList = splitDate(this.DAY, startDate, endDate);
        }
        if(method == this.YEAR_METHOD || method == this.MONTH_METHOD || method == this.DAY_METHOD){
            for(Map<String,Object> map : dateList ){                
                Object[] obj = {
                    (String)map.get("target"), 
                    dao.countOrdersByOrderTime(
                        new Timestamp((Long)map.get("start")),
                        new Timestamp((Long)map.get("end")))
                };
                result.add(obj);
            }
        }

        List<Map<String,Object>> data = new ArrayList<>();
        for(Object[] obj : result){
            Map<String,Object> map = new HashMap<>();
            map.put("target", obj[0]);
            map.put("value", obj[1]);
            data.add( map);
        }
        return data;
    }
}
