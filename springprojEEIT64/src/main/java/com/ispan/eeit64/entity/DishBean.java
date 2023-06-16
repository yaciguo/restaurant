package com.ispan.eeit64.entity;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
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

@Entity
@Table(name = "dish")
public class DishBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", length = 100)
	private Integer id;

	@Column(name = "name", columnDefinition = "varchar(100) NOT NULL COMMENT'餐點名稱'")
	private String name;

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
	

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "categoryId",  foreignKey = @ForeignKey(name = "dish_id_fk"))
	private CategoryBean categoryBean;

	@OneToMany(mappedBy = "dishBean")
	private Set<ActivityBean> activityBean = new LinkedHashSet<>();
}
