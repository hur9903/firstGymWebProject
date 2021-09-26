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
import kr.co.firstgym.util.PageCreator;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private IProductListService service;

	//상품리스트로 이동
	@GetMapping("/productListPage")
	public String productListPage(Model model, SearchPagingVO paging) {
		System.out.println("페이지 번호: " + paging.getPage());
		paging.setCountPerPage(12);
		System.out.println("한 페이지에 보여줄 게시물 개수: " + paging.getCountPerPage());
		System.out.println("검색어: " + paging.getText_box());
		List<ProductVO> product = service.getList(paging);
		System.out.println("DB에서 가져온 게시물 개수: " + product.size());
		
		PageCreator pc = new PageCreator();
		pc.setPaging(paging);
		int totalCount = service.totalCount(paging);
		System.out.println("총 게시물 개수: " + totalCount);
		pc.setArticleTotalCount(totalCount);
		
		System.out.println("완성된 pc: " + pc);
		
		model.addAttribute("list", product);
		model.addAttribute("pc", pc);
		
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
