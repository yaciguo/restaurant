package com.ispan.eeit64.entity;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "reservation")
public class ReservationBean {
	//有更改id型態為Integer================
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", length = 10)
    private Integer id;

    @Column(name = "name", columnDefinition = "varchar(11) NOT NULL COMMENT '姓名'")
    private String name;

    @Column(name = "gender", columnDefinition = "varchar(11) NOT NULL COMMENT '性別F, M'")
    private String gender;

    @Column(name = "phone", columnDefinition = "varchar(20) NOT NULL COMMENT '電話'")
    private String  phone;

    @Column(name = "pNumber", columnDefinition = "int(11) NOT NULL COMMENT '人數'")
    private Integer pNumber;

    @Column(name = "date", columnDefinition = "date NOT NULL COMMENT '日期'")
    private Date date;

    @Column(name = "startTime", columnDefinition = "time NOT NULL COMMENT '時間'")
    private Time startTime;
    
    @Column(name = "endTime", columnDefinition = "time NOT NULL COMMENT '時間'")
    private Time endTime;

    @Column(name = "email", columnDefinition = "varchar(100) DEFAULT NULL COMMENT 'email'")
    private String email;

    @Column(name = "note", columnDefinition = "varchar(200) DEFAULT NULL COMMENT '備註'")
    private String note;
    
    @Column(name = "submitTime", columnDefinition = "datetime NOT NULL COMMENT ' 送出時間'")
    private java.sql.Timestamp submitTime;
    
    //是不是要可以null?有更改成nullable = true 
    @ManyToOne//delete (cascade=CascadeType.ALL)
    @JoinColumn(name = "FK_FdTableBean_Id", nullable = true, foreignKey = @ForeignKey(name = "res_fk_tb"))
    private FdTableBean fdTableBean;
    
    

	public ReservationBean() {
		super();
	}

	// add
	public ReservationBean(String name, String gender, String phone, Integer pNumber, Date date,
			Time startTime, Time endTime, String email, String note, Timestamp submitTime, FdTableBean fdTableBean) {
		super();
		this.name = name;
		this.gender = gender;
		this.phone = phone;
		this.pNumber = pNumber;
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
		this.email = email;
		this.note = note;
		this.submitTime = submitTime;
		this.fdTableBean = fdTableBean;
	}


	public ReservationBean(Integer id, String name, String gender, String phone, Integer pNumber, Date date,
			Time startTime, Time endTime, String email, String note, Timestamp submitTime, FdTableBean fdTableBean) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.phone = phone;
		this.pNumber = pNumber;
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
		this.email = email;
		this.note = note;
		this.submitTime = submitTime;
		this.fdTableBean = fdTableBean;
	}



	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public Integer getpNumber() {
		return pNumber;
	}



	public void setpNumber(Integer pNumber) {
		this.pNumber = pNumber;
	}



	public Date getDate() {
		return date;
	}



	public void setDate(Date date) {
		this.date = date;
	}



	public Time getStartTime() {
		return startTime;
	}



	public void setStartTime(Time startTime) {
		this.startTime = startTime;
	}



	public Time getEndTime() {
		return endTime;
	}



	public void setEndTime(Time endTime) {
		this.endTime = endTime;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getNote() {
		return note;
	}



	public void setNote(String note) {
		this.note = note;
	}



	public java.sql.Timestamp getSubmitTime() {
		return submitTime;
	}



	public void setSubmitTime(java.sql.Timestamp submitTime) {
		this.submitTime = submitTime;
	}



	public FdTableBean getFdTableBean() {
		return fdTableBean;
	}



	public void setFdTableBean(FdTableBean fdTableBean) {
		this.fdTableBean = fdTableBean;
	}


	
	
    
    
}
