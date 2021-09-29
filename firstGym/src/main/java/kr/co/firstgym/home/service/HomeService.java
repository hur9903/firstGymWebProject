package kr.co.firstgym.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.firstgym.command.BoardVO;
import kr.co.firstgym.command.ProductVO;
import kr.co.firstgym.home.mapper.IHomeMapper;

@Service
public class HomeService implements IHomeService {

	@Autowired
	private IHomeMapper mapper;
	
	@Override
	public List<BoardVO> getBestList() {
		return mapper.getBestList();
	}

	@Override
	public List<BoardVO> getRecentList() {
		return mapper.getRecentList();
	}

	@Override
	public List<ProductVO> getBestProduct() {
		return mapper.getBestProduct();
	}

}
