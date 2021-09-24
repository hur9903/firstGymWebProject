package kr.co.firstgym.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	public String nonidLogin() {
		return "";
	}
	
	//회원가입 페이지 이동
	@GetMapping("/joinPage")
	public String joinPage() {
		return "user/join";
	}
	
	//아이디 찾기 인증번호 생성
	@PostMapping("/findId")
	public String findId() {
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
	@GetMapping("/idCheck")
	public String idCheck() {
		return "";
	}
	
	//이메일 중복체크
	@GetMapping("/emailCheck")
	public String emailCheck() {
		return "";
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
	public String modifyInfo() {
		return "";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes ra) {
		
		session.invalidate();
		ra.addFlashAttribute("msg", "logoutSuccess");
		
		return "redirect:/";
	}
}
