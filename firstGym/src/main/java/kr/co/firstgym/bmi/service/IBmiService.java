package kr.co.firstgym.bmi.service;

import java.util.List;

import kr.co.firstgym.command.BmiResultVO;
import kr.co.firstgym.command.SearchPagingVO;
import kr.co.firstgym.util.PageVO;

public interface IBmiService {
	
	//BMI결과내역
		List<BmiResultVO> selectOne(String userId, PageVO paging);
		
		//특정 회원의 BMI 결과가 몇 개인지를 알려주는 메서드 
		int countBMI(String userId);


		//총 결과물의 개수를 가져오는 메서드
		int totCount(SearchPagingVO paging);


}
