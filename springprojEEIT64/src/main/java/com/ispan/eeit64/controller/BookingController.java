package com.ispan.eeit64.controller;


import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
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
                response.put("error", "所選日期已無座位。");
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
    
    
    
    
    //=================================前端提供人數來找可用日期================================================================
    @GetMapping("/custIndex/availableTimes")
    @ResponseBody
    public List<String> getAvailableTimes(@RequestParam("pNumber") String pNumber, @RequestParam("date") String dateString) {
        
        
        // 將 pNumber 轉整數
        Integer numberOfPeople = Integer.parseInt(pNumber);
        
     // 根据人数查询对应的桌子ID数组
        List<FdTableBean> availableTableIds = new ArrayList<>();
        if (numberOfPeople <= 2) {
            availableTableIds = service.getTableIdsByCapacity(2);
        } else if (numberOfPeople <= 4) {
            availableTableIds = service.getTableIdsByCapacity(4);
        }
     // 篩選可預訂的時間
        Map<Integer, List<Time>> availableTimes = service.getAvailableTimes(availableTableIds, dateString);
     // 取出時間並放入不重複的列表中
        Set<String> distinctTimes = new HashSet<>();
        for (List<Time> times : availableTimes.values()) {
            for (Time time : times) {
                distinctTimes.add(time.toString());
            }
        }
        
        return new ArrayList<>(distinctTimes);
    }
    
    
    
    
    
    
  
    
    
    
//    @GetMapping("/custIndex/availabledates")
//    @ResponseBody
//    public List<String> getAvailableDates(@RequestParam("people") String people) {
//      // 在这里根据选择的人数和业务逻辑计算可用日期和时间
//
//    	  List<String> availableDates = new ArrayList<>();
//    	  // 将people参数转换为整数
//    	  int numPeople = Integer.parseInt(people);
//    	  if (numPeople <= 2) {
//    	    // 如果人数小于等于2，找容纳2人的桌子ID
//    	    Integer tableId = findTableForPeople(2);
//    	    if (tableId != null) {
//    	      // 根据桌子ID查询可订位日期，假设调用名为findAvailableDates的方法
//    	      List<String> dates = findAvailableDates(tableId);
//    	      availableDates.addAll(dates);
//    	    }
//    	  } else if (numPeople <= 4) {
//    	    // 如果人数大于2且小于等于4，找容纳4人的桌子ID
//    	    Integer tableId = findTableForPeople(4);
//    	    if (tableId != null) {
//    	      // 根据桌子ID查询可订位日期，假设调用名为findAvailableDates的方法
//    	      List<String> dates = findAvailableDates(tableId);
//    	      availableDates.addAll(dates);
//    	    }
//    	  }
//
//    	  return availableDates;
//    }
//    
//    private List<String> findAvailableDates(Integer tableId) {
//    	  // 在这里根据桌子ID查询未来七天内的可订位日期的业务逻辑
//    	  List<String> dates = new ArrayList<>();
//
//    	  // 获取当前日期
//    	  LocalDate currentDate = LocalDate.now();
//
//    	  // 循环添加未来七天的日期
//    	  for (int i = 0; i < 7; i++) {
//    	    LocalDate date = currentDate.plusDays(i);
//    	    dates.add(date.toString());
//    	  }
//
//    	  return dates;
//    	}
//    
//    
//    
//    private Integer findTableForPeople(Integer capacity) {
//    	// 在这里根据桌子容纳人数的业务逻辑找到合适的桌子ID或号码
//    	  // 假设使用FdTableRepository来查询桌子ID
//    	FdTableBean table;
//    	  if (capacity == 2) {
//    	    table = fdTableRepository.findTableByCapacity(2);
//    	  } else if (capacity == 4) {
//    	    table = fdTableRepository.findTableByCapacity(4);
//    	  } else {
//    	    return null;
//    	  }
//
//    	  if (table != null) {
//    	    return table.getTableId(); // 假设桌子实体类中有id字段，返回桌子ID
//    	  }
//    	  return null;
//      }
    
    //==================================================================================================
    
    
    
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
