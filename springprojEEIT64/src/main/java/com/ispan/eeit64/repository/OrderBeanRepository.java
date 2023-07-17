package com.ispan.eeit64.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ispan.eeit64.entity.OrderBean;
import java.util.Set;
import com.ispan.eeit64.entity.OrderDetailBean;
import com.ispan.eeit64.entity.OrderRecordBean;


@Repository
public interface OrderBeanRepository extends JpaRepository<OrderBean, Integer> {
	//查全部+分頁功能
	Page<OrderBean> findAll(Pageable pageable);

    // 訂單狀態 (已成立、處理中、已完成、已取消)
    Page<OrderBean> findByOrderStatus(String orderStatus, Pageable pageable);

    // 訂單狀態 (未付款)
    @Query("SELECT o FROM OrderBean o WHERE o.orderStatus != '已完成' OR (o.orderStatus = '已完成' AND (o.checkoutBean.payStatus != 'Y' OR o.checkoutBean IS NULL))")
    Page<OrderBean> findByCheckoutBeanPayStatus(String payStatus, Pageable pageable);
    
    // 訂單查詢
    Page<OrderBean> findById(Integer id, Pageable pageable);
    
    //用電話查詢
    @Query(value = "SELECT * FROM orders WHERE phone = :phone", nativeQuery = true)
    Page<OrderBean> findByPhone(@Param("phone") String phone, Pageable pageable);
    
    // 搜尋名字(無法驗證別人是否有認真填寫，須再討論)
    @Query(value = "SELECT * FROM orders WHERE customer = :customer", nativeQuery = true)
    Page<OrderBean> findByCustomer(@Param("customer") String customer, Pageable pageable);   
    
    //找相關OrderRecordBean
    @Query("SELECT o FROM OrderBean o JOIN FETCH o.orderRecordBean WHERE o.id = :orderId")
    OrderBean findOrderWithRecordById(@Param("orderId") Integer orderId);       

}
