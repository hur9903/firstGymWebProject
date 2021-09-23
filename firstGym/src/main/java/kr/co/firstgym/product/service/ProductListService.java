package kr.co.firstgym.product.service;

import java.util.List;

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
	public ProductVO getContent(int pNum) {
		ProductVO product = mapper.getContent(pNum);
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
	
	
	

}
