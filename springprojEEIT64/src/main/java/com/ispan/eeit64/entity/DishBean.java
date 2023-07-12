package com.ispan.eeit64.entity;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "dish")
public class DishBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", length = 100)
	private Integer id;

	@Column(name = "name", columnDefinition = "varchar(100) NOT NULL COMMENT'餐點名稱'")
	private String name;
	
	@JsonIgnoreProperties("dishBean") // 忽略属性的序列化sara================
	@ManyToOne
	@JoinColumn(name = "FK_categoryId", nullable = false, foreignKey = @ForeignKey(name = "dish_ibfk_1"))
	private CategoryBean categoryBean;

	@Column(name = "price", columnDefinition = "INT(10) NOT NULL COMMENT'餐點價格'")
	private Integer price;

	@Column(name = "cost", columnDefinition = "INT(10) NOT NULL COMMENT'餐點成本'")
	private Integer cost;

	@Column(name = "picture", columnDefinition = "TEXT NOT NULL COMMENT'照片'")
	private String picture;

	@Column(name = "description", columnDefinition = "varchar(200) NOT NULL COMMENT'餐點描述'")
	private String description;

	@Column(name = "status", columnDefinition = "varchar(10) NOT NULL COMMENT'餐點狀態 N無,Y有'")
	private String status;
	
	@Column(name = "categoryId", nullable = false)
	private int categoryId;

	public int getCategoryId() {
	    return categoryId;
	}

	public void setCategoryId(int categoryId) {
	    this.categoryId = categoryId;
	}


	@JsonBackReference
	@JsonIgnoreProperties("dishBean") // 忽略属性的序列化sara==============
	@OneToMany(mappedBy = "dishBean")
	private Set<ActivityBean> activityBean = new LinkedHashSet<>();

	public DishBean() {
		super();
	}
	
	
	
	
	public DishBean(Integer id) {
		super();
		this.id = id;
	}


	public DishBean(String name, CategoryBean categoryBean, Integer price, Integer cost, String picture, String description, String status) {
		super();
		this.name = name;
		this.categoryBean = categoryBean;
		this.price = price;
		this.cost = cost;
		this.picture = picture;
		this.description = description;
		this.status = status;
	}




	public DishBean(Integer id, String name, CategoryBean categoryBean, Integer price, Integer cost, String picture,
			String description, String status) {
		super();
		this.id = id;
		this.name = name;
		this.categoryBean = categoryBean;
		this.price = price;
		this.cost = cost;
		this.picture = picture;
		this.description = description;
		this.status = status;
	}

	public DishBean(Integer id, String name, CategoryBean categoryBean, Integer price, Integer cost, String picture,
			String description, String status, Set<ActivityBean> activityBean) {
		super();
		this.id = id;
		this.name = name;
		this.categoryBean = categoryBean;
		this.price = price;
		this.cost = cost;
		this.picture = picture;
		this.description = description;
		this.status = status;
		this.activityBean = activityBean;
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

	public CategoryBean getCategoryBean() {
//		  if (categoryBean == null) {
//		        categoryBean = new CategoryBean();
//		    }
		    return categoryBean;
		
	}

	public void setCategoryBean(CategoryBean categoryBean) {
		this.categoryBean = categoryBean;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getCost() {
		return cost;
	}

	public void setCost(Integer cost) {
		this.cost = cost;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Set<ActivityBean> getActivityBean() {
		return activityBean;
	}

	public void setActivityBean(Set<ActivityBean> activityBean) {
		this.activityBean = activityBean;
	}

	@Override
	public String toString() {
		return "DishBean [" + (id != null ? "id=" + id + ", " : "") + (name != null ? "name=" + name + ", " : "")
				+ (categoryBean != null ? "categoryBean=" + categoryBean + ", " : "")
				+ (price != null ? "price=" + price + ", " : "") + (cost != null ? "cost=" + cost + ", " : "")
				+ (picture != null ? "picture=" + picture + ", " : "")
				+ (description != null ? "description=" + description + ", " : "")
				+ (status != null ? "status=" + status + ", " : "")
				+ (activityBean != null ? "activityBean=" + activityBean : "") + "]";
	}


}
