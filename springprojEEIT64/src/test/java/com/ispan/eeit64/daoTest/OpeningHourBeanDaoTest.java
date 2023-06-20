package com.ispan.eeit64.daoTest;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ispan.eeit64.entity.OpeningHourBean;
import com.ispan.eeit64.jsonBean.OpeningHourJson;
import com.ispan.eeit64.jsonBean.reader.ReadJson;
import com.ispan.eeit64.repository.OpeningHourRepository;
import com.ispan.eeit64.repository.UniversalCustomRepository;

@SpringBootTest
public class OpeningHourBeanDaoTest {
	@Autowired
	OpeningHourRepository dao;
	@Autowired
	UniversalCustomRepository ucDao;

	@BeforeEach
	public void before(TestInfo testInfo) {
		System.out.println("");
		System.out.println("Test method execution : "+testInfo.getDisplayName());
	}

	@AfterEach
	public void after(TestInfo testInfo) {
		System.out.println("Test method execution end : "+testInfo.getDisplayName());
		System.out.println("");
	}
 
	@Test
	void addFakeData() {
		try {
			addOpeningHourData();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	void addOpeningHourData() {
		String jsonStr = ReadJson.getJsonFileString("/static/assets/json/openingHours.json");
		List<OpeningHourJson> json = new LinkedList<>();
		if (jsonStr != null) {
			json = new Gson().fromJson(jsonStr, new TypeToken<List<OpeningHourJson>>() {
			}.getType());
		} else {
			return ;
		}
		
		try {
			if (dao.findAll().size() != 0) {
				dao.deleteAll();
			}
			ucDao.resetAutoId("openinghour");
		} catch (Exception e) {
			System.out.println(e);
		}

		SimpleDateFormat formatDate = new SimpleDateFormat("HH:mm");
		try {
			for (OpeningHourJson jsonBean : json) {
				Date oepnDate = formatDate.parse(jsonBean.open);
				Date closeDate = formatDate.parse(jsonBean.close);
				OpeningHourBean bean = new OpeningHourBean(null, jsonBean.day, oepnDate, closeDate);
				dao.save(bean);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
