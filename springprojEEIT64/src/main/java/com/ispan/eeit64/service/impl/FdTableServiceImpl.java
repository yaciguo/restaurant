package com.ispan.eeit64.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.ispan.eeit64.entity.FdTableBean;
import com.ispan.eeit64.repository.FdTableRepository;
import com.ispan.eeit64.service.FdTableService;

public class FdTableServiceImpl implements FdTableService {
    @Autowired
    FdTableRepository dao;
    
    @Override
    public FdTableBean findById(Integer id) {
        return dao.findById(id).get();
    }

    @Override
    public List<FdTableBean> findAll() {
        return dao.findAll();
    }

    @Override
    public Map<String, Object> save(FdTableBean bean) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'save'");
    }

    @Override
    public Map<String, Object> update(FdTableBean bean) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'update'");
    }

    @Override
    public Map<String, Object> deleteById(Integer id) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'deleteById'");
    }

    @Override
    public Map<String, Object> deleteByIdList(List<Integer> ids) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'deleteByIdList'");
    }
    
}
