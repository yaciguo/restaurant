package com.ispan.eeit64.service;

import java.util.List;
import java.util.Map;

import com.ispan.eeit64.entity.BasicSettingsBean;

public interface BasicSettingsService {
    List<BasicSettingsBean> findAll();
    Map<String, String> getAllSettings();
    BasicSettingsBean update(BasicSettingsBean bean);
}
