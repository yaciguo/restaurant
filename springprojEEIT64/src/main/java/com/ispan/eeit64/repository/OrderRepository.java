package com.ispan.eeit64.repository;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ispan.eeit64.entity.OrderBean;

@Repository
public interface OrderRepository extends JpaRepository<OrderBean, Integer>{
	final String BASE_QUERY = "FROM OrderBean o JOIN o.orderDetailBean od WHERE o.orderTime BETWEEN :startTime AND :endTime";
	List<OrderBean> findByCustomerAndPhoneOrderByOrderTimeDesc(String customer, String phone);

	@Query("SELECT DISTINCT o FROM OrderBean o JOIN o.orderDetailBean od WHERE od.dish.id = :dishId")
	List<OrderBean> findOrdersByDishId(@Param("dishId") Integer dishId);

	@Query("SELECT DISTINCT o FROM OrderBean o JOIN o.orderDetailBean od WHERE o.orderTime BETWEEN :startDate AND :endDate")
	List<OrderBean> findOrdersByOrderDate(@Param("startDate") Timestamp startDate, @Param("endDate") Timestamp endDate);

	@Query("SELECT DISTINCT o "+ BASE_QUERY+" AND od.dish.id IN :dishIds")
	List<OrderBean> findOrdersByDishIdAndOrderDate(@Param("dishIds") Set<Integer> dishIds, @Param("startTime") Timestamp startDate, @Param("endTime") Timestamp endDate);

	@Query("SELECT od.dish.name, COUNT(od) "+ BASE_QUERY+" AND od.dish.id IN :dishIds GROUP BY od.dish.id")
	List<Object[]> countSalesByDishIdsAndOrderTime(@Param("dishIds") Set<Integer> dishIds, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);
	
	@Query("SELECT od.dish.categoryBean.name, COUNT(od) "+ BASE_QUERY+" AND od.dish.categoryBean.id IN :categoryIds GROUP BY od.dish.categoryBean.id")
	List<Object[]> countSalesByCategoryIdsAndOrderTime(@Param("categoryIds") Set<Integer> categoryIds, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);

	@Query("SELECT od.dish.name, SUM(od.dish.price) "+ BASE_QUERY+" AND od.dish.id IN :dishIds GROUP BY od.dish.id")
	List<Object[]> sumSalesPriceByDishIdsAndOrderTime(@Param("dishIds") Set<Integer> dishIds, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);

	@Query("SELECT od.dish.categoryBean.id, SUM(od.dish.price) "+ BASE_QUERY+" AND od.dish.categoryBean.id IN :categoryIds GROUP BY od.dish.categoryBean.id")
	List<Object[]> sumSalesPriceByCategoryIdsAndOrderTime(@Param("categoryIds") Set<Integer> categoryIds, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);

	@Query("SELECT od.dish.name, SUM(od.dish.price - od.dish.cost) "+ BASE_QUERY+" AND od.dish.id IN :dishIds GROUP BY od.dish.id")
	List<Object[]> sumProfitByDishIdsAndOrderTime(@Param("dishIds") Set<Integer> dishIds, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);
	
	@Query("SELECT od.dish.categoryBean.id, SUM(od.dish.price - od.dish.cost) "+ BASE_QUERY+" AND od.dish.categoryBean.id IN :categoryIds GROUP BY od.dish.categoryBean.id")
	List<Object[]> sumProfitByCategoryIdsAndOrderTime(@Param("categoryIds") Set<Integer> categoryIds, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);
}
