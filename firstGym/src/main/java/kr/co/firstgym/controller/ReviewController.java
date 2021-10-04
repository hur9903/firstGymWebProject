package kr.co.firstgym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.firstgym.command.ReviewVO;
import kr.co.firstgym.review.service.IReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private IReviewService service;
	
	//리뷰 등록하기
	@PostMapping("/regist")
	@ResponseBody
	public String regist(@RequestBody ReviewVO vo) {
		System.out.println("파라미터값: " + vo);
		
		service.regist(vo);
		return "regSuccess";
	}
	
	@GetMapping("/getList/{pNum}")
	@ResponseBody
	public List<ReviewVO> getList(@PathVariable int pNum) {
		System.out.println("리뷰 상품번호: " + pNum);
		
		List<ReviewVO> list = service.select(pNum);
		System.out.println("리뷰 모음: " + list);
		
		return list;
	}
	
	
	
	
	
}
