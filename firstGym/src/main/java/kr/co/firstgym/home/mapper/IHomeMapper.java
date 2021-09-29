package kr.co.firstgym.home.mapper;

import java.util.List;

import kr.co.firstgym.command.BoardVO;
import kr.co.firstgym.command.ProductVO;

public interface IHomeMapper {

	//인기글 가져오기
		List<BoardVO> getBestList();
		
	//최신글 가져오기
	List<BoardVO> getRecentList();
		
	//인기기구 가져오기
	List<ProductVO> getBestProduct();
	
}
