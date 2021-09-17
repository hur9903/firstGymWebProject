package kr.co.firstgym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {

	//구매목록 페이지로 이동
	@GetMapping("/orderListPage")
	public String orderListPage() {
		return "";
	}
	
	//주문 상세내역페이지로 이동
	@GetMapping("/orderDetailPage")
	public String orderDetailPage() {
		return "";
	}
	
	//결제화면으로 이동
	@GetMapping("/purchasePage")
	public String purchasePage() {
		return "";
	}
	
	//결제 진행
	@RequestMapping("/purchase")
	public String purchase() {
		return "";
	}
}
