package com.ispan.eeit64.entity;

import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
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

    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name = "category_id", nullable = false, foreignKey = @ForeignKey(name = "dish_ibfk_1"))
    private CategoryBean categoryId;

    @Column(name = "price", columnDefinition = "INT(10) NOT NULL COMMENT'餐點價格'")
    private Integer price;

    @Column(name = "cost", columnDefinition = "INT(10) NOT NULL COMMENT'餐點成本'")
    private Integer cost;

    @Column(name = "picture", columnDefinition = "blob NOT NULL COMMENT'照片'")
    private Blob picture;

    @Column(name = "description", columnDefinition = "varchar(200) NOT NULL COMMENT'餐點描述'")
    private String description;

    @Column(name = "status", columnDefinition = "varchar(10) NOT NULL COMMENT'餐點狀態 N無,Y有'")
    private Integer status;

//
//	@ManyToMany(mappedBy = "dishBeans")
//	private Set<SetmealBean> setmealBeans = new HashSet<SetmealBean>(0);

}
