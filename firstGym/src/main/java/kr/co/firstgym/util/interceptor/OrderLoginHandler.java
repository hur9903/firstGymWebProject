package kr.co.firstgym.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.firstgym.command.UserVO;

public class OrderLoginHandler extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("login");
		
		if(vo != null) {	
			return true; //컨트롤러로 요청의 진입을 허용.		
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<script> \r\n");
		out.print("alert('로그인 후 이용 할 수 있습니다.'); \r\n");
		out.print("history.back()");
		out.print("</script>");
		//out.flush();
		
		session.setAttribute("noLogMsg", "noLogin");
		
		response.sendRedirect("/myweb/user/loginPage");
					
		return false;
		
	}

	
	
}
