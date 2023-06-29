package com.ispan.eeit64.service;

import java.util.List;
import java.util.Map;

import com.ispan.eeit64.entity.FdTableBean;

public interface FdTableService {
    FdTableBean findById(Integer id);
    List<FdTableBean> findAll();
    FdTableBean saveAndUpdate(FdTableBean bean);
    void deleteById(Integer id);
    void deleteByIdList(List<Integer>ids);
}
