package com.ispan.eeit64.entity;

import java.sql.Date;

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

	@Override
	public String toString() {
		return "ClosingTimeBean [id=" + id + ", startDate=" + startDate + ", endDate=" + endDate + ", description="
				+ description + "]";
	}

	public ClosingTimeBean() {
		super();
	}

	public ClosingTimeBean(Integer id, Date startDate, Date endDate, String description) {
		super();
		this.id = id;
		this.startDate = startDate;
		this.endDate = endDate;
		this.description = description;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public java.sql.Date getStartDate() {
		return startDate;
	}

	public void setStartDate(java.sql.Date startDate) {
		this.startDate = startDate;
	}

	public java.sql.Date getEndDate() {
		return endDate;
	}

	public void setEndDate(java.sql.Date endDate) {
		this.endDate = endDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
}