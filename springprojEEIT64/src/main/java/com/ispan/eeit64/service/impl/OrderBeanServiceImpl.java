package com.ispan.eeit64.service.impl;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.eeit64.entity.CheckoutBean;
import com.ispan.eeit64.entity.OrderBean;
import com.ispan.eeit64.entity.OrderDetailBean;
import com.ispan.eeit64.entity.OrderRecordBean;
import com.ispan.eeit64.repository.OrderBeanRepository;
import com.ispan.eeit64.repository.OrderDetailBeanRepository;
import com.ispan.eeit64.repository.OrderRecordBeanRepository;
import com.ispan.eeit64.service.OrderBeanService;

@Service
@Transactional
public class OrderBeanServiceImpl implements OrderBeanService{
    OrderDetailBeanRepository orderDetailBeanRepository;
	OrderBeanRepository orderBeanRepository;
	OrderRecordBeanRepository orderRecordBeanRepository;
	
	@Autowired
	public OrderBeanServiceImpl(OrderBeanRepository orderBeanRepository,OrderDetailBeanRepository orderDetailBeanRepository, OrderRecordBeanRepository orderRecordBeanRepository) {
		this.orderBeanRepository = orderBeanRepository;
		this.orderDetailBeanRepository = orderDetailBeanRepository;
		this.orderRecordBeanRepository = orderRecordBeanRepository;
	}
	
	//找所有
    @Override
    public Page<OrderBean> findAll(Integer pageSize, Integer pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        return orderBeanRepository.findAll(pageable);
    }
    
    //訂單狀態
    @Override
    public Page<OrderBean> findByOrderStatus(String orderStatus, Integer pageSize, Integer pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);            
        return orderBeanRepository.findByOrderStatus(orderStatus, pageable);
    }
    
    //找ID
	@Override
	public  Page<OrderBean> findById(Integer id, Integer pageSize, Integer pageNumber) {
		   // 执行查询，根据订单ID获取订单数据
			Pageable pageable = PageRequest.of(pageNumber, pageSize);
			Page<OrderBean> orders = orderBeanRepository.findById(id,pageable);
		    return orders; 
	}
	
	@Override
	public  Optional<OrderBean> findById(Integer id) {
		   // 执行查询，根据订单ID获取订单数据		
		Optional<OrderBean> orders = orderBeanRepository.findById(id);
		    return orders; 
	}
	
	//找手機
    @Override
	public Page<OrderBean> findByPhone(String phone, Integer pageNumber, Integer pageSize) {     
	    if (pageNumber == null || pageNumber < 0) {
	        pageNumber = 0; // 默认为第一页
	    }
	    if (pageSize == null || pageSize <= 0) {
	        pageSize = 10; // 默认每页显示 10 条数据
	    }
	    
	    Pageable pageable = PageRequest.of(pageNumber, pageSize);
	    return orderBeanRepository.findByPhone(phone, pageable);
	}
	
    //找顧客名
	@Override
    public Page<OrderBean> findByCustomer(String customer, Integer pageNumber, Integer pageSize) {
		Pageable pageable = PageRequest.of(pageNumber, pageSize);
        return orderBeanRepository.findByCustomer(customer, pageable);
    }   
    
    
    @Override
    public Page<OrderBean> findByCheckoutBeanPayStatus(String payStatus, Integer pageSize, Integer pageNumber) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);            
        return orderBeanRepository.findByCheckoutBeanPayStatus(payStatus, pageable);  
    }

  @Override     
  public void updateOrderState(List<OrderBean> orderBeans) {
      try {
          for (OrderBean orderBean : orderBeans) {
              Optional<OrderBean> optionalOrder = orderBeanRepository.findById(orderBean.getId());
              OrderBean order = optionalOrder.get();                          
              order.setOrderStatus(orderBean.getOrderStatus());
              order.setNote(orderBean.getNote());
              
              String status = orderBean.getOrderStatus();

              OrderBean orders = findOrderWithRecordById(orderBean.getId()); 
              OrderRecordBean record = (orders.getOrderRecordBean()); 
              System.out.println(status);
              System.out.println(orderBean.getId());
              
            //   if (status.equals("訂單成立")) {
            // 	  System.out.println("6666AAA5555");
            // 	  record.setOrderEstablish(new Timestamp(System.currentTimeMillis()));
            // 	  orders.setCheckoutBean(new CheckoutBean(null,"N",orderBean));
            //   } else
			   if (status.equals("order_deal")) {
            	  System.out.println("AAA5555");
            	  record.setOrderDeal(new Timestamp(System.currentTimeMillis()));
              } else if(status.equals("order_cancel")) {
            	  record.setOrderCancel(new Timestamp(System.currentTimeMillis()));
              } else if(status.equals("order_finish")) {
            	  record.setOrderFinish(new Timestamp(System.currentTimeMillis()));
//            	  orders.setCheckoutBean(new CheckoutBean(null,"N",orderBean));
            	  
              } 
              orderRecordBeanRepository.save(record);                         
              orderBeanRepository.save(order);
          }
      } catch (Exception e) {

    	  System.out.println("更新失敗");
      } 
  }
    
	@Override
	public void saveOrder(OrderBean orderBean) {
		orderBeanRepository.save(orderBean);
	}
	
	@Override
	public OrderBean findOrderWithRecordById(Integer orderId) {
		return orderBeanRepository.findOrderWithRecordById(orderId);
	}

}
