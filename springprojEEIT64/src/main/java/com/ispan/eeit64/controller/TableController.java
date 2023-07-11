package com.ispan.eeit64.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Controller
public class TableController {
	public TableController() {
		
	}
	
	//篩選日期時間
	 @PostMapping("/filter")
	 @CrossOrigin(origins = "http://localhost:8080") // 設置允許跨域的來源網址
	    public List<Reservation> filterData(@RequestBody FilterRequest filterRequest) {
	        // 獲取前端傳來的日期和時間值
	        String startDate = filterRequest.getStartDate();
	        String selectedTime = filterRequest.getSelectedTime();

	        // 在這裡根據日期和時間值進行資料篩選的操作
	        // 假設你有一個名為"reservations"的資料表，並使用某種資料庫連線方式進行查詢
	        // 這裡僅為示範，你需要根據你的資料庫操作進行修改

	        // 假設使用Spring Data JPA，Reservation為實體類對應資料庫表
	        List<Reservation> reservations = reservationRepository.findByDateAndTime(startDate, selectedTime);
	        return reservations;
	    }

}
