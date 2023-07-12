package com.ispan.eeit64.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


import com.ispan.eeit64.service.TableService;

@RestController
public class TableController {

    private final TableService tableService;

    @Autowired
    public TableController(TableService tableService) {
        this.tableService = tableService;
    }
    
    @PostMapping("/filterData")
    public Map<String, String>  filterData (@RequestBody Map<String, Object>  requestData) {
    	 // 從 requestData 中獲取前端傳來的日期和時間值
        String startDate = (String) requestData.get("startDate");
        String selectedTime = (String) requestData.get("selectedTime");

        // 委託 Service 來處理資料庫比對邏輯
        Map<String, String> response = tableService.processFilter(startDate, selectedTime);

        // 組裝回應的鍵值對
        // Map<String, String> response = new HashMap<>();
        // response.put("date", reservation.getDate().toString());
        // response.put("startTime", reservation.getStartTime().toString());
        
        // 返回回應內容
        return response;
    
    }
}

