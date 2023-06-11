package com.ispan.eeit64.entity;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "reservation")
public class ReservationBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", length = 10)
    private int id;

    @Column(name = "name", columnDefinition = "varchar(11) NOT NULL COMMENT '姓名'")
    private String name;

    @Column(name = "gender", columnDefinition = "varchar(11) NOT NULL COMMENT '性別F, M'")
    private String gender;

    @Column(name = "phone", columnDefinition = "bigint(20) NOT NULL COMMENT '電話'")
    private long phone;

    @Column(name = "pNumber", columnDefinition = "int(11) NOT NULL COMMENT '人數'")
    private int pNumber;

    @Column(name = "date", columnDefinition = "date NOT NULL COMMENT '日期'")
    private Date date;

    @Column(name = "time", columnDefinition = "time NOT NULL COMMENT '時間'")
    private Time time;

    @Column(name = "email", columnDefinition = "varchar(100) DEFAULT NULL COMMENT 'email'")
    private String email;

    @Column(name = "note", columnDefinition = "varchar(200) DEFAULT NULL COMMENT '備註'")
    private String note;
}
