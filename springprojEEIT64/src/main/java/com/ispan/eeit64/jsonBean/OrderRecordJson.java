package com.ispan.eeit64.jsonBean;

//update
public class OrderRecordJson {
	public Integer id;
	public Integer FK_OrderBean_Id;	
	public String order_establish;
	public String order_finish;
	public String order_cancel;
	public String order_deal;
	public OrderRecordJson(Integer id, Integer fK_OrderBean_Id, String order_establish, String order_finish,
			String order_cancel, String order_deal) {
		super();
		this.id = id;
		FK_OrderBean_Id = fK_OrderBean_Id;
		this.order_establish = order_establish;
		this.order_finish = order_finish;
		this.order_cancel = order_cancel;
		this.order_deal = order_deal;
	}
	
}
