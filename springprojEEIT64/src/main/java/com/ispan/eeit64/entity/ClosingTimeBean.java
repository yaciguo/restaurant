package com.ispan.eeit64.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "closingtime")
public class ClosingTimeBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "startDate", nullable = false, columnDefinition = "Date COMMENT '開始休假時間'")
	private java.sql.Date startDate;
	
	@Column(name = "endDate", nullable = false, columnDefinition = "Date COMMENT '結束休假時間'")
	private java.sql.Date endDate;
	
	@Column(name = "description", nullable = false, columnDefinition = "VARCHAR(1000) COMMENT '休假說明'")
	private String description;
}
