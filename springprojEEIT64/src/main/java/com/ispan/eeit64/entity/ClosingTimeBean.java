package com.ispan.eeit64.entity;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "closingtime")
public class ClosingTimeBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	@Column(name = "startDate", nullable = false, columnDefinition = "DateTime COMMENT '開始休假時間'")
	private Date startDate;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone="GMT+8")
	@Column(name = "endDate", nullable = false, columnDefinition = "DateTime COMMENT '結束休假時間'")
	private Date endDate;
	
	@Column(name = "description", nullable = true, columnDefinition = "VARCHAR(1000) COMMENT '休假說明'")
	private String description;

	@Override
	public String toString() {
		return "ClosingTimeBean [id=" + id + ", startDate=" + startDate + ", endDate=" + endDate + ", description="
				+ description + "]";
	}

	public ClosingTimeBean() {
		super();
	}

	public ClosingTimeBean(Date startDate, Date endDate, String description) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
		this.description = description;
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

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
