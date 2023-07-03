package com.ispan.eeit64.controller;


import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ispan.eeit64.entity.FdTableBean;
import com.ispan.eeit64.entity.ReservationBean;
import com.ispan.eeit64.repository.FdTableRepository;
import com.ispan.eeit64.service.impl.ReservationServiceImpl;

@Controller
public class BookingController {
	@Autowired
	private ReservationServiceImpl service;
	
	@Autowired
	private FdTableRepository fdTableRepository;
	
	
	@GetMapping("/booking")
	public String booking(Model model) {
	    model.addAttribute("newbooking", new ReservationBean());
	    return "booking";
	}
	

//===================================================ok
    @PostMapping("/custIndex/newbooking")
    @ResponseBody
    public Map<String, String> createBooking(@RequestBody ReservationBean bean) {
        Map<String, String> response = new HashMap<>();
        
        
     // 解析日期字符串为java.sql.Date对象
        java.sql.Date sqlDate = bean.getDate();

     // 将sqlDate设置到实体类的date属性中
        bean.setDate(sqlDate);
        
        bean.setSubmitTime(new Timestamp(System.currentTimeMillis()));
        //設定startime及endtime
        Time startTime = bean.getStartTime();
        bean.setStartTime(startTime);
        long startTimeMillis = bean.getStartTime().getTime();
        long endTimeMillis = startTimeMillis + (60 * 60 * 1000);
        Time endTime = new Time(endTimeMillis);
        bean.setEndTime(endTime);
        
        
        
     // 獲取可用的桌子ID列表===================
        List<Integer> availableTableIds = service.getAvailableTableIds(bean.getDate(), startTime);
        
        if (availableTableIds.isEmpty()) {
            // 没有可用的桌子
            response.put("error", "抱歉，此時段所有訂位已滿。請選擇其它時段。");
        } else {
        	 // 印出可用的桌子ID
            System.out.println("可用桌子ID列表:");
            for (int tableId : availableTableIds) {
                System.out.println(tableId);
            }
        	
         // 根據訂位人數選擇桌子
            int selectedTableId = selectTableByCapacity(availableTableIds, bean.getpNumber());
            
            if (selectedTableId != -1) {
                // 獲取選定的桌子信息
                FdTableBean selectedTable = fdTableRepository.findById(selectedTableId).orElse(null);
                if (selectedTable != null) {
                    bean.setFdTableBean(selectedTable);

                    // 保存預訂
                    service.save(bean);
                    // 印出插入後的 ID
                    System.out.println(bean.getId());

                    response.put("success", "預定成功！您的桌子號碼為：" + selectedTableId);
                } else {
                    response.put("error", "無法獲取選定的桌子信息。請稍後再試。");
                }
            } else {
                response.put("error", "所選日期已無可容納您的人數之座位。");
            }
        }

        return response;
        
    }
    
 // 根據訂位人數選擇桌子
    private int selectTableByCapacity(List<Integer> availableTableIds, int pNumber) {
        for (int tableId : availableTableIds) {
            FdTableBean table = fdTableRepository.findById(tableId).orElse(null);
            if (table != null) {
                int capacity = table.getCapacity();
                if (pNumber <= 2 && capacity == 2) {
                    return tableId;
                } else if (pNumber > 2 && pNumber <= 4 && capacity == 4) {
                    return tableId;
                }
            }
        }
        return -1; // 表示找不到符合條件的桌子
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
