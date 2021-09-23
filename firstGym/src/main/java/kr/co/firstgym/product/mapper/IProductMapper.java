package kr.co.firstgym.product.mapper;

import java.util.List;

import kr.co.firstgym.command.ProductVO;
import kr.co.firstgym.command.SearchPagingVO;

public interface IProductMapper {
	
	//상품 상세보기 이동 기능
	public ProductVO getContent(int pNum);
			
	//상품 목록
	List<ProductVO> getList(SearchPagingVO searchPaging);
}
