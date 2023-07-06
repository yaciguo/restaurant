package com.ispan.eeit64.service;

import java.util.List;
import java.util.Map;

import com.ispan.eeit64.entity.OpeningHourBean;

public interface OpeningHourService {

    OpeningHourBean findById(Integer id);
    List<OpeningHourBean> findAll();
    Map<String, Object> save(OpeningHourBean bean);
    Map<String, Object> update(OpeningHourBean bean);
    Map<String, Object> deleteById(Integer id);
    Map<String, Object> deleteByIdList(List<Integer>ids);
}
