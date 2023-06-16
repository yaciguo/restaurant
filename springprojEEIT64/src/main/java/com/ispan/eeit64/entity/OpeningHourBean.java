package com.ispan.eeit64.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "openinghour")
public class OpeningHourBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "dayOfWeek", nullable = false, columnDefinition = "INT(1) COMMENT '星期幾'")
	private int dayOfWeek;

	@Temporal(TemporalType.TIME)
	@Column(name = "startTime", nullable = false, columnDefinition = "TIME COMMENT '開始營業時間'")
	private Date startTime;
	
	@Temporal(TemporalType.TIME)
	@Column(name = "endTime", nullable = false, columnDefinition = "TIME COMMENT '結束營業時間'")
	private Date endTime ;
}
