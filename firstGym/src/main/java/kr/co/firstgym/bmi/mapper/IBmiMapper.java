package kr.co.firstgym.bmi.mapper;

import java.util.List;
import java.util.Map;

import kr.co.firstgym.command.BmiResultVO;
import kr.co.firstgym.command.SearchPagingVO;

public interface IBmiMapper {

	//BMI 계산 결과를 삽입하는 메서드
	void insertBMI(BmiResultVO vo);
	
	//BMI결과내역
	List<BmiResultVO> selectOne(Map<String, Object> map);

	//특정 회원의 BMI 결과가 몇 개인지를 알려주는 메서드 
	int countBMI(String userId);

	//총 결과물의 개수를 가져오는 메서드
	int totCount(SearchPagingVO paging);
//	
//	//BMI결과내역
//	List<BmiResultVO> getList(String userId);

}
