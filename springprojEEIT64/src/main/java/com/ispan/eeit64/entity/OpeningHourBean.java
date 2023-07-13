package com.ispan.eeit64.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "openinghour")
public class OpeningHourBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "dayOfWeek", nullable = false, columnDefinition = "INT(1) COMMENT '星期幾'")
	private int dayOfWeek;

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm", timezone="GMT+8")
	@Column(name = "startTime", nullable = false, columnDefinition = "TIME COMMENT '開始營業時間'")
	private Date startTime;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm", timezone="GMT+8")
	@Column(name = "endTime", nullable = false, columnDefinition = "TIME COMMENT '結束營業時間'")
	private Date endTime ;
	
	public OpeningHourBean() {
	}

	public OpeningHourBean(Integer id, int dayOfWeek, Date startTime, Date endTime) {
		super();
		this.id = id;
		this.dayOfWeek = dayOfWeek;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getDayOfWeek() {
		return dayOfWeek;
	}

	public void setDayOfWeek(int dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");		
		try {
			this.startTime = dateFormat.parse(startTime);
		} catch (ParseException e) {
			this.startTime = new Date(0);
		}
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");		
		try {
			this.endTime = dateFormat.parse(endTime);
		} catch (ParseException e) {
			this.endTime = new Date(0);
		}
	}

	@Override
	public String toString() {
		return "OpeningHourBean [id=" + id + ", dayOfWeek=" + dayOfWeek + ", startTime=" + startTime + ", endTime="
				+ endTime + "]";
	}
}
