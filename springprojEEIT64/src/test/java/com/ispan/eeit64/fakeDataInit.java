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
import com.ispan.eeit64.entity.ActivityBean;
import com.ispan.eeit64.entity.CategoryBean;
import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.entity.OpeningHourBean;
import com.ispan.eeit64.jsonBean.ActivityJson;
import com.ispan.eeit64.jsonBean.CategoryJson;
import com.ispan.eeit64.jsonBean.DishJson;
import com.ispan.eeit64.jsonBean.OpeningHourJson;
import com.ispan.eeit64.jsonBean.reader.ReadJson;
import com.ispan.eeit64.repository.ActivityRepository;
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
	ActivityRepository activityDao;
	
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
	void test() {
		try {
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	
	@Test
	void addFakeData() {
		try {
			// clean table data and reset AUTO_INCREMENT = 1
			if(isDeleteOldData) {
				resetTable("openinghour", openHourdao);
				resetTable("category", categoryDao);
				resetTable("dish", dishDao);
				resetTable("activity", activityDao);				
			}
			
			// add fake data
			addOpeningHourData();
			addCategoryData();
			addDishData();
			addActivityData();
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

		for (CategoryJson jsonBean : json) {
			CategoryBean bean = new CategoryBean(null, jsonBean.name);
			categoryDao.save(bean);
			System.out.println(bean);
		}
	}

	public void addDishData() throws Exception {
		List<DishJson> json = getJson("/static/assets/json/dish.json", DishJson.class);
		
		for (DishJson jsonBean : json) {
			Optional<CategoryBean> cbeanOptional = categoryDao.findById(jsonBean.category+1);
			CategoryBean cbean = cbeanOptional.get();
			DishBean bean = new DishBean(jsonBean.name, cbean, jsonBean.price, jsonBean.cost, "null", jsonBean.description, "null");

			dishDao.save(bean);
		}
	}

	public void addActivityData() throws Exception {
		List<ActivityJson> json = getJson("/static/assets/json/activity.json", ActivityJson.class);
		
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");			
		for(ActivityJson jsonBean : json) {
			java.sql.Date startDate = new java.sql.Date(formatDate.parse(jsonBean.startDate).getTime());
			java.sql.Date endDate = new java.sql.Date(formatDate.parse(jsonBean.endDate).getTime());
			
			DishBean dBean = null;				
			if(jsonBean.FK_Dish_Id != null) {
				Optional<DishBean> dBeanOptional = dishDao.findById(jsonBean.FK_Dish_Id);
				dBean = dBeanOptional.get();
			}
			ActivityBean bean = new ActivityBean(jsonBean.name, jsonBean.type, jsonBean.amount, jsonBean.discount, startDate, endDate, dBean);
			activityDao.save(bean);
		}
	}

}
