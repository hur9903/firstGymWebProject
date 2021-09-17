package kr.co.firstgym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	//게시글 목록으로 이동
	@GetMapping("/boardListPage")
	public String boardListPage(){
		return "";
	}
	
	//게시글 등록, 수정
	
	
	
}
