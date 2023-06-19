package com.ispan.eeit64.entity;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "orders")
public class OrderBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", length = 10)
	private Integer id;

	@Column(name = "type", columnDefinition = "varchar(10) NOT NULL COMMENT'訂單類型 I內用O外帶'")
	private String type;

	@Temporal(TemporalType.TIME)
	@Column(name = "pickTime", columnDefinition = "time NOT NULL COMMENT '取餐時間'")
	private java.util.Date pickTime;

	@Column(name = "orderTime", columnDefinition = "datetime NOT NULL COMMENT '下單時間'")
	private java.sql.Timestamp orderTime;

	@Column(name = "amount", columnDefinition = "int(100) NOT NULL COMMENT '金額'")
	private Integer amount;

	@Column(name = "orderStatus", columnDefinition = "varchar(10) NOT NULL COMMENT '訂單狀態4種'")
	private String orderStatus;

	@Column(name = "note", columnDefinition = "varchar(100) DEFAULT NULL COMMENT '備註'")
	private String note;

	@Column(name = "customer", columnDefinition = "varchar(100) NOT NULL COMMENT '顧客名稱 內用代桌號'")
	private String customer;

	@Column(name = "phone", columnDefinition = "varchar(100) NOT NULL COMMENT '電話'")
	private String phone;

	@ManyToOne
	@JoinColumn(name = "FK_Activity_Id")
	private ActivityBean activityBean;
	
	@OneToMany(mappedBy = "orderBean")
    private Set<OrderRecordBean> orderRecordBean= new LinkedHashSet<>();

	@OneToMany(mappedBy = "orderBean", fetch = FetchType.EAGER, cascade = {
			CascadeType.PERSIST }, orphanRemoval = false)
	private Set<OrderDetailBean> orderDetailBean = new LinkedHashSet<>();

	@OneToOne(mappedBy = "order", cascade = CascadeType.PERSIST)
	private CheckoutBean checkoutBean;

}
