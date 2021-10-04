package kr.co.firstgym.controller;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.firstgym.bmi.service.IBmiService;
import kr.co.firstgym.command.BmiResultVO;
import kr.co.firstgym.command.UserVO;
import kr.co.firstgym.util.PageCreator;
import kr.co.firstgym.util.PageVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private IBmiService service;
	
	//마이페이지 메인 이동
	@GetMapping("/mainPage")
	public String mypageMainPage(PageVO paging, Model model, HttpSession session) {
		paging.setCountPerPage(5);
		UserVO vo = (UserVO) session.getAttribute("login");
		if(vo == null) {
			vo = (UserVO) session.getAttribute("noIdLogin");
		}
		
		model.addAttribute("user", vo);
		System.out.println("controller: " + vo.getUserId());
		List<BmiResultVO> list = service.selectOne(vo.getUserId(), paging);
		System.out.println(list);
		model.addAttribute("list", list);
		
		PageCreator pc = new PageCreator();
		pc.setPaging(paging);
		pc.setArticleTotalCount(service.countBMI(vo.getUserId()));
		System.out.println("페이지 정보: " + pc);
		model.addAttribute("pc", pc);
		//System.out.println(list);
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
