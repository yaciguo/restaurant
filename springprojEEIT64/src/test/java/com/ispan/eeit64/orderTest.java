package com.ispan.eeit64;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.entity.OrderDetailBean;
import com.ispan.eeit64.repository.DishRepository;
import com.ispan.eeit64.repository.OrderRepository;
import com.ispan.eeit64.service.impl.DataAnalysisServiceImpl;

@SpringBootTest
public class orderTest {
	@Autowired
	OrderRepository oDao;
	@Autowired
	DishRepository dDao;
	void test() {
		// Set<OrderDetailBean> dBeans = new HashSet<>();
		// Integer[] dId = {2,2,3,3,8,8,33,33};
        // Map<Integer, Integer> elementCountMap = new HashMap<>();

        // for (int element : dId) {
        //     if (elementCountMap.containsKey(element)) {
        //         int count = elementCountMap.get(element);
        //         elementCountMap.put(element, count + 1);
        //     } else {
        //         elementCountMap.put(element, 1);
        //     }
        // }
                
		// for(Integer id : elementCountMap.keySet()) {
		// 	Optional<DishBean> dishBeanOptional = dDao.findById(id);
		// 	DishBean dishBean = dishBeanOptional.get();
			
		// 	OrderDetailBean odBean = new OrderDetailBean(dishBean, elementCountMap.get(id));
		// 	dBeans.add(odBean);
		// }
		
//		OrderBean oBean = new OrderBean("type", new Date(), new Timestamp(System.currentTimeMillis()), 1000, "Status",
//				"note", "customer", "phone", dBeans);
//				
//		try {			
//			oDao.save(oBean);
//		} catch (Exception e) {
//			System.out.println(e);
//		}
	}
	void test2() throws ParseException {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		Timestamp s = new Timestamp(f.parse("2023-01-01").getTime());
		Timestamp e = new Timestamp(f.parse("2023-06-30").getTime());
		Set<Integer> ids = new HashSet<>(Arrays.asList(1,3,4));
		// List<OrderBean> list = oDao.findOrdersByDishId(33);
		// List<OrderBean> list = oDao.findOrdersByDishIdAndOrderDate(ids, s, e);
		// List<OrderBean> list = oDao.findOrdersByOrderDate(s, e);
		// List<Object[]> list = oDao.countSalesByDishIdsAndOrderTime(ids, s, e);
		// List<Object[]> list = oDao.countSalesByCategoryIdsAndOrderTime(ids, s, e);
		// List<Object[]> list = oDao.sumSalesPriceByCategoryIdsAndOrderTime(ids, s, e);
		// List<Object[]> list = oDao.sumProfitByCategoryIdsAndOrderTime(ids, s, e);
		// List<Object[]> list = oDao.sumSalesPriceByDishIdsAndOrderTime(ids, s, e);
		// List<Object[]> list = oDao.sumProfitByDishIdsAndOrderTime(ids, s, e);
		// List<Object[]> list = oDao.sumQuantityByDishIdsAndOrderTime(ids, s, e);
		// List<Object[]> list = oDao.sumQuantityByCategoryIdsAndOrderTime(ids, s, e);
		// List<Object[]> list = oDao.sumCostByDishIdsAndOrderTime(ids, s, e);
		// List<Object[]> list = oDao.sumQuantityByAllDishIdsAndOrderTime( s, e);
		// List<Object[]> list = oDao.sumQuantityByAllCategoryIdsAndOrderTime( s, e);
		Integer list = oDao.sumSalesPriceByAllDishIdsAndOrderTime( s, e);

		// Integer list = oDao.sumCostByOrderTime( s, e);\
		// int a = 0;
		// for(Object[] o : list){
		// 	System.out.println(o[0]);
		// 	System.out.println(o[1].getClass());
		// 	a += (long)o[1];
		// }
		// for(Object[] o : list2){
		// 	System.out.println(o[0]);
		// }
		System.out.println(list);
		// System.out.println(list.size());
		// System.out.println(list);
	}

	void test3() throws ParseException {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM");
		Date s = f.parse("2023-07-22");
		Date e = f.parse("2023-08-12");
		System.out.println(formatDate.format(s));
		// s.setMonth(0);
		// s.setDate(0);
		// System.out.println(s.toString());
		// Timestamp s = new Timestamp(f.parse("2023-01-01").getTime());
		// Timestamp e = new Timestamp(f.parse("2023-06-30").getTime());
		// DataAnalysisServiceImpl t = new DataAnalysisServiceImpl();
		// for(Map a : t.splitDate(t.DAY, s, e)){
		// 	System.out.println(a);
		// }

	}

	@Autowired
	DataAnalysisServiceImpl t;

	void test4() throws ParseException {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM");
		Date s = f.parse("2023-01-10");
		Date e = f.parse("2023-08-12");
		// System.out.println(t.getCountOrders(t.MONTH_METHOD, null, s, e));
		// for(Map a : t.splitDate(t.DAY, s, e)){
		// 	System.out.println(a);
		// }

	}

}
