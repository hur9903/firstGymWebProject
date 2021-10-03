package kr.co.firstgym.product.mapper;

import java.util.List;
import java.util.Map;

import kr.co.firstgym.command.ProductVO;
import kr.co.firstgym.command.SearchPagingVO;

public interface IProductMapper {
	
	//상품 상세보기 이동 기능
	public ProductVO getContent(int proNum);
			
	//상품 목록
	List<ProductVO> getList(SearchPagingVO searchPaging);
	
	//총 게시물의 개수를 가져오는 메서드
	int totalCount(SearchPagingVO paging);

	//상품 구매여부
	int isBought(Map<String, Object> info);
}
