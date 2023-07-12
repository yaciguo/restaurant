package com.ispan.eeit64.controller;


import java.time.DayOfWeek;
import java.time.LocalDate;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

	@GetMapping("/")
	public String index() {
		return "index";
	}

	@GetMapping("/custIndex")
	public String custIndex() {
		return "custIndex";
	}
	
	@GetMapping("/nav")
	public String nav() {
		return "nav";
	}
	
	@GetMapping("/sideNav")
	public String sideNav() {
		return "sideNav";
	}

	@GetMapping("/question")
	public String question() {
		return "question";
	}
	
	@GetMapping("/osLogin")
	public String osLogin() {
		return "osLogin";
	}
	
	@GetMapping("/activity")
	public String activity() {
		return "activity";
	}
	@GetMapping("/checkout")
	public String checkout() {
		return "checkout";
	}
	  
    @GetMapping("/basicSettings")
    public String basicSettings() {
        return "basicSettings";
    }
	
	@GetMapping("/searchbooking")
	public String searchbooking() {
		return "searchbooking";
	}
	
	@GetMapping("/searchorder")
	public String searchorder() {
		return "searchorder";
	}
	
	@GetMapping("/menu")
	public String menu(Model model) {
		LocalDate currentDate = LocalDate.now();
	    DayOfWeek currentDayOfWeek = currentDate.getDayOfWeek();
	    
	    if (currentDayOfWeek == DayOfWeek.SUNDAY) {
	        model.addAttribute("closedMessage", "今日無營業"); // 添加關閉通知訊息
	    }
		
		return "menu";
	}
	
	@GetMapping("/menuInner5")
	public String menuInner5(Model model) {
		LocalDate currentDate = LocalDate.now();
	    DayOfWeek currentDayOfWeek = currentDate.getDayOfWeek();
	    
	    if (currentDayOfWeek == DayOfWeek.SUNDAY) {
	        model.addAttribute("closedMessage", "今日無營業"); // 添加關閉通知訊息
	    }
		
		return "menuInner5";
	}
	
	
	@GetMapping("/ordercheck")
	public String ordercheck() {
		return "ordercheck";
	}
	
	@GetMapping("/bookingcheck")
    public String bookingcheck() {      
        return "bookingcheck";
    }
	
	@GetMapping("/restInfo")
    public String restInfo() {      
        return "restInfo";
    }
	
	@GetMapping("/dataAnalysis")
	public String dataAnalysis() {
	    return "dataAnalysis";
	}
	@GetMapping("/test")
	public String test() {
		return "test";
	}

	
	@GetMapping("/hello")
	public String hello(@RequestParam(value = "name", required = false) String visitor, Model model) {
		String message = visitor != null ? visitor + "，您好" : "訪客，您好";
		model.addAttribute("helloMessage", message);
		return "greeting";
	}
	
	
}
