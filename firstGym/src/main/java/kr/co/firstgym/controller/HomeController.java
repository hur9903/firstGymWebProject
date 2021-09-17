package kr.co.firstgym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomeController {
	
	// 홈 화면으로 이동
	@GetMapping("/home")
	public String home() {
		return "";
	}
	
}
