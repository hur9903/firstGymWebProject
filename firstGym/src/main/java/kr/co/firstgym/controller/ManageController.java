package kr.co.firstgym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manage")
public class ManageController {

	//매니저 페이지 이동
	@GetMapping("/manager")
	public String manage() {
		return "manage/manager";
	}
	
	//신고하기
	@PostMapping("/report")
	public String report() {
		return "";
	}
	
	//신고목록으로 이동
	@GetMapping("/reportPage")
	public String reportPage() {
		return "";
	}
}
