package com.ispan.eeit64.entity;

import java.sql.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "checkout")
@Access(AccessType.FIELD)
public class CheckoutBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", length = 200)
	private Integer id;

	@Column(name = "payTime", columnDefinition = "DATETIME NOT NULL COMMENT '結帳時間'")
	private Date payTime;

	@Column(name = "payStatus", columnDefinition = "VARCHAR(20) NOT NULL COMMENT '交易狀態Y,N'")
	private String payStatus;

	@Column(name = "note", columnDefinition = "VARCHAR(200) DEFAULT NULL COMMENT '備註'")
	private String note;
	
	@OneToOne(cascade=CascadeType.PERSIST)
    @JoinColumn(name="FK_orderId")
	private OrderBean order;
}
