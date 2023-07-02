//package com.ispan.eeit64.service.impl;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import com.ispan.eeit64.entity.DishBean;
//import com.ispan.eeit64.repository.DishRepository;
//import com.ispan.eeit64.service.DishService;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import java.util.ArrayList;
//
//
//@Service
//@Transactional
//public class DishServiceImpl implements DishService {
//	private static final Logger log = LoggerFactory.getLogger(DishServiceImpl.class);
//	@Autowired
//	DishRepository dao;
//	
//	@Override
//	public List<DishBean> findAll() {
////	    List<DishBean> dishList = dao.findAll();
////	    List<DishBean> dishDataList = new ArrayList<>();
////	    for (DishBean dish : dishList) {
////	        Map<String, Object> dishData = new HashMap<>();
////	        dishData.put("id", dish.getId());
////	        dishData.put("name", dish.getName());
////	        dishData.put("category", dish.getCategoryBean().getName());
////	        dishData.put("price", dish.getPrice());
////	        dishData.put("cost", dish.getCost());
////	        dishData.put("description", dish.getDescription());
////	        dishDataList.add((DishBean) dishData);
////	    }
//	    return dao.findAll();
//	}
//
//	
//	@Override
//	public void save(DishBean bean) {
//	    log.info("=====>DishServiceImpl#save()");
//	    dao.save(bean);
//	}
//	@Override
//	public DishBean update(DishBean bean) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public void deleteById(Integer id) {
//		// TODO Auto-generated method stub		
//	}
//	@Override
//	public void detach(DishBean bean) {
//		// TODO Auto-generated method stub		
//	}
//
//
//	@Override
//	public DishBean findById(Integer id) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//}
//	


package com.ispan.eeit64.service.impl;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ispan.eeit64.repository.DishRepository;
import com.ispan.eeit64.service.ShowDishService;
import com.ispan.eeit64.entity.DishBean;

@Service
@Transactional
public class ShowDishServiceImpl implements ShowDishService{
 
	DishRepository dishRepository;
 
 @Autowired
 public ShowDishServiceImpl(DishRepository dishRepository) {
  this.dishRepository = dishRepository;
 }
 
    @Override
    public Page<DishBean> findAll(int pageSize, int pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        return dishRepository.findAll(pageable);
    }
 
//    @Override
//    public Page<DishBean> findByOrderStatus(String orderStatus, int pageSize, int pageNumber) {
//        Pageable pageable = PageRequest.of(pageNumber, pageSize);
//        return dishRepository.findByOrderStatus(orderStatus, pageable);
//    }
    

}