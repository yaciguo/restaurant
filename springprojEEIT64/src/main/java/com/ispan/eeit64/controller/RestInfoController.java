package com.ispan.eeit64.controller;

import java.time.LocalDate;
import java.util.ArrayList;
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
	
	@GetMapping("/custIndex/getAllOpeningHour")
    public @ResponseBody List<OpeningHourBean> getAllOpeningHour(){
		System.out.println("getAllOpeningHour====================");
        return openingHourService.findAll();
    }
	
	@GetMapping("/custIndex/getOpeningHoursForToday")
	public @ResponseBody List<OpeningHourBean> getOpeningHoursForToday() {
		System.out.println("==============getOpeningHoursForToday====================");
		LocalDate today = LocalDate.now();
	    int todayDayOfWeek = today.getDayOfWeek().getValue();
	    List<OpeningHourBean> allOpeningHours = openingHourService.findAll();

	    List<OpeningHourBean> openingHoursForToday = new ArrayList<>();
	    for (OpeningHourBean openingHour : allOpeningHours) {
	        if (openingHour.getDayOfWeek() == todayDayOfWeek) {
	            openingHoursForToday.add(openingHour);
	        }
	    }

        return openingHoursForToday;
    }

}
