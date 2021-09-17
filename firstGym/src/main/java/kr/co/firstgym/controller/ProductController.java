package kr.co.firstgym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {

	//상품리스트로 이동
	@GetMapping("/productListPage")
	public String productListPage() {
		return "";
	}
	
	//상품상세페이지 이동
	@GetMapping("/productDetailPage")
	public String productDetailPage() {
		return "";
	}
	
	//상품 후기 작성
	@PostMapping("/productReviewPage")
	public String productReviewPage() {
		return "";
	}
	
	//상품 문의페이지로 이동
	@GetMapping("/productQNAPage")
	public String productQNAPage() {
		return "";
	}
}
