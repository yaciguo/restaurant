package com.ispan.eeit64.entity;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "category")
public class CategoryBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", columnDefinition = "INT(11) NOT NULL COMMENT'id為分類依據1 套餐 2麵類'")
	private Integer id;

	@Column(name = "name", columnDefinition = "varchar(20) NOT NULL COMMENT'分類名稱'")
	private String name;

    @OneToMany(
    		mappedBy = "categoryBean", 
    		fetch=FetchType.EAGER, 
    		cascade = { CascadeType.ALL }, 
    		orphanRemoval = false
	  )
	@JsonBackReference
    @JsonIgnore//=============sara==============
    private Set<DishBean> dishBean = new LinkedHashSet<>();

	@Override
	public String toString() {
		return "CategoryBean [id=" + id + ", name=" + name + ", dishBean=" + dishBean + "]";
	}

	public CategoryBean() {
		super();
	}

	public CategoryBean(Integer id) {
		super();
		this.id = id;
	}

	public CategoryBean(String name) {
		super();
		this.name = name;
	}

	public CategoryBean(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
    public CategoryBean(String name, Set<DishBean> dishBean) {
        super();
        this.name = name;
        this.dishBean = dishBean;
    }

	public CategoryBean(Integer id, String name, Set<DishBean> dishBean) {
		super();
		this.id = id;
		this.name = name;
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

	public Set<DishBean> getDishBean() {
		return dishBean;
	}

	public void setDishBean(Set<DishBean> dishBean) {
		this.dishBean = dishBean;
	}


}
