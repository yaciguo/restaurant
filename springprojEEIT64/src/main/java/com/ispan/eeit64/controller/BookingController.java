package com.ispan.eeit64.controller;


import java.sql.Time;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.eeit64.entity.ReservationBean;
import com.ispan.eeit64.service.impl.ReservationServiceImpl;

@Controller
public class BookingController {
	@Autowired
	ReservationServiceImpl service;
	
	@GetMapping("/booking")
	public String booking(Model model) {
	    model.addAttribute("newbooking", new ReservationBean());
	    return "booking";
	}
	
//    @GetMapping("/booking-form")
//    public ModelAndView showBookingForm() {
//        ModelAndView modelAndView = new ModelAndView("booking-form");
//        modelAndView.addObject("newbooking", new ReservationBean());
//        return modelAndView;
//    }
//===================================================ok
    @PostMapping("/newbooking")
    @ResponseBody
    public Map<String, String> createBooking(@RequestBody ReservationBean bean) {
        Map<String, String> response = new HashMap<>();
   
        bean.setSubmitTime(new Timestamp(System.currentTimeMillis()));
        //設定startime及endtime
        Time startTime = bean.getStartTime();
        bean.setStartTime(startTime);
        long startTimeMillis = bean.getStartTime().getTime();
        long endTimeMillis = startTimeMillis + (60 * 60 * 1000);
        bean.setEndTime(new Time(endTimeMillis));
               
        
        service.save(bean);
     // 印出插入後的 ID
        System.out.println(bean.getId()); 
//        return "bookingcheck";
        
        response.put("success", "新增成功");
        return response;
        
    }
    
 // 另一个createBooking方法返回視圖名稱
    @PostMapping("/bookingcheck")
    public String createBookingView(@ModelAttribute("booking") ReservationBean bean, Model model) {
        // 处理逻辑
        service.save(bean);
        model.addAttribute("booking", bean); // 将booking对象添加到模型中
        return "redirect:/bookingcheck";
    }
	
	
//============================================================ok
	//======================test
//	@PostMapping("/newbooking")
//	public String createBooking(@ModelAttribute("booking") ReservationBean bean, Model model) {
//	    // 处理逻辑
//	    bean.setSubmitTime(new Timestamp(System.currentTimeMillis()));
//	    // 设置startime及endtime
//	    Time startTime = bean.getStartTime();
//	    bean.setStartTime(startTime);
//	    long startTimeMillis = bean.getStartTime().getTime();
//	    long endTimeMillis = startTimeMillis + (60 * 60 * 1000);
//	    bean.setEndTime(new Time(endTimeMillis));
//	    service.save(bean);
//	    // 印出插入后的 ID
//	    System.out.println(bean.getId()); 
//	    model.addAttribute("booking", bean); // 将booking对象添加到模型中
//	    return "redirect:/bookingcheck";
//	}
//	
	
	
	
	
	
	
	
//================================================================test	
    
    
//    @PostMapping("/bookingcheck")
//    public String createBookingView(@RequestBody ReservationBean bean, Model model) {
//        // 处理逻辑
//    	 service.save(bean);
//    	 model.addAttribute("booking", bean);
//        return "bookingcheck";
//    }
}
