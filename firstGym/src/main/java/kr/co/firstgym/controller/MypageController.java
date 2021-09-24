package kr.co.firstgym.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.firstgym.command.BmiResultVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	//마이페이지 메인 이동
	@GetMapping("/mypageMainPage")
	public String mypageMainPage() {
		return "mypage/mypageMain";
	}
	
	//bmi리스트 가져오기
	@GetMapping("/bmiList")
	public String bmiList(Model model, HttpSession session,
						  @RequestParam("bmi_num") int[] bmi_num) {
		//BMI결과 리스트 DB에서 가져오기
		List<BmiResultVO> bmiList = new ArrayList<>();
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
