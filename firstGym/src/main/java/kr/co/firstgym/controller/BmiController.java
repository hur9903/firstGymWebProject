package kr.co.firstgym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/bmi")
public class BmiController {
	
	//bmi 검사 페이지로 이동
	@GetMapping("/bmiPage")
	public String bmiPage() {
		return "";
	}
	
	//bmi 검사
	@PostMapping("/bmiResult")
	public String bmiResult() {
		return "";
	}
}
