package com.ispan.eeit64.entity;

import java.sql.Date;
import java.util.List;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "activity")
@Access(AccessType.FIELD)
public class ActivityBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "name", nullable = false, columnDefinition = "VARCHAR(50) COMMENT '活動名稱'")
	private String name;

	@Column(name = "type", nullable = false, columnDefinition = "VARCHAR(50) COMMENT '活動類型discount(折扣)gift(贈禮)'")
	private String type;
	
	@Column(name = "amount", nullable = false, columnDefinition = "INT DEFAULT 9999 COMMENT '達標金額'")
	private Integer amount;

	@Column(name = "startDate", nullable = false, columnDefinition = "DATE COMMENT '活動開始日'")
	private Date startDate;

	@Column(name = "endDate", nullable = false, columnDefinition = "DATE COMMENT '活動結束日'")
	private Date endDate;
	

//    @OneToMany(mappedBy = "activity")
//    private List<OrderBean> OrderBean;

}
