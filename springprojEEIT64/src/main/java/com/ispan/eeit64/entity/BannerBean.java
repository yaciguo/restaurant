package com.ispan.eeit64.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "banner")
public class BannerBean {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "pic", columnDefinition = "TEXT NOT NULL COMMENT '輪播圖'")
    private String pic;

    @Column(name = "url", columnDefinition = "VARCHAR(255) NOT NULL COMMENT '活動連結'")
    private String url;
}