package com.ispan.eeit64.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.eeit64.entity.FdTableBean;
import com.ispan.eeit64.repository.FdTableRepository;
import com.ispan.eeit64.service.FdTableService;

@Service
@Transactional
public class FdTableServiceImpl implements FdTableService {
    @Autowired
    FdTableRepository dao;
    
    @Override
    public boolean existsById(Integer id) {
        return dao.existsById(id);
    }

    @Override
    public FdTableBean findById(Integer id) {
        return dao.findById(id).get();
    }

    @Override
    public List<FdTableBean> findAll() {
        return dao.findAll();
    }

    @Override
    public FdTableBean saveAndUpdate(FdTableBean bean) {
        dao.save(bean);
        return bean;
    }

    @Override
    public void deleteById(Integer id) {
        List<Integer> ids = Arrays.asList(id);
        deleteByIdList(ids);
    }

    @Override
    public void deleteByIdList(List<Integer> ids) {
        for(Integer id: ids){
            dao.deleteById(id);
        }
    }    
}
