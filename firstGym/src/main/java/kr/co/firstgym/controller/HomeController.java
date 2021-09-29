package kr.co.firstgym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.firstgym.home.service.IHomeService;

@Controller
public class HomeController {
	
	@Autowired
	private IHomeService service;
	
	// 홈 화면으로 이동
	@GetMapping("/")
	public String home(Model model) {
			
		model.addAttribute("bestList", service.getBestList());
		model.addAttribute("recentList", service.getRecentList());
		model.addAttribute("bestProduct", service.getBestProduct());
		
		return "home/home";
	}
	
}
