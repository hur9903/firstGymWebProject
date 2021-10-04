package kr.co.firstgym.util.interceptor;

import java.io.PrintWriter;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.firstgym.command.UserVO;


public class UserAuthHandler extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("로그인 권한 인터셉터 등장!");
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("login");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(vo != null) {
			System.out.println("로그인 한 사람! 통과!");
			return true;
		}
		
		out.print("<script> \r\n");
		out.print("alert('로그인 하신 회원만 이용이 가능합니다.'); \r\n");
		out.print("history.back()");
		out.print("</script>");

		out.flush();

		
		return false;
	}


	
}







