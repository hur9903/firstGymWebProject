package kr.co.firstgym.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.firstgym.command.ProductVO;
import kr.co.firstgym.command.SearchPagingVO;
import kr.co.firstgym.product.service.IProductListService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private IProductListService service;

	//상품리스트로 이동
	@GetMapping("/productListPage")
	public String productListPage(Model model, SearchPagingVO searchPaging) {
		List<ProductVO> product = service.getList(searchPaging);
		
		for(ProductVO vo : product) {
			System.out.println("controller: " + vo);
		}
		model.addAttribute("list", product);
		return "product/productList";
	}
	
	
	//상품상세페이지 이동
	@GetMapping("/productDetailPage")
	public String productDetailPage(int productNum, Model model) {
		ProductVO product = service.getContent(productNum);
		model.addAttribute("itemInfo", product);
		return "product/productDetail";
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
