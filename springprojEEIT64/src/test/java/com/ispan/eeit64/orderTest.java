package com.ispan.eeit64;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ispan.eeit64.entity.DishBean;
import com.ispan.eeit64.entity.OrderBean;
import com.ispan.eeit64.entity.OrderDetailBean;
import com.ispan.eeit64.repository.DishRepository;
import com.ispan.eeit64.repository.OrderRepository;

@SpringBootTest
public class orderTest {
	@Autowired
	OrderRepository oDao;
	@Autowired
	DishRepository dDao;
	@Test
	void test() {
		Set<OrderDetailBean> dBeans = new HashSet<>();
		Integer[] dId = {2,2,3,3,8,8,33,33};
        Map<Integer, Integer> elementCountMap = new HashMap<>();

        for (int element : dId) {
            if (elementCountMap.containsKey(element)) {
                int count = elementCountMap.get(element);
                elementCountMap.put(element, count + 1);
            } else {
                elementCountMap.put(element, 1);
            }
        }
                
		for(Integer id : elementCountMap.keySet()) {
			Optional<DishBean> dishBeanOptional = dDao.findById(id);
			DishBean dishBean = dishBeanOptional.get();
			
			OrderDetailBean odBean = new OrderDetailBean(dishBean, elementCountMap.get(id));
			dBeans.add(odBean);
		}
		
//		OrderBean oBean = new OrderBean("type", new Date(), new Timestamp(System.currentTimeMillis()), 1000, "Status",
//				"note", "customer", "phone", dBeans);
//				
//		try {			
//			oDao.save(oBean);
//		} catch (Exception e) {
//			System.out.println(e);
//		}
	}
}
