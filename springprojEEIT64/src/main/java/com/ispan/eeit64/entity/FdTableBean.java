package com.ispan.eeit64.entity;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
@Entity
@Table(name = "fdtable")
@Access(AccessType.FIELD)
public class FdTableBean {
	//delete @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Id
	@Column(name = "id", nullable = false, columnDefinition = "INT(200) COMMENT '桌號'")
	private Integer tableId;

	@Column(name = "capacity", nullable = false, columnDefinition = "INT(200) COMMENT '容納人數'")
	private Integer capacity;
	
	// edit cascade = { CascadeType.ALL } fetch=FetchType.LAZY,
	@JsonBackReference
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
	public FdTableBean(Integer tableId, Integer capacity) {
		this.tableId = tableId;
		this.capacity = capacity;
	}

	@Override
	public String toString() {
		return "FdTableBean [tableId=" + tableId + ", capacity=" + capacity + ", reservationBean=" + reservationBean
				+ "]";
	}

	public Integer getTableId() {
		return tableId;
	}

	public void setTableId(Integer tableId) {
		this.tableId = tableId;
	}

	public Integer getCapacity() {
		return capacity;
	}

	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}

	public Set<ReservationBean> getReservationBean() {
		return reservationBean;
	}

	public void setReservationBean(Set<ReservationBean> reservationBean) {
		this.reservationBean = reservationBean;
	}
	
	
}
