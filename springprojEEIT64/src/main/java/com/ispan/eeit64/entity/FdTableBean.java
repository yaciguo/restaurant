package com.ispan.eeit64.entity;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Access;
import javax.persistence.AccessType;
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
@Table(name = "fdtable")
@Access(AccessType.FIELD)
public class FdTableBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false, columnDefinition = "INT(200) COMMENT '桌號'")
	private Integer tableId;

	@Column(name = "capacity", nullable = false, columnDefinition = "INT(200) COMMENT '容納人數'")
	private Integer capacity;
	
	// edit cascade = { CascadeType.ALL } fetch=FetchType.LAZY,
	@OneToMany(mappedBy = "fdTableBean", fetch=FetchType.LAZY, 
	        cascade = { CascadeType.ALL }, orphanRemoval = false)
    //@JoinColumn(name = "reserveId", nullable = false, foreignKey = @ForeignKey(name = "tb_fk_res"))
    private Set<ReservationBean> reservationBean = new LinkedHashSet<>();

	// add
	public FdTableBean() {
		super();
	}

	// add
	public FdTableBean(Integer capacity) {
		super();
		this.capacity = capacity;
	}


}
