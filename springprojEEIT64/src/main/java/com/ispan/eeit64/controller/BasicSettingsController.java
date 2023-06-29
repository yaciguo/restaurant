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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.eeit64.controller.APIResult.APIResult;
import com.ispan.eeit64.controller.APIResult.StatusCode;
import com.ispan.eeit64.entity.ClosingTimeBean;
import com.ispan.eeit64.entity.FdTableBean;
import com.ispan.eeit64.entity.OpeningHourBean;
import com.ispan.eeit64.service.impl.ClosingTimeServiceImpl;
import com.ispan.eeit64.service.impl.FdTableServiceImpl;
import com.ispan.eeit64.service.impl.OpeningHourServiceImpl;
import com.ispan.eeit64.validator.ClosingTimeValidator;
import com.ispan.eeit64.validator.OpeningHourValidator;

@Controller
@RequestMapping("/basicSettings.api")
public class BasicSettingsController {    
    @Autowired
    OpeningHourServiceImpl openingHourService;
    @Autowired
    ClosingTimeServiceImpl closingTimeService;
    @Autowired
    FdTableServiceImpl FdTableService;
    @Autowired
    Environment env;
    
    // OpeningHour
    @GetMapping("/getAllOpeningHour")
    public @ResponseBody List<OpeningHourBean> getAllOpeningHour(){
        return openingHourService.findAll();
    }
    
    @PostMapping("/addOpeningHour")
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

    @PutMapping("/editOpeningHour")
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

    @DeleteMapping("/deleteOpeningHour")
    public @ResponseBody Map<String, Object> deleteOpeningHour(
            @RequestBody List<Integer> ids
    ){
        Map<String, Object> map = openingHourService.deleteByIdList(ids);
        return map;
    }

    
    // ClosingTime

    // @GetMapping("/getClosingTime")
    // public @ResponseBody List<ClosingTimeBean> getClosingTime(){
    //     return closingTimeService.findAll();
    // }
    
    @GetMapping("/getAllClosingTime")
    public @ResponseBody Map<String, Object> getAllClosingTime(){
        try {
            return closingTimeService.getAllDate();
        } catch (Exception e) {
            Map<String, Object> map = new HashMap<>();
            map.put("error", "無法獲取資料");
            return map;
        }
    }

    @PostMapping("/addClosingTime")
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
    
    @PutMapping("/editClosingTime")
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
    
    @DeleteMapping("/deleteClosingTime")
    public @ResponseBody Map<String, Object> deleteClosingTime(
            @RequestBody List<Integer> ids
    ){
        Map<String, Object> map = closingTimeService.deleteByIdList(ids);
        return map;
    }
        
    // FdTable
    @GetMapping("/getAllFdTable")
    public @ResponseBody APIResult getAllFdTable(){
        try {
            APIResult result = new APIResult(StatusCode.SUCCESS, FdTableService.findAll(), "成功獲取資料");
            return result;
        } catch (Exception e) {
            APIResult result = new APIResult(StatusCode.ERROR, null, "無法獲取資料");
            return result;
        }
    }

    @PostMapping("/addFdTable")
    public @ResponseBody APIResult addFdTable(
            @RequestBody FdTableBean bean,
            HttpServletRequest request,
            BindingResult result){
        try {
            APIResult apiResult = new APIResult(StatusCode.SUCCESS, FdTableService.saveAndUpdate(bean), "成功儲存資料");
            return apiResult;
        } catch (Exception e) {
            APIResult apiResult = new APIResult(StatusCode.ERROR, null, "無法儲存資料");
            return apiResult;
        }
    }

    @PutMapping("/editFdTable")
    public @ResponseBody APIResult editFdTable(
            @RequestBody FdTableBean bean,
            HttpServletRequest request,
            BindingResult result
    ){
        try {
            APIResult apiResult = new APIResult(StatusCode.SUCCESS, FdTableService.saveAndUpdate(bean), "成功修改資料");
            return apiResult;
        } catch (Exception e) {
            APIResult apiResult = new APIResult(StatusCode.ERROR, null, "無法修改資料");
            return apiResult;
        }
    }

    @DeleteMapping("/deleteFdTable")
    public @ResponseBody APIResult deleteFdTable(
            @RequestBody List<Integer> ids
    ){
        try {
            FdTableService.deleteByIdList(ids);
            APIResult apiResult = new APIResult(StatusCode.SUCCESS, null, "成功刪除資料");
            return apiResult;
        } catch (Exception e) {
            APIResult apiResult = new APIResult(StatusCode.ERROR, null, "無法修改資料");
            return apiResult;
        }
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
