package kr.co.firstgym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.firstgym.bmi.service.IBmiService;
import kr.co.firstgym.command.BmiResultVO;

@Controller
@RequestMapping("/bmi")
public class BmiController {
	
	@Autowired
	private IBmiService service;
	
//	//특정 회원의 bmi 검사 결과를 가져오는 메서드
//	@PostMapping("/selectOne")
//	public String selectOne(@RequestBody String userId, Model model) {
//		System.out.println("bmi id: " + userId);
//		List<BmiResultVO> list = service.selectOne(userId);
//		System.out.println(list);
//		model.addAttribute("list", list);
//		System.out.println(list);
//		return "mypage/myPageMain";
//	}
	
	
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
