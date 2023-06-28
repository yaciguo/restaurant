package com.ispan.eeit64.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "orderRecord")
public class OrderRecordBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "order_establish", columnDefinition = "time NOT NULL COMMENT '訂單成立'")
	private java.sql.Timestamp orderEstablish;

	@Column(name = "order_deal", columnDefinition = "time  COMMENT '訂單處理中'")
	private java.sql.Timestamp orderDeal;

	@Column(name = "order_finish", columnDefinition = "time  COMMENT '訂單完成'")
	private java.sql.Timestamp orderFinish;

	@Column(name = "order_cancel", columnDefinition = "time  COMMENT '訂單取消'")
	private java.sql.Timestamp orderCancel;
	
	// edit @OneToOne
	@OneToOne
	@JsonBackReference
	@JoinColumn(name = "FK_OrderBean_Id")
	private OrderBean orderBean;

	@Override
	public String toString() {
		return "OrderRecordBean [id=" + id + ", orderEstablish=" + orderEstablish + ", orderDeal=" + orderDeal
				+ ", orderFinish=" + orderFinish + ", orderCancel=" + orderCancel + ", orderBean=" + orderBean + "]";
	}

	public OrderRecordBean() {
		super();
	}
	
	// add
	public OrderRecordBean(Timestamp orderEstablish, Timestamp orderDeal, Timestamp orderFinish,
			Timestamp orderCancel) {
		super();
		this.orderEstablish = orderEstablish;
		this.orderDeal = orderDeal;
		this.orderFinish = orderFinish;
		this.orderCancel = orderCancel;
	}

	public OrderRecordBean(Integer id, Timestamp orderEstablish, Timestamp orderDeal, Timestamp orderFinish,
			Timestamp orderCancel, OrderBean orderBean) {
		super();
		this.id = id;
		this.orderEstablish = orderEstablish;
		this.orderDeal = orderDeal;
		this.orderFinish = orderFinish;
		this.orderCancel = orderCancel;
		this.orderBean = orderBean;
	}
	
	

	public OrderRecordBean(Timestamp orderEstablish, Timestamp orderDeal, Timestamp orderFinish, Timestamp orderCancel,
			OrderBean orderBean) {
		super();
		this.orderEstablish = orderEstablish;
		this.orderDeal = orderDeal;
		this.orderFinish = orderFinish;
		this.orderCancel = orderCancel;
		this.orderBean = orderBean;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public java.sql.Timestamp getOrderEstablish() {
		return orderEstablish;
	}

	public void setOrderEstablish(java.sql.Timestamp orderEstablish) {
		this.orderEstablish = orderEstablish;
	}

	public java.sql.Timestamp getOrderDeal() {
		return orderDeal;
	}

	public void setOrderDeal(java.sql.Timestamp orderDeal) {
		this.orderDeal = orderDeal;
	}

	public java.sql.Timestamp getOrderFinish() {
		return orderFinish;
	}

	public void setOrderFinish(java.sql.Timestamp orderFinish) {
		this.orderFinish = orderFinish;
	}

	public java.sql.Timestamp getOrderCancel() {
		return orderCancel;
	}

	public void setOrderCancel(java.sql.Timestamp orderCancel) {
		this.orderCancel = orderCancel;
	}

	public OrderBean getOrderBean() {
		return orderBean;
	}

	public void setOrderBean(OrderBean orderBean) {
		this.orderBean = orderBean;
	}
	
	
}
