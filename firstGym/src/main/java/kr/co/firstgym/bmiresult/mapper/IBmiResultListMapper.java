package kr.co.firstgym.bmiresult.mapper;

import java.util.List;

import kr.co.firstgym.command.BmiResultVO;

public interface IBmiResultListMapper {

	//BMI결과내역
	List<BmiResultVO> getList(String userId);
}
