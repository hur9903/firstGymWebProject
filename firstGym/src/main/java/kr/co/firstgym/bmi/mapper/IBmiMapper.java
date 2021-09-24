package kr.co.firstgym.bmi.mapper;

import java.util.List;

import kr.co.firstgym.command.BmiResultVO;

public interface IBmiMapper {

	//BMI결과 내역 가져오기
	List<BmiResultVO> getLsit();

}
