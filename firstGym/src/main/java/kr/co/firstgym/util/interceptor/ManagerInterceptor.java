package kr.co.firstgym.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.firstgym.command.UserVO;

public class ManagerInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest req, 
							 HttpServletResponse res, 
							 Object obj) 
	throws Exception {
		System.out.println("매니저로그인 권한 인터셉터!");
		
		HttpSession session = req.getSession();
		UserVO user = (UserVO)session.getAttribute("login");
		
		if(user != null) { //로그인 했다면
			if(user.getUserGrade().equals("manager")) { //매니저라면
				return true;				
			} else { //일반 회원이라면
				res.setContentType("text/html; charset=utf-8");
				PrintWriter name = res.getWriter();
				name.print("<script> ");
				name.print("alert('접근 권한이 없습니다.');");
				
				String contextPath = req.getContextPath();
				name.print("location.href='" + contextPath + "';");
				name.print("</script>");
				
				name.flush();
				
				return false;
			}
		} else { //로그인을 안했다면
			
			res.setContentType("text/html; charset=utf-8");
			PrintWriter name = res.getWriter();
			name.print("<script> ");
			name.print("alert('접근 권한이 없습니다.');");
			
			String contextPath = req.getContextPath();
			name.print("location.href='" + contextPath + "';");
			name.print("</script>");
			
			name.flush();
			
			return false;
			
		}
	}

}
