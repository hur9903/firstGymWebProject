package kr.co.firstgym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	//마이페이지 메인 이동
	@GetMapping("/mypageMainPage")
	public String mypageMainPage() {
		return "";
	}
	
	//bmi리스트 가져오기
	@GetMapping("/bmiList")
	public String bmiList() {
		return "";
	}
	
	//출첵화면으로 이동
	@GetMapping("/dailyCheckPage")
	public String dailyCheckPage() {
		return "";
	}
	
	//출석체크
	@PostMapping("/dailyCheck")
	public String dailyCheck() {
		return "";
	}
}
