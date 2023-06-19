package com.ispan.eeit64.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

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

	@ManyToOne
	@JoinColumn(name = "FK_OrderBean_Id")
	private OrderBean orderBean;
}
