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

import java.util.List;

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
public class ShowDishServiceImpl implements ShowDishService {
 
    @Override
	public List<DishBean> getDishesByCategoryId(int categoryId) {
		// TODO Auto-generated method stub
		return null;
	}

	private DishRepository dishRepository;

    @Autowired
    public ShowDishServiceImpl(DishRepository dishRepository) {
        this.dishRepository = dishRepository;
    }

    @Override
    public Page<DishBean> findAll(int pageSize, int pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        return dishRepository.findAll(pageable);
    }

	@Override
	public Page<DishBean> getDishesByCategoryId(int categoryId, int pageSize, int pageNumber) {
		 // 根据 categoryId 筛选相应的数据
	    // 这里使用你自己的筛选逻辑，例如从数据库中查询具有指定 categoryId 的餐点数据

	    // 创建分页请求对象
	    Pageable pageable = PageRequest.of(pageNumber, pageSize);

	    // 查询数据并返回分页结果
	    Page<DishBean> result = dishRepository.findByCategoryBeanId(categoryId, pageable);
	    return result;
	}

	@Override
	public List<DishBean> getAllDishes() {
		// TODO Auto-generated method stub
		return null;
	}
}

// @Autowired
// public ShowDishServiceImpl(DishRepository dishRepository) {
//  this.dishRepository = dishRepository;
// }
// 
//    @Override
//    public Page<DishBean> findAll(int pageSize, int pageNumber) {
//        Pageable pageable = PageRequest.of(pageNumber, pageSize);
//        return dishRepository.findAll(pageable);
//    }
 
//    @Override
//    public Page<DishBean> findByOrderStatus(String orderStatus, int pageSize, int pageNumber) {
//        Pageable pageable = PageRequest.of(pageNumber, pageSize);
//        return dishRepository.findByOrderStatus(orderStatus, pageable);
//    }
    

