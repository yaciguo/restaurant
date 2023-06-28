package com.ispan.eeit64.service;

import java.util.List;
import java.util.Map;

import com.ispan.eeit64.entity.FdTableBean;

public interface FdTableService {
    FdTableBean findById(Integer id);
    List<FdTableBean> findAll();
    Map<String, Object> save(FdTableBean bean);
    Map<String, Object> update(FdTableBean bean);
    Map<String, Object> deleteById(Integer id);
    Map<String, Object> deleteByIdList(List<Integer>ids);
}
