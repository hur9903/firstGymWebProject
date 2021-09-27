package kr.co.firstgym.board.mapper;

import java.util.Map;

public interface IBoardRecomMapper {
	//특정 사용자가 추천 눌렀는지 확인(count)
	int recomCheck(Map<String, Object> recomInput);
		
	//추천 추가
	void registRecom(Map<String, Object> recomInput);
		
	//추천 삭제
	void deleteRecom(Map<String, Object> recomInput);
		
	//특정 보드의 총 추천 수 가져오기
	int calcTotalRecom(int boardNum);
}
