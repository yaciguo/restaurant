package com.ispan.eeit64.controller;


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

//    @PostMapping("/filter")
//    public ResponseEntity<List<Reservation>> filterTableData(@RequestBody Map<String, String> requestData) {
//        String startDate = requestData.get("date");
//        String selectedTime = requestData.get("startTime");
//
//        List<Reservation> reservations = tableService.filterTableData(startDate, selectedTime);
//
//        return ResponseEntity.ok(reservations);
//    }
}

