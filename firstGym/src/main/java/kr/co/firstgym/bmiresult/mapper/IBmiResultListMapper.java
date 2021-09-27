package kr.co.firstgym.bmiresult.mapper;

import java.util.List;

import kr.co.firstgym.command.BmiResultVO;

public interface IBmiResultListMapper {

	//BMI 계산 결과를 삽입하는 메서드
	void insertBMI(BmiResultVO vo);
	
	//BMI결과내역
	List<BmiResultVO> getList(String userId);
}
