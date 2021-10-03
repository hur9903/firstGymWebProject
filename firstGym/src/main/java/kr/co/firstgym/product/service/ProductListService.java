package kr.co.firstgym.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.firstgym.command.ProductVO;
import kr.co.firstgym.command.SearchPagingVO;
import kr.co.firstgym.product.mapper.IProductMapper;

@Service
public class ProductListService implements IProductListService {

	@Autowired
	private IProductMapper mapper;
	
	//상품조회
	@Override
	public ProductVO getContent(int proNum) {
		ProductVO product = mapper.getContent(proNum);
		return product;
	}

	@Override
	public List<ProductVO> getList(SearchPagingVO searchPaging) {
		List<ProductVO> product = mapper.getList(searchPaging);
		
		for(ProductVO vo : product) {
			System.out.println("service: " + vo);
		}
		return product;
	}
	
	@Override
	public int totalCount(SearchPagingVO paging) {
		return mapper.totalCount(paging);
	}

	@Override
	public String isBought(int proNum, String userId) {
		
		Map<String, Object> info = new HashMap<>();
		info.put("proNum", proNum);
		info.put("userId", userId);
		int result = mapper.isBought(info);
		
		if(result == 0) {
			return "notBought";
		} else {
			return "bought";
		}
	}
	
	
	

}
