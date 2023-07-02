package com.ispan.eeit64.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ispan.eeit64.entity.ActivityBean;
import com.ispan.eeit64.entity.OrderBean;
import com.ispan.eeit64.service.impl.OrderServiceImpl;

@Controller
public class SearchOrderController {
	OrderServiceImpl service;
	
	@Autowired
    public SearchOrderController(OrderServiceImpl service) {
        this.service = service;
    }
// 自定義的類別，用於存儲訂單和折扣金額的對應關係============================
//	public class OrderWithDiscount {
//	    private OrderBean order;
//	    private int discountAmount;
//
//	    public OrderWithDiscount(OrderBean order, int discountAmount) {
//	        this.order = order;
//	        this.discountAmount = discountAmount;
//	    }
//
//		public OrderBean getOrder() {
//			return order;
//		}
//
//		public void setOrder(OrderBean order) {
//			this.order = order;
//		}
//
//		public int getDiscountAmount() {
//			return discountAmount;
//		}
//
//		public void setDiscountAmount(int discountAmount) {
//			this.discountAmount = discountAmount;
//		}
//
//	    
//	}
//	
//	private int getDiscountAmount(ActivityBean activityBean) {
//	    int discountAmount = 0;
//	    
//	    // 根據 activityBean 的邏輯查詢折扣金額
//	    // 這裡僅為示例，您需要根據實際需求和資料存取方式進行實作
//	    
//	    if (activityBean.getType().equals("discount")) {
//	        // 如果活動類型是折扣，根據達標金額和活動折扣計算折扣金額
//	        int amount = activityBean.getAmount();
//	        int discount = activityBean.getDiscount();
//	        
//	        int totalAmount = 0;
//			// 根據您的計算邏輯來計算折扣金額
//	        // 這裡僅為示例，您需要根據實際需求進行調整
//	        discountAmount = (totalAmount >= amount) ? discount : 0;
//	    } else if (activityBean.getType().equals("gift")) {
//	        // 如果活動類型是贈禮，根據您的邏輯獲取贈禮金額
//	        // 這裡僅為示例，您需要根據實際需求進行調整
//	        discountAmount = 10; // 假設贈禮金額為10元
//	    }
//	    
//	    return discountAmount;
//	}
//	
	
	
	//查詢訂單頁面======================================================
    @GetMapping("/searchorders")
    public String showOrderForm(@RequestParam(value = "customer", required = false) String customer,
                                      @RequestParam(value = "phone", required = false) String phone,
                                      Model model) {
        if (customer == null) {
        	customer = "";
        }
        if (phone == null) {
            phone = "";
        }

        model.addAttribute("customer", customer);
        model.addAttribute("phone", phone);

        return "searchorder";
    }

    @PostMapping("/searchorders")
    public String submitOrderForm(@RequestParam("customer") String customer,
                                        @RequestParam("phone") String phone,
                                        Model model) {
        List<OrderBean> orders = service.findByCustomerAndPhone(customer, phone);
//        List<OrderWithDiscount> ordersWithDiscount = new ArrayList<>();
        
//        for (OrderBean order : orders) {
//            ActivityBean activityBean = order.getActivityBean();
//            int discountAmount = 0;
//            
//            if (activityBean != null) {
//                // 透過 activityBean 去查詢折扣金額的邏輯，並賦值給 discountAmount
//                discountAmount = getDiscountAmount(activityBean);
//            }
//            
//            OrderWithDiscount orderWithDiscount = new OrderWithDiscount(order, discountAmount);
//            ordersWithDiscount.add(orderWithDiscount);
//        }
//        
        
        
        model.addAttribute("orderList", orders);

        return "searchorder";
    }
    
    

}
