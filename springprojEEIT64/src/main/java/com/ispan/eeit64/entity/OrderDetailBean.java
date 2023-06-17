package com.ispan.eeit64.entity;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "orderDetail")
public class OrderDetailBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", length = 10)
    private Integer id;
    
    //fk
    @OneToOne(cascade=CascadeType.PERSIST)
    @JoinColumn(name="dishId", nullable=false , foreignKey=@ForeignKey(name = "od_fk_dish"))
    private DishBean dish;

    @Column(name = "quantity", columnDefinition = "int(11) NOT NULL COMMENT '單品數量'")
    private Integer quantity;

//    @Column(name = "unitPrice", columnDefinition = "int(11) NOT NULL COMMENT '單價'")
//    private Integer unitPrice;
    
    @ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="orderId", nullable=false , foreignKey=@ForeignKey(name = "orders_id_fk"))  
	private OrderBean orderBean;
}
