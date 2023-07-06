package com.ispan.eeit64.jsonBean;

//update
public class ReservationsJson {
	public Integer id;
	public String reservationStatus;
	public String submitTime;
	public String date;
	public String startTime;
	public String endTime;
	public String actualEndTime;
	public Integer pNumber;
	public String name;
	public String gender;
	public String phone;
	public String email;
	public String note;
	public Integer FK_FdTableBean_Id;
	
	public ReservationsJson(Integer id, String reservationStatus, String submitTime, String date, String startTime,
			String endTime, String actualEndTime, Integer pNumber, String name, String gender, String phone,
			String email, String note, Integer fK_FdTableBean_Id) {
		super();
		this.id = id;
		this.reservationStatus = reservationStatus;
		this.submitTime = submitTime;
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
		this.actualEndTime = actualEndTime;
		this.pNumber = pNumber;
		this.name = name;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.note = note;
		FK_FdTableBean_Id = fK_FdTableBean_Id;
	}	
	
}
