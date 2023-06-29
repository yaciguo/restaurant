package com.ispan.eeit64.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.eeit64.entity.OpeningHourBean;
import com.ispan.eeit64.service.impl.OpeningHourServiceImpl;

@Controller
public class RestInfoController {
	@Autowired
    OpeningHourServiceImpl openingHourService;
	
	@GetMapping("/getAllOpeningHour")
    public @ResponseBody List<OpeningHourBean> getAllOpeningHour(){
        return openingHourService.findAll();
    }

}
