package kr.co.firstgym.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.firstgym.command.OrderPageVO;
import kr.co.firstgym.command.OrdersVO;
import kr.co.firstgym.command.UserVO;
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
	public String orderListPage(HttpSession session, OrderPageVO page, Model model) {
		UserVO uvo = (UserVO) session.getAttribute("login");
		if(uvo == null) {
			uvo = (UserVO) session.getAttribute("noIdLogin");
		}
		
		int total = service.getTotal(uvo.getUserId());
		page.setTotalArticleCount(total);
		
		model.addAttribute("OrderProductList", service.getList(page, uvo.getUserId(), (UserVO)session.getAttribute("noIdLogin")));
		model.addAttribute("page", page);
		System.out.println(model.getAttribute("noOrderMsg"));
		model.addAttribute("noOrderMsg", model.getAttribute("noOrderMsg"));
		
		return "order/orderList";
		/*
		UserVO uvo = (UserVO) session.getAttribute("login");
		//String userId = uvo.getUserId();
		System.out.println("페이지정보: " + pvo);
		PageCreator pc = new PageCreator();
		pvo.setCountPerPage(5);
		pc.setPaging(pvo);
		int total = service.getTotal(pvo, uvo.getUserId());
		pc.setArticleTotalCount(total);
		System.out.println("pc: " + pc);
		
		model.addAttribute("OrderProductList", service.getList(pvo, uvo.getUserId()));
		model.addAttribute("page", pc);
		
		return "order/orderList";
		*/
	}
	
	//주문 상세내역페이지로 이동
	@GetMapping("/orderDetailPage")
	public String orderDetailPage(@RequestParam int orderNum, Model model, RedirectAttributes ra) {
		
		if(service.getContent(orderNum) == null) {
			ra.addFlashAttribute("noOrderMsg", "noOrderMsg");
			return "redirect:/order/orderListPage";
		}
		
		model.addAttribute("OrderProduct", service.getContent(orderNum));
		
		return "order/orderDetail";
	}
	
	//결제화면으로 이동
	@GetMapping("/purchasePage")
	public String purchasePage(@RequestParam int proNum, @RequestParam int quantity, HttpSession session, Model model,
			RedirectAttributes ra) {
		
		UserVO uvo = (UserVO) session.getAttribute("login");
		if(uvo == null) {
			uvo = (UserVO) session.getAttribute("noIdLogin");
		}
		
		if(service.getProduct(proNum) == null) {
			ra.addFlashAttribute("noProductMsg", "noProductMsg");
			return "redirect:/product/productListPage";
		}
		
		model.addAttribute("user", uvo);
		model.addAttribute("quantity", quantity);
		model.addAttribute("product", service.getProduct(proNum));
		
		return "order/purchase";
	}
	
	//결제 진행
	@PostMapping("/purchase")
	public String purchase(@RequestParam int proNum, OrdersVO vo, RedirectAttributes ra, Model model) throws InterruptedException {
		
		if(service.getProduct(proNum) == null) {
			ra.addFlashAttribute("noProductMsg", "noProductMsg");
			return "redirect:/product/productListPage";
		}
		
		service.regist(vo);
		Thread.sleep(1000);
		int seq = service.selectSeq();
		String name = service.selectName(proNum);
		int price = service.selectPrice(seq);
		Timestamp date = Timestamp.valueOf(service.selectDate(seq));
		String category = service.selectCategory(proNum);
		service.registOP(vo, seq, proNum, name, price, date, category);
		
		//등록 성공 여부를 1회용으로 전달하기 위한 ra객체의 메서드
		ra.addFlashAttribute("msg", "정상 등록 처리되었습니다.");
				
		return "redirect:/order/orderListPage";
	}
}
