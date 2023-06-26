package com.ispan.eeit64.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

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

    @Override
    public ClosingTimeBean findById(Integer id) {
        if(dao.existsById(id)){
            return dao.findById(id).get();
        }else{
            return null;
        }
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
