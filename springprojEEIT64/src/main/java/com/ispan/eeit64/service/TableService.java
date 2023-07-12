package com.ispan.eeit64.service;

import java.util.List;

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

//    public List<Reservation> filterTableData(String startDate, String selectedTime) {
//        // 根據日期和時間值進行資料篩選的操作
//        return reservationRepository.findByDateAndStartTime(startDate, selectedTime);
//    }
}

	  



