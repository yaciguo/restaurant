package com.ispan.eeit64.entity;

import java.sql.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "activity")
@Access(AccessType.FIELD)
public class ActivityBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "name", columnDefinition = "VARCHAR(50) NOT NULL COMMENT '活動名稱'")
	private String name;

	@Column(name = "type", columnDefinition = "VARCHAR(50) NOT NULL COMMENT '活動類型discount(折扣)gift(贈禮)'")
	private String type;

	@Column(name = "amount", columnDefinition = "INT DEFAULT 9999 COMMENT '達標金額'")
	private Integer amount;

	@Column(name = "discount", columnDefinition = "INT NOT NULL COMMENT '活動折扣'")
	private Integer discount;

	@Column(name = "startDate", columnDefinition = "DATE NOT NULL COMMENT '活動開始日'")
	private Date startDate;

	@Column(name = "endDate", columnDefinition = "DATE NOT NULL COMMENT '活動結束日'")
	private Date endDate;

	@OneToMany(mappedBy = "activityBean")
	private Set<OrderBean> orderBean = new LinkedHashSet<>();

	@JsonIgnoreProperties("activityBean") // 忽略属性的序列化sara===========
	@ManyToOne
	@JoinColumn(name = "FK_Dish_Id")
	private DishBean dishBean;


	@Override
	public String toString() {
		return "ActivityBean [id=" + id + ", name=" + name + ", type=" + type + ", amount=" + amount + ", discount="
				+ discount + ", startDate=" + startDate + ", endDate=" + endDate + ", orderBean=" + orderBean
				+ ", dishBean=" + dishBean + "]";
	}

	public ActivityBean() {
		super();
	}
	
	public ActivityBean(String name, String type, Integer discount, Integer amount,  Date startDate,
			Date endDate, DishBean dishBean) {
		super();
		this.name = name;
		this.type = type;
		this.discount = discount;
		this.amount = amount;
		this.startDate = startDate;
		this.endDate = endDate;
		this.dishBean = dishBean;
	}


	public ActivityBean(Integer id, String name, String type, Integer discount, Integer amount,  Date startDate,
			Date endDate, DishBean dishBean) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.discount = discount;
		this.amount = amount;
		this.startDate = startDate;
		this.endDate = endDate;
		this.dishBean = dishBean;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
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

	public DishBean getDishBean() {
		return dishBean;
	}

	public void setDishBean(DishBean dishBean) {
		this.dishBean = dishBean;
	}

	
}
