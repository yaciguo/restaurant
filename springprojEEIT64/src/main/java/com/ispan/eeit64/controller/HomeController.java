package com.ispan.eeit64.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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

	@GetMapping("/question")
	public String question() {
		return "question";
	}
	
	@GetMapping("/osLogin")
	public String osLogin() {
		return "osLogin";
	}
	@GetMapping("/basicSettings")
	public String basicSettings() {
		return "basicSettings";
	}
	@GetMapping("/activity")
	public String activity() {
		return "activity";
	}
	
	@GetMapping("/booking")
	public String booking() {
		return "booking";
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
	public String menu() {
		return "menu";
	}
	
	@GetMapping("/shoppingcart")
	public String shoppingcart() {
		return "shoppingcart";
	}
	
	@GetMapping("/ordercheck")
	public String ordercheck() {
		return "ordercheck";
	}
	
	@GetMapping("/showAllDishes2")
	public String showAllDishes2() {
		return "showAllDishes2";    
		         
	}
	
	@GetMapping("/bookingcheck")
    public String bookingcheck() {
       
        return "bookingcheck";
    }
	
	
	
	
	
	

	@GetMapping("/hello")
	public String hello(@RequestParam(value = "name", required = false) String visitor, Model model) {
		String message = visitor != null ? visitor + "，您好" : "訪客，您好";
		model.addAttribute("helloMessage", message);
		return "greeting";
	}
	
	

}
