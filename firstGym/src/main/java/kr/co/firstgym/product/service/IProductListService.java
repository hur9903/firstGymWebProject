package kr.co.firstgym.product.service;

import java.util.List;

import kr.co.firstgym.command.ProductVO;
import kr.co.firstgym.command.SearchPagingVO;

public interface IProductListService {
	
	//상품 상세보기 이동 기능
	public ProductVO getContent(int pNum);
	
	//상품 목록
	List<ProductVO> getList(SearchPagingVO searchPasing);
	
	//총 게시물의 개수를 가져오는 메서드
	int totalCount(SearchPagingVO paging);

}
