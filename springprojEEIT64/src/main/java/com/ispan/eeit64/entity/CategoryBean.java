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

@Entity
@Table(name = "category")
public class CategoryBean {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "INT(11) NOT NULL COMMENT'id為分類依據1 套餐 2麵類'")
    private Integer id;

    @Column(name = "name", columnDefinition = "varchar(20) NOT NULL COMMENT'分類名稱'")
    private String name;
    
    @OneToMany(mappedBy = "categoryBean", fetch=FetchType.EAGER, 
	        cascade = { CascadeType.PERSIST }, orphanRemoval = false
	  )
    private Set<DishBean> dishBean = new LinkedHashSet<>();
    
}

