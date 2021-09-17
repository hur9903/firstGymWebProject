package kr.co.firstgym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	//로그인 페이지로 이동
	@GetMapping("/loginPage")
	public String loginPage() {
		return "";
	}
	
	//아이디 로그인 진행
	@PostMapping("/idLogin")
	public String idLogin() {
		return "";
	}
	
	//비회원 로그인 진행
	@PostMapping("/nonidLogin")
	public String nonidLogin() {
		return "";
	}
	
	//회원가입 페이지 이동
	@GetMapping("/joinPage")
	public String joinPage() {
		return "";
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
	public String join() {
		return "";
	}
	
	//사용자 정보 수정
	@PostMapping("/modifyInfo")
	public String modifyInfo() {
		return "";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout() {
		return "";
	}
}
