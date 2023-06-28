package com.ispan.eeit64.service;

import java.util.List;
import java.util.Map;

import com.ispan.eeit64.entity.ClosingTimeBean;

public interface ClosingTimeService {
    ClosingTimeBean findById(Integer id);
    List<ClosingTimeBean> findAll();
    Map<String, Object> save(ClosingTimeBean bean);
    Map<String, Object> update(ClosingTimeBean bean);
    Map<String, Object> deleteById(Integer id);
    Map<String, Object> deleteByIdList(List<Integer>ids);
}
