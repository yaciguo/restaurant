package com.ispan.eeit64.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "order_detail")
public class OrderDetailBean {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", length = 10)
    private Integer id;
    //fk
    @Column(name = "dish_id", columnDefinition = "int(10) DEFAULT NULL COMMENT '餐點id'")
    private Integer dish_id;
//    //fk
//    @Column(name = "setmeal_id", columnDefinition = "int(10) DEFAULT  COMMENT '套餐id'")
//    private Integer setmeal_id;

    @Column(name = "quantity", columnDefinition = "int(11) NOT NULL COMMENT '數量'")
    private Integer quantity;

    @Column(name = "UnitPrice", columnDefinition = "int(11) NOT NULL COMMENT '單價'")
    private Integer UnitPrice;
    
    @ManyToOne 
	@JoinColumn(name="order_id", nullable=false , foreignKey=@ForeignKey(name = "orders_ibfk_1"))  
	private OrderBean orderBean;
}
