package com.ispan.eeit64.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.eeit64.entity.ClosingTimeBean;
import com.ispan.eeit64.entity.OpeningHourBean;
import com.ispan.eeit64.service.impl.ClosingTimeServiceImpl;
import com.ispan.eeit64.service.impl.OpeningHourServiceImpl;
import com.ispan.eeit64.validator.ClosingTimeValidator;
import com.ispan.eeit64.validator.OpeningHourValidator;

@Controller
public class basicSettingsController {    
    @Autowired
    OpeningHourServiceImpl openingHourService;
    @Autowired
    ClosingTimeServiceImpl closingTimeService;
    @Autowired
    Environment env;
        
    @GetMapping("/basicSettings.api/getAllOpeningHour")
    public @ResponseBody List<OpeningHourBean> getAllOpeningHour(){
        return openingHourService.findAll();
    }
    
    @PostMapping("/basicSettings.api/addOpeningHour")
    public @ResponseBody Map<String, Object> addOpeningHour(
            @RequestBody OpeningHourBean bean,
            HttpServletRequest request,
            BindingResult result
    ){
        Map<String, Object> map = new HashMap<>();
        new OpeningHourValidator().validate(bean, result, request.getMethod(), openingHourService);

        if (result.hasErrors()) {
            collectErrorMessage(map, result);
            return map;
        }else{
            map = openingHourService.save(bean);
            return map;
        }
    }

    @PutMapping("/basicSettings.api/editOpeningHour")
    public @ResponseBody Map<String, Object> editOpeningHour(
            @RequestBody OpeningHourBean bean,
            HttpServletRequest request,
            BindingResult result
    ){
        Map<String, Object> map = new HashMap<>();
        
        new OpeningHourValidator().validate(bean, result, request.getMethod(), openingHourService);
        
        if (result.hasErrors()) {
            collectErrorMessage(map, result);
            return map;
        }else{
            map = openingHourService.update(bean);
            return map;
        }
    }

    @DeleteMapping("/basicSettings.api/deleteOpeningHour")
    public @ResponseBody Map<String, Object> deleteOpeningHour(
            @RequestBody List<Integer> ids
    ){
        Map<String, Object> map = openingHourService.deleteByIdList(ids);
        return map;
    }

    // @GetMapping("/basicSettings.api/getClosingTime")
    // public @ResponseBody List<ClosingTimeBean> getClosingTime(){
    //     return closingTimeService.findAll();
    // }
    
    @GetMapping("/basicSettings.api/getAllClosingTime")
    public @ResponseBody Map<String, Object> getAllClosingTime(){
        try {
            return closingTimeService.getAllDate();
        } catch (Exception e) {
            Map<String, Object> map = new HashMap<>();
            map.put("error", "無法獲取資料");
            return map;
        }
    }

    @PostMapping("/basicSettings.api/addClosingTime")
    public @ResponseBody Map<String, Object> addClosingTime(
            @RequestBody ClosingTimeBean bean,
            HttpServletRequest request,
            BindingResult result
    ){
        Map<String, Object> map = new HashMap<>();
        new ClosingTimeValidator().validate(bean, result, request.getMethod(), closingTimeService);

        if (result.hasErrors()) {
            collectErrorMessage(map, result);
            return map;
        }else{
            map = closingTimeService.save(bean);
            return map;
        }
    }
    
    @PutMapping("/basicSettings.api/editClosingTime")
    public @ResponseBody Map<String, Object> editClosingTime(
            @RequestBody ClosingTimeBean bean,
            HttpServletRequest request,
            BindingResult result
    ){
        Map<String, Object> map = new HashMap<>();
        
        new ClosingTimeValidator().validate(bean, result, request.getMethod(), closingTimeService);
        
        if (result.hasErrors()) {
            collectErrorMessage(map, result);
            return map;
        }else{
            map = closingTimeService.update(bean);
            return map;
        }
    }
    
    @DeleteMapping("/basicSettings.api/deleteClosingTime")
    public @ResponseBody Map<String, Object> deleteClosingTime(
            @RequestBody List<Integer> ids
    ){
        Map<String, Object> map = closingTimeService.deleteByIdList(ids);
        return map;
    }
    
    public void collectErrorMessage(Map<String, Object> map, BindingResult result) {
        List<FieldError> list = result.getFieldErrors();
        Map<String, String> errors = new HashMap<>();
        map.put("errors", errors);
        for (FieldError error : list) {
            String defaulMessage = error.getDefaultMessage();
            errors.put(error.getField(), defaulMessage);
        }
    }

}
