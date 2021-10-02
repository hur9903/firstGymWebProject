package kr.co.firstgym.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.firstgym.command.BoardVO;
import kr.co.firstgym.command.UserVO;

public class BoardPageInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
			throws Exception {
		
		UserVO user = (UserVO)request.getSession().getAttribute("login");
		
		System.out.println("BoardPageInterceptor 실행");
		
		//로그인x
		if(user != null) {
			System.out.println("로그인o");
			//게시글 수정일 경우
			if(modelAndView.getModel().containsKey("article")) {
				System.out.println("게시글 수정");
				BoardVO article = (BoardVO)modelAndView.getModel().get("article");
				if(! article.getUserId().equals(user.getUserId())) {
					modelAndView.addObject("msg", "needLogin");
					modelAndView.setViewName("/board/boardListPage");
				}
			}
		} else {
			System.out.println("로그인x");
			
			modelAndView.addObject("msg", "needLogin");
			modelAndView.setViewName("/user/login");
		}
	}
}
