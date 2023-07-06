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

    @Column(name = "pic", columnDefinition = "LONGTEXT NOT NULL COMMENT '輪播圖'")
    private String pic;

    @Column(name = "url", columnDefinition = "VARCHAR(255) COMMENT '活動連結'")
    private String url;

	@Override
	public String toString() {
		return "BannerBean [id=" + id + ", pic=" + pic + ", url=" + url + "]";
	}

	public BannerBean() {
		super();
	}

	public BannerBean(Integer id, String pic, String url) {
		super();
		this.id = id;
		this.pic = pic;
		this.url = url;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}