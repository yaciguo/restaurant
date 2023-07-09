package com.ispan.eeit64.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.eeit64.entity.ClosingTimeBean;
import com.ispan.eeit64.repository.ClosingTimeRepository;
import com.ispan.eeit64.service.ClosingTimeService;

@Service
@Transactional
public class ClosingTimeServiceImpl implements ClosingTimeService {
    @Autowired
    ClosingTimeRepository dao;
    
    Map<Integer, String> dayOfWeek = new HashMap<>();

    public ClosingTimeServiceImpl(){
        dayOfWeek.put(0, "星期日");
        dayOfWeek.put(1, "星期一");
        dayOfWeek.put(2, "星期二");
        dayOfWeek.put(3, "星期三");
        dayOfWeek.put(4, "星期四");
        dayOfWeek.put(5, "星期五");
        dayOfWeek.put(6, "星期六");
    }

    @Override
    public ClosingTimeBean findById(Integer id) {
        if(dao.existsById(id)){
            return dao.findById(id).get();
        }else{
            return null;
        }
    }
    
    private Map<String, String> getDateMap(Date date){
        SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
        ymd.setTimeZone(TimeZone.getTimeZone("Asia/Taipei"));
        SimpleDateFormat hm = new SimpleDateFormat("HH:mm");
        hm.setTimeZone(TimeZone.getTimeZone("Asia/Taipei"));
        Map<String, String> dateMap = new HashMap<>();
        dateMap.put("date", ymd.format(date));
        dateMap.put("time", hm.format(date));
        dateMap.put("day", dayOfWeek.get(date.getDay()));
        return dateMap;
    }

    public Map<String, Object> getAllDate() throws ParseException {
        List<ClosingTimeBean> beanList = dao.findAll();
        Map<String, Object> result = new HashMap<>();
        List<Map> nowList = new ArrayList<>();
        List<Map> oldList = new ArrayList<>();
        result.put("now", nowList);
        result.put("old", oldList);

        Date nowDate = new Date();	
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    sdf.setTimeZone(TimeZone.getTimeZone("Asia/Taipei") );
        for(ClosingTimeBean bean : beanList){
            Map<String, Object> map = new HashMap<>();
            Map<String, String> startDateMap = getDateMap(bean.getStartDate());
            Map<String, String> endDateMap = getDateMap(bean.getEndDate());
            map.put("id", bean.getId());
            map.put("start", startDateMap);
            map.put("end", endDateMap);
            map.put("description", bean.getDescription());
            if(nowDate.getTime() >= sdf.parse(bean.getEndDate().toString()).getTime()){
                oldList.add(map);
            }else{
                nowList.add(map);
            }
        }
        return result;
    }
    
    @Override
    public List<ClosingTimeBean> findAll() {
        return dao.findAll();
    }

    @Override
    public Map<String, Object> save(ClosingTimeBean bean) {
        Map<String, Object> map = new HashMap<>();
        dao.save(bean);
        map.put("success", "新增成功");
        return map;
    }

    @Override
    public Map<String, Object> update(ClosingTimeBean bean) {
        Map<String, Object> map = new HashMap<>();
        dao.save(bean);
        map.put("success", "修改成功");
        return map;
    }

    @Override
    public Map<String, Object> deleteById(Integer id) {
        List<Integer> ids = Arrays.asList(id);
        return deleteByIdList(ids);
    }

    @Override
    public Map<String, Object> deleteByIdList(List<Integer> ids) {
        Map<String, Object> map = new HashMap<>();
        List<Integer> failureId = new LinkedList<>();
        List<Integer> successId = new LinkedList<>();
        List<Integer> errorId = new LinkedList<>();
        for(Integer id : ids) {
            if(dao.existsById(id)) {
                dao.deleteById(id);
                if(dao.existsById(id)) {
                    failureId.add(id);
                }else {
                    successId.add(id);    
                }
            }else {
                errorId.add(id);
            }
        }
        if(!failureId.isEmpty()) {
            map.put("failureId", failureId);
        }
        if(!errorId.isEmpty()) {
            map.put("errorId", errorId);
        }
        if(!successId.isEmpty()) {
            map.put("success", successId);
        }
        return map;
    }
    
}
