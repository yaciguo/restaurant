package com.ispan.eeit64;

import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.jpa.repository.JpaRepository;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ispan.eeit64.entity.CategoryBean;
import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.entity.OpeningHourBean;
import com.ispan.eeit64.jsonBean.CategoryJson;
import com.ispan.eeit64.jsonBean.DishJson;
import com.ispan.eeit64.jsonBean.OpeningHourJson;
import com.ispan.eeit64.jsonBean.reader.ReadJson;
import com.ispan.eeit64.repository.CategoryRepository;
import com.ispan.eeit64.repository.DishRepository;
import com.ispan.eeit64.repository.OpeningHourRepository;
import com.ispan.eeit64.repository.UniversalCustomRepository;

@SpringBootTest
public class fakeDataInit {
	public Boolean isDeleteOldData = true;

	@Autowired
	UniversalCustomRepository ucDao;

	@Autowired
	DishRepository dishDao;

	@Autowired
	CategoryRepository categoryDao;

	@Autowired
	OpeningHourRepository openHourdao;
	
	@BeforeEach
	public void before(TestInfo testInfo) {
		System.out.println("");
		System.out.println("Test method execution : " + testInfo.getDisplayName());
	}

	@AfterEach
	public void after(TestInfo testInfo) {
		System.out.println("Test method execution end : " + testInfo.getDisplayName());
		System.out.println("");
	}

	@Test
	void addFakeData() {
		try {
			addOpeningHourData();
			addCategoryData();
			addDishData();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public <T> List<T> getJson(String jsonPath, Class<T> type) throws Exception {
		String jsonStr = ReadJson.getJsonFileString(jsonPath);
		List<T> json = new LinkedList<>();
		
		if (jsonStr != null) {
			Type listType = TypeToken.getParameterized(List.class, type).getType();
			json = new Gson().fromJson(jsonStr, listType);
		} else {
			return null;
		}
		return json;
	}

	public <T, ID> void resetTable(String tableName, JpaRepository<T, ID> dao) throws Exception {
		if (dao.findAll().size() != 0) {
			dao.deleteAll();
		}
		ucDao.resetAutoId(tableName);
	}
	

	void addOpeningHourData() throws Exception {
		List<OpeningHourJson> json = getJson("/static/assets/json/openingHours.json", OpeningHourJson.class);

		if(isDeleteOldData) {
			resetTable("openinghour", openHourdao);
		}		
		
		SimpleDateFormat formatDate = new SimpleDateFormat("HH:mm");
		for (OpeningHourJson jsonBean : json) {
			Date oepnDate = formatDate.parse(jsonBean.open);
			Date closeDate = formatDate.parse(jsonBean.close);
			OpeningHourBean bean = new OpeningHourBean(null, jsonBean.day, oepnDate, closeDate);
			openHourdao.save(bean);
		}
	}

	public void addCategoryData() throws Exception {
		List<CategoryJson> json = getJson("/static/assets/json/category.json", CategoryJson.class);

		if(isDeleteOldData) {
			resetTable("category", categoryDao);
		}		

		for (CategoryJson jsonBean : json) {
			CategoryBean bean = new CategoryBean(null, jsonBean.name);
			categoryDao.save(bean);
			System.out.println(bean);
		}
	}

	public void addDishData() throws Exception {
		List<DishJson> json = getJson("/static/assets/json/dish.json", DishJson.class);

		if(isDeleteOldData) {
			resetTable("dish", dishDao);
		}
		
		for (DishJson jsonBean : json) {
			Optional<CategoryBean> cbeanOptional = categoryDao.findById(jsonBean.category+1);
			CategoryBean cbean = cbeanOptional.get();
			DishBean bean = new DishBean(jsonBean.name, cbean, jsonBean.price, jsonBean.cost, "null", jsonBean.description, "null");

			dishDao.save(bean);
		}
	}

}
