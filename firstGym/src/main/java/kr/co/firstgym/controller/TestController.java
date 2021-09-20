package kr.co.firstgym.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.firstgym.command.UserVO;

@Controller
@RequestMapping("/test")
public class TestController {

//	@GetMapping("/login")
//	public String testLogin(HttpSession session){
//		UserVO vo = new UserVO();
////		vo.
//		session.setAttribute("login", vo);
//		return "/home";
//	}
}
