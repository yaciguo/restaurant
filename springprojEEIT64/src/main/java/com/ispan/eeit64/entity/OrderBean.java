package com.ispan.eeit64.entity;

import java.sql.Timestamp;
import java.util.Date;
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
	@Column(name = "id")
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

	// edit varchar(20)
	@Column(name = "orderStatus", columnDefinition = "varchar(20) NOT NULL COMMENT '訂單狀態4種'")
	private String orderStatus;

	@Column(name = "note", columnDefinition = "varchar(100) DEFAULT NULL COMMENT '備註'")
	private String note;

	@Column(name = "customer", columnDefinition = "varchar(100) NOT NULL COMMENT '顧客名稱 內用代桌號'")
	private String customer;
	
	//delete NOT NULL
	@Column(name = "phone", columnDefinition = "varchar(100) COMMENT '電話'")
	private String phone;

	@ManyToOne
	@JoinColumn(name = "FK_Activity_Id")
	private ActivityBean activityBean;

	//edit @OneToOne ? add cascade = {CascadeType.ALL}
    @OneToOne(mappedBy = "orderBean", cascade = {CascadeType.ALL})
    private OrderRecordBean orderRecordBean;
//    private Set<OrderRecordBean> orderRecordBean= new LinkedHashSet<>();
    
	@OneToMany(mappedBy = "orderBean", fetch = FetchType.EAGER, cascade = {
			CascadeType.ALL}, orphanRemoval = false)
	private Set<OrderDetailBean> orderDetailBean = new LinkedHashSet<>();

	// edit cascade = CascadeType.ALL
	@OneToOne(mappedBy = "order", cascade = CascadeType.ALL)
	private CheckoutBean checkoutBean;

	@Override
	public String toString() {
		return "OrderBean [id=" + id + ", type=" + type + ", pickTime=" + pickTime + ", orderTime=" + orderTime
				+ ", amount=" + amount + ", orderStatus=" + orderStatus + ", note=" + note + ", customer=" + customer
				+ ", phone=" + phone + ", activityBean=" + activityBean + ", orderRecordBean=" + orderRecordBean
				+ ", orderDetailBean=" + orderDetailBean + ", checkoutBean=" + checkoutBean + "]";
	}

	public OrderBean() {
		super();
	}

	// add ActivityBean activityBean   OrderRecordBean orderRecordBean
	public OrderBean(String type, Date pickTime, Timestamp orderTime, Integer amount, String orderStatus,
			String note, String customer, String phone, OrderRecordBean orderRecordBean
			,Set<OrderDetailBean> orderDetailBean, ActivityBean activityBean) {
		super();
		this.type = type;
		this.pickTime = pickTime;
		this.orderTime = orderTime;
		this.amount = amount;
		this.orderStatus = orderStatus;
		this.note = note;
		this.customer = customer;
		this.phone = phone;
		this.orderRecordBean = orderRecordBean;
		this.orderDetailBean = orderDetailBean;
		this.activityBean = activityBean;
		for(OrderDetailBean odBean : orderDetailBean) {
			odBean.setOrderBean(this);
		}
	}


//	public OrderBean(Integer id, String type, Date pickTime, Timestamp orderTime, Integer amount, String orderStatus,
//			String note, String customer, String phone, ActivityBean activityBean, Set<OrderRecordBean> orderRecordBean,
//			Set<OrderDetailBean> orderDetailBean, CheckoutBean checkoutBean) {
//		super();
//		this.id = id;
//		this.type = type;
//		this.pickTime = pickTime;
//		this.orderTime = orderTime;
//		this.amount = amount;
//		this.orderStatus = orderStatus;
//		this.note = note;
//		this.customer = customer;
//		this.phone = phone;
//		this.activityBean = activityBean;
//		this.orderRecordBean = orderRecordBean;
//		this.orderDetailBean = orderDetailBean;
//		this.checkoutBean = checkoutBean;
//	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public java.util.Date getPickTime() {
		return pickTime;
	}

	public void setPickTime(java.util.Date pickTime) {
		this.pickTime = pickTime;
	}

	public java.sql.Timestamp getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(java.sql.Timestamp orderTime) {
		this.orderTime = orderTime;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public ActivityBean getActivityBean() {
		return activityBean;
	}

	public void setActivityBean(ActivityBean activityBean) {
		this.activityBean = activityBean;
	}

//	public Set<OrderRecordBean> getOrderRecordBean() {
//		return orderRecordBean;
//	}
//
//	public void setOrderRecordBean(Set<OrderRecordBean> orderRecordBean) {
//		this.orderRecordBean = orderRecordBean;
//	}

	public OrderRecordBean getOrderRecordBean() {
		return orderRecordBean;
	}

	public void setOrderRecordBean(OrderRecordBean orderRecordBean) {
		this.orderRecordBean = orderRecordBean;
	}

	public Set<OrderDetailBean> getOrderDetailBean() {
		return orderDetailBean;
	}

	public void setOrderDetailBean(Set<OrderDetailBean> orderDetailBean) {
		this.orderDetailBean = orderDetailBean;
	}

	public CheckoutBean getCheckoutBean() {
		return checkoutBean;
	}

	public void setCheckoutBean(CheckoutBean checkoutBean) {
		this.checkoutBean = checkoutBean;
	}
	
	

}
