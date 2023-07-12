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

	@Query("SELECT DISTINCT o "+BASE_QUERY)
	List<OrderBean> findOrdersByOrderDate(@Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);

	@Query("SELECT DISTINCT o "+ BASE_QUERY+" AND od.dish.id IN :dishIds")
	List<OrderBean> findOrdersByDishIdAndOrderDate(@Param("dishIds") Set<Integer> dishIds, @Param("startTime") Timestamp startDate, @Param("endTime") Timestamp endDate);

	// count orders
	@Query("SELECT COUNT(DISTINCT o) "+ BASE_QUERY)
	Integer countOrdersByOrderTime(@Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);

	@Query("SELECT od.dish.name, COUNT(od) "+ BASE_QUERY+" AND od.dish.id IN :dishIds GROUP BY od.dish.id ORDER BY od.dish.id")
	List<Object[]> countOrdersByDishIdsAndOrderTime(@Param("dishIds") Set<Integer> dishIds, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);
	
	@Query("SELECT od.dish.categoryBean.name, COUNT(od) "+ BASE_QUERY+" AND od.dish.categoryBean.id IN :categoryIds GROUP BY od.dish.categoryBean.id ORDER BY od.dish.categoryBean.id")
	List<Object[]> countOrdersByCategoryIdsAndOrderTime(@Param("categoryIds") Set<Integer> categoryIds, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);

	// SalesPrice
	@Query("SELECT SUM(od.dish.price*od.quantity) "+ BASE_QUERY)
	Integer sumSalesPriceByOrderTime(@Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);

	@Query("SELECT od.dish.name, SUM(od.dish.price*od.quantity) "+ BASE_QUERY+" AND od.dish.id IN :dishIds GROUP BY od.dish.id ORDER BY od.dish.id")
	List<Object[]> sumSalesPriceByDishIdsAndOrderTime(@Param("dishIds") Set<Integer> dishIds, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);

	@Query("SELECT od.dish.categoryBean.name, SUM(od.dish.price*od.quantity) "+ BASE_QUERY+" AND od.dish.categoryBean.id IN :categoryIds GROUP BY od.dish.categoryBean.id ORDER BY od.dish.categoryBean.id")
	List<Object[]> sumSalesPriceByCategoryIdsAndOrderTime(@Param("categoryIds") Set<Integer> categoryIds, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);

	// All SalesPrice
	@Query("SELECT SUM(od.dish.price*od.quantity) "+ BASE_QUERY)
	Integer sumSalesPriceByAllDishIdsAndOrderTime(@Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);
		
	@Query("SELECT SUM(od.dish.price*od.quantity) "+ BASE_QUERY)
	Integer sumSalesPriceByAllCategoryIdsAndOrderTime(@Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);
	
	// Profit
	@Query("SELECT SUM((od.dish.price - od.dish.cost)*od.quantity) "+ BASE_QUERY)
	Integer sumProfitByOrderTime(@Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);

	@Query("SELECT od.dish.name, SUM((od.dish.price - od.dish.cost)*od.quantity) "+ BASE_QUERY+" AND od.dish.id IN :dishIds GROUP BY od.dish.id ORDER BY od.dish.id")
	List<Object[]> sumProfitByDishIdsAndOrderTime(@Param("dishIds") Set<Integer> dishIds, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);
	
	@Query("SELECT od.dish.categoryBean.name, SUM((od.dish.price - od.dish.cost)*od.quantity) "+ BASE_QUERY+" AND od.dish.categoryBean.id IN :categoryIds GROUP BY od.dish.categoryBean.id ORDER BY od.dish.categoryBean.id")
	List<Object[]> sumProfitByCategoryIdsAndOrderTime(@Param("categoryIds") Set<Integer> categoryIds, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);

	// quantity
	@Query("SELECT SUM(od.quantity) "+ BASE_QUERY)
	Integer sumQuantityByOrderTime(@Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);

	@Query("SELECT od.dish.name, SUM(od.quantity) "+ BASE_QUERY+" AND od.dish.id IN :dishIds GROUP BY od.dish.id ORDER BY od.dish.id")
	List<Object[]> sumQuantityByDishIdsAndOrderTime(@Param("dishIds") Set<Integer> dishIds, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);
	
	@Query("SELECT od.dish.categoryBean.name, SUM(od.quantity) "+ BASE_QUERY+" AND od.dish.categoryBean.id IN :categoryIds GROUP BY od.dish.categoryBean.id ORDER BY od.dish.categoryBean.id")
	List<Object[]> sumQuantityByCategoryIdsAndOrderTime(@Param("categoryIds") Set<Integer> categoryIds, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);

	// All quantity
	@Query("SELECT od.dish.name, SUM(od.quantity) "+ BASE_QUERY+" GROUP BY od.dish.id ORDER BY od.dish.id")
	List<Object[]> sumQuantityByAllDishIdsAndOrderTime(@Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);
	
	@Query("SELECT od.dish.categoryBean.name, SUM(od.quantity) "+ BASE_QUERY+"  GROUP BY od.dish.categoryBean.id ORDER BY od.dish.categoryBean.id")
	List<Object[]> sumQuantityByAllCategoryIdsAndOrderTime(@Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);

	// cost 
	@Query("SELECT SUM(od.dish.cost*od.quantity) "+ BASE_QUERY)
	Integer sumCostByOrderTime(@Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);

	@Query("SELECT od.dish.name, SUM(od.dish.cost*od.quantity) "+ BASE_QUERY+" AND od.dish.id IN :dishIds GROUP BY od.dish.id ORDER BY od.dish.id")
	List<Object[]> sumCostByDishIdsAndOrderTime(@Param("dishIds") Set<Integer> dishIds, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);

	@Query("SELECT od.dish.categoryBean.name, SUM(od.dish.cost*od.quantity) "+ BASE_QUERY+" AND od.dish.categoryBean.id IN :categoryIds GROUP BY od.dish.categoryBean.id ORDER BY od.dish.categoryBean.id")
	List<Object[]> sumCostByCategoryIdsAndOrderTime(@Param("categoryIds") Set<Integer> categoryIds, @Param("startTime") Timestamp startTime, @Param("endTime") Timestamp endTime);
}
