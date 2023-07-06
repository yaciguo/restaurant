package com.ispan.eeit64.controller;

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
	
//	@GetMapping("/product")
//	public String product() {
//		return "product";
//	}
	@GetMapping("/checkout")
	public String checkout() {
		return "checkout";
	}
	@GetMapping("/table")
	public String table() {
		return "table";
	}

	@GetMapping("/hello")
	public String hello(@RequestParam(value = "name", required = false) String visitor, Model model) {
		String message = visitor != null ? visitor + "，您好" : "訪客，您好";
		model.addAttribute("helloMessage", message);
		return "greeting";
	}

}
