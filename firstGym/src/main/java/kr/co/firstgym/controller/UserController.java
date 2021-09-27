package kr.co.firstgym.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.firstgym.command.UserVO;
import kr.co.firstgym.user.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {

	//서비스 객체 주입
	@Autowired
	private IUserService service;
	
	//로그인 페이지로 이동
	@GetMapping("/loginPage")
	public String loginPage() {
		return "user/login";
	}
	
	//아이디 로그인 진행
	@PostMapping("/idLogin")
	public String idLogin(String userId, String userPw, HttpSession session ) {
	      
		System.out.println("login 요청 들어옴" + userId + "," + userPw);
	    UserVO vo = service.login(userId, userPw);
	      
	    System.out.println("vo: " + vo);
	      
	    session.setAttribute("login", vo);
	      
	    return "/user/login";
	}
	
	//로그인 요청 처리
	@ResponseBody
	@PostMapping("/loginCheck")
	public String loginCheck(@RequestBody UserVO loginData, HttpSession session, HttpServletResponse response) {
	
		System.out.println("로그인 요청 들어옴");
		System.out.println("param: " + loginData);
	
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		UserVO dbData = service.selectOne(loginData.getUserId());
		System.out.println("dbData : " + dbData);
		
		if(dbData != null) {
			if(loginData.getUserPw().equals(dbData.getUserPw())) {
				session.setAttribute("login", dbData);
				
				return "loginOk";
			}else {
				return "pwFail";
			}
		}else {
			return "idFail";
		}
	}
		
	//비회원 로그인 진행
	@PostMapping("/nonidLogin")
	public String nonidLogin(String nonUserName, String nonUserPhone, HttpSession session, RedirectAttributes ra) {
		
		System.out.println("비회원 로그인 요청 들어옴 :" + nonUserName + "," + nonUserPhone);
		 
		session.setAttribute("noIdLogin", nonUserName);  
		session.setAttribute("noIdLogin", nonUserPhone);  		      
		
		ra.addFlashAttribute("msg", "nonUserLogin");
		
		return "redirect:/";
	}
	
	//회원가입 페이지 이동
	@GetMapping("/joinPage")
	public String joinPage() {
		return "user/join";
	}
	
	//아이디 찾기 인증번호 생성
	@ResponseBody
	@PostMapping("/findId/{findIdEmail}/{findIdName}")
	public String findId(@PathVariable("findIdName") String findIdName, @PathVariable("findIdEmail") String findIdEmail, 
						 HttpSession session, RedirectAttributes ra) {
		
		System.out.println("아이디찾기 요청 들어옴: " + findIdName + "," + findIdEmail);
		
		UserVO findVo = service.findId(findIdName, findIdEmail);
		
		session.setAttribute("findUserId", findVo.getUserId());
		
		Random random = new Random();
		
		session.setAttribute("random", random.nextInt(99999));

		return "";
	}
	
	//비번찾기 인증번호 생성
	@PostMapping("/findPw")
	public String findPw() {
		return "";
	}
	
	//인증번호 확인
	@PostMapping("/findcodeCheck")
	public String findcodeCheck() {
		return "";
	}
	
	//아이디 중복체크
	@ResponseBody
	@PostMapping("/idCheck")
	public String idCheck(@RequestBody String userId) {
		
		int result = service.checkId(userId);
		if(result == 1) {
			return "idCheckNo";
		} else {
			return "idCheckOk";
		}	
	}
	
	//이메일 중복체크
	@ResponseBody
	@PostMapping("/emailCheck")
	public String emailCheck(@RequestBody String userEmail) {
		
		int result = service.checkEmail(userEmail);
		if(result == 1) {
			return "emailCheckNo";
		} else {
			return "emailCheckOk";
		}	
	
	}
	
	//회원가입
	@PostMapping("/join")
	public String join(UserVO vo) {
		
		System.out.println("회원가입 요청 들어옴");
		System.out.println(vo);
		service.register(vo);

		return "user/login";
	}
	
	//사용자 정보 수정
	@PostMapping("/modifyInfo")
	public String modifyInfo(UserVO vo,  RedirectAttributes ra) {
		
		System.out.println("수정 요청 들어옴");
		System.out.println("수정값: " + vo);
		
		service.modify(vo);
		ra.addFlashAttribute("msg", "modifyOk");
		
		return "redirect:/mypage/mypageMainPage";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes ra) {
		
		session.invalidate();
		ra.addFlashAttribute("msg", "logoutSuccess");
		
		return "redirect:/";
	}
	
	//회원 탈퇴
	@PostMapping("/delete")
	public String delete(UserVO vo, HttpSession session, RedirectAttributes ra) {
		
		System.out.println("탈퇴 요청 들어옴");
		System.out.println(vo);
		
		UserVO delVo = (UserVO) session.getAttribute("login");
		
		String sessionPw = delVo.getUserPw();
		
		String voPw = vo.getUserPw();
		
		System.out.println(sessionPw);
		System.out.println(voPw);
		
		if(!(sessionPw.equals(voPw))) {
			ra.addFlashAttribute("msg", "delFail");
			return "redirect:/mypage/mypageMainPage";
		}else {
		
		service.delete(vo);
		session.invalidate();
		ra.addFlashAttribute("msg", "delSuccess");
		
		return "redirect:/";
		}
	}
}
