package com.ispan.eeit64.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.eeit64.entity.BasicSettingsBean;
import com.ispan.eeit64.repository.BasicSettingsRepository;
import com.ispan.eeit64.service.BasicSettingsService;

@Service
@Transactional
public class BasicSettingsServiceImpl implements BasicSettingsService{
    @Autowired
    BasicSettingsRepository dao;

    @Override
    public List<BasicSettingsBean> findAll() {
        return dao.findAll();
    }

    @Override
    public Map<String, String> getAllSettings(){
        Map<String, String> map = new HashMap<>();
        List<BasicSettingsBean> beans = dao.findAll();
        for(BasicSettingsBean bean : beans){
            map.put(bean.getSetName(), bean.getSetValue());
        }
        return map;
    }

    @Override
    public BasicSettingsBean update(BasicSettingsBean bean) {
        return dao.save(bean);
    }
}
