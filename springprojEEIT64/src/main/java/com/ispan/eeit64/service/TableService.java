package com.ispan.eeit64.service;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ispan.eeit64.repository.ReservationRepository;

@Service
public class TableService {

	private final ReservationRepository reservationRepository;

	@Autowired
	public TableService(ReservationRepository reservationRepository) {
		this.reservationRepository = reservationRepository;
	}

	public Map<String, String> processFilter(String startDate, String selectedTime) {
		// 在這裡進行資料庫比對的邏輯
		// 使用 reservationRepository 進行相應的查詢或操作

		// 組裝回應的鍵值對 Map 物件
		Map<String, String> response = new HashMap<>();
		response.put("key1", "value1");
		response.put("key2", "value2");

		return response;
	}
}
