package com.ispan.eeit64.entity;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ispan.eeit64.repository.ReservationRepository;

@SpringBootTest
public class ReservationBeanTest {
	@Autowired
	private ReservationRepository reservationRepository;
	
	@Test
    public void Insert() {
        // 建立一個新的 ReservationBean 物件
        ReservationBean reservation = new ReservationBean();

        reservation.setName("sara");
        reservation.setGender("M");
        reservation.setPhone("0919208005");
        reservation.setpNumber(2);
        reservation.setDate(Date.valueOf("2023-06-25"));
        reservation.setStartTime(Time.valueOf("13:00:00"));
     // 設定結束時間為開始時間 + 1小時
        long startTimeMillis = reservation.getStartTime().getTime();
        long endTimeMillis = startTimeMillis + (60 * 60 * 1000);
        reservation.setEndTime(new Time(endTimeMillis));
        reservation.setEmail("john.doe@example.com");
       reservation.setNote("");
        reservation.setSubmitTime(new Timestamp(System.currentTimeMillis()));
        reservation.setFdTableBean(null);
        reservationRepository.save(reservation);

        // 印出插入後的 ID
        System.out.println(reservation.getId()); 
    }

}
