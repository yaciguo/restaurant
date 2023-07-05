package com.ispan.eeit64.entity;


import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "checkout")
@Access(AccessType.FIELD)
public class CheckoutBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", length = 200)
	private Integer id;

	@Column(name = "payTime", columnDefinition = "DATETIME COMMENT '結帳時間'")
	private Date payTime;

	@Column(name = "payStatus", columnDefinition = "VARCHAR(20) NOT NULL COMMENT '交易狀態Y,N'")
	private String payStatus;

	@Column(name = "note", columnDefinition = "VARCHAR(200) DEFAULT NULL COMMENT '備註'")
	private String note;
	
	@JsonIgnoreProperties("checkoutBean")
	@OneToOne
    @JoinColumn(name="FK_orderId")
	private OrderBean order;

	@Override
	public String toString() {
		return "CheckoutBean [id=" + id + ", payTime=" + payTime + ", payStatus=" + payStatus + ", note=" + note
				+ ", order=" + order + "]";
	}

	public CheckoutBean() {
		super();
	}

	public CheckoutBean(Date payTime, String payStatus, OrderBean order) {
		super();
		this.payTime = payTime;
		this.payStatus = payStatus;
		this.order = order;
	}

	public CheckoutBean(Integer id, Date payTime, String payStatus, String note, OrderBean order) {
		super();
		this.id = id;
		this.payTime = payTime;
		this.payStatus = payStatus;
		this.note = note;
		this.order = order;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getPayTime() {
		return payTime;
	}

	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public OrderBean getOrder() {
		return order;
	}

	public void setOrder(OrderBean order) {
		this.order = order;
	}
	
}
