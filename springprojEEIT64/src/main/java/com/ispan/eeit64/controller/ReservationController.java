package com.ispan.eeit64.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan.eeit64.entity.OrderBean;
import com.ispan.eeit64.entity.ReservationBean;
import com.ispan.eeit64.service.impl.ReservationServiceImpl;

@Controller
public class ReservationController {
    final static Logger log = LoggerFactory.getLogger(ReservationController.class);
    ReservationServiceImpl service;

    @Autowired
    public ReservationController(ReservationServiceImpl service) {
        this.service = service;
    }
    
//    @PostMapping("/booking")
//    public String submitReservationForm(@RequestBody Map<String, Object> reservation) {
//    	// 从 JSON 数据中获取特定字段的值
//    	  String pNumber = (String) reservation.get("pNumber");
//    	  String date = (String) reservation.get("date");
//    	  String time = (String) reservation.get("time");
//    	  String name = (String) reservation.get("name");
//    	  String gender = (String) reservation.get("gender");
//    	  String phone = (String) reservation.get("phone");
//    	  String email = (String) reservation.get("email");
//    	  String note = (String) reservation.get("note");
//    	  
//    	  ReservationBean bean = new ReservationBean();
//    	  bean.setName(name);
//    	  bean.setGender(gender);
//    	  bean.setPhone(phone);
//    	  bean.setpNumber(pNumber);
//    	  bean.setDate(Date.valueOf(date));
//    	  bean.setStartTime(Time.valueOf(time));
//       // 設定結束時間為開始時間 + 1小時
//          long startTimeMillis = bean.getStartTime().getTime();
//          long endTimeMillis = startTimeMillis + (60 * 60 * 1000);
//          bean.setEndTime(new Time(endTimeMillis));
//          bean.setEmail(email);
//          bean.setNote(note);
//          bean.setSubmitTime(new Timestamp(System.currentTimeMillis()));
//          bean.setFdTableBean(null);
//    	  
//
//    	 service.save(bean);
//    	 return "提交成功";
//    	 
//    }
    
    
//    //提交預定位子訂單
//    @PostMapping("/booking")
//    public String submitReservationForm(@RequestParam(value = "pNumber", required = true) String pNumber,
//                                        @RequestParam("date") Date date,
//                                        @RequestParam("time") Time time,
//                                        @RequestParam("name") String name,
//                                        @RequestParam("gender") String gender,
//                                        @RequestParam("phone") String phone,
//                                        @RequestParam("email") String email,
//                                        @RequestParam("note") String note) {
//        // 解析日期和时间字符串
//        LocalDate reservationDate = LocalDate.parse((CharSequence) date);
//        LocalTime reservationTime = LocalTime.parse((CharSequence) time);
//
//        // 创建 ReservationBean 对象并设置属性值
//        ReservationBean reservation = new ReservationBean();
//        reservation.setpNumber(pNumber);
//        reservation.setDate(Date.valueOf(reservationDate));
//        reservation.setStartTime(Time.valueOf(reservationTime));
//        
//        // 设置结束时间为开始时间 + 1小时
//        LocalTime endTime = reservationTime.plusHours(1);
//        reservation.setEndTime(Time.valueOf(endTime));
//
//        reservation.setName(name);
//        reservation.setGender(gender);
//        reservation.setPhone(phone);
//        reservation.setEmail(email);
//        reservation.setNote(note);
//
//        service.save(reservation);
//
//        return "提交成功";
//    }
//    
    
    
    
//查詢預約頁面======================================================
//    @GetMapping("/reservation")
//    public String showReservationForm(@RequestParam(value = "name", required = false) String name,
//                                      @RequestParam(value = "phone", required = false) String phone,
//                                      Model model) {
//        if (name == null) {
//            name = "";
//        }
//        if (phone == null) {
//            phone = "";
//        }
//
//        model.addAttribute("name", name);
//        model.addAttribute("phone", phone);
//
//        return "searchbooking";
//    }

    @PostMapping("/reservation")
    public String submitReservationForm(@ModelAttribute ReservationBean bean, Model model) {
    	String name = bean.getName();
	    String phone = bean.getPhone();
	    if (name == null || phone == null) {
            // 前端未輸入值，直接返回 "searchorder" 視圖
            return "searchbooking";
        }
        List<ReservationBean> reservations = service.findBynameAndPhone(name, phone);
        if (reservations.isEmpty()) {
            model.addAttribute("noDataMessage", "查無此訂位資料，請重新查詢!");
        } else {
            model.addAttribute("reservationList", reservations);
        }

        return "searchbooking";
    }
    
    
    
    
}