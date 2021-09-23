package kr.co.firstgym.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.firstgym.command.OrderProductVO;
import kr.co.firstgym.command.UserVO;
import kr.co.firstgym.order.mapper.IOrderMapper;
import kr.co.firstgym.order.service.IOrderService;
import kr.co.firstgym.util.PageCreator;
import kr.co.firstgym.util.PageVO;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private IOrderService service;

	//구매목록 페이지로 이동
	@GetMapping("/orderListPage")
	public String orderListPage(HttpSession session, PageVO pvo, Model model) {
		//UserVO uvo = (UserVO) session.getAttribute("login");
		//String userId = uvo.getUserId();
		System.out.println("페이지정보: " + pvo);
		PageCreator pc = new PageCreator();
		pc.setPaging(pvo);
		int total = service.getTotal(pvo, "heoheo");
		pc.setArticleTotalCount(total);
		System.out.println("pc: " + pc);
		
		model.addAttribute("OrderProductList", service.getList(pvo, "heoheo"));
		model.addAttribute("pc", pc);
		
		return "order/orderList";
	}
	
	//주문 상세내역페이지로 이동
	@GetMapping("/orderDetailPage")
	public String orderDetailPage(@RequestParam int o_num, Model model) {
		
		model.addAttribute("OrderProduct", service.getContent(o_num));
		
		return "order/orderDetail";
	}
	
	//결제화면으로 이동
	@GetMapping("/purchasePage")
	public String purchasePage() {
		return "order/purchase";
	}
	
	//결제 진행
	@RequestMapping("/purchase")
	public String purchase() {
		return "";
	}
}
