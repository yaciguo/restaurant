package com.ispan.eeit64.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "orderDetail")
public class OrderDetailBean {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", length = 10)
    private Integer id;
    
    @OneToOne //(fetch = FetchType.LAZY)
    @JoinColumn(name="dishId", nullable=false , foreignKey=@ForeignKey(name = "od_fk_dish"))
    private DishBean dish;

    @Column(name = "quantity", columnDefinition = "int(11) NOT NULL COMMENT '單品數量'")
    private Integer quantity;
    
    @ManyToOne
	@JoinColumn(name="FK_orderId", nullable=false , foreignKey=@ForeignKey(name = "orders_id_fk"))  
    @JsonBackReference
    private OrderBean orderBean;

	@Override
	public String toString() {
		return "OrderDetailBean [id=" + id + ", dish=" + dish + ", quantity=" + quantity + ", orderBean=" + orderBean
				+ "]";
	}

	public OrderDetailBean() {
		super();
	}
	
	public OrderDetailBean(DishBean dish, Integer quantity) {
		super();
		this.dish = dish;
		this.quantity = quantity;
	}
	
	public OrderDetailBean(OrderBean orderBean, DishBean dish, Integer quantity) {
		super();
		this.orderBean = orderBean;
		this.dish = dish;
		this.quantity = quantity;
	}

	public OrderDetailBean(Integer id, DishBean dish, Integer quantity, OrderBean orderBean) {
		super();
		this.id = id;
		this.dish = dish;
		this.quantity = quantity;
		this.orderBean = orderBean;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public DishBean getDish() {
		return dish;
	}

	public void setDish(DishBean dish) {
		this.dish = dish;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public OrderBean getOrderBean() {
		return orderBean;
	}

	public void setOrderBean(OrderBean orderBean) {
		this.orderBean = orderBean;
	}
    
}
