package com.ispan.eeit64.service;

import java.util.List;

import com.ispan.eeit64.entity.FdTableBean;

public interface FdTableService {
    boolean existsById(Integer id);
    FdTableBean findById(Integer id);
    List<FdTableBean> findAll();
    FdTableBean saveAndUpdate(FdTableBean bean);
    void deleteById(Integer id);
    void deleteByIdList(List<Integer>ids);
}
