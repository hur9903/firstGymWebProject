package kr.co.firstgym.board.service;

public interface IBoardRecomService {
	
	//특정 사용자가 추천 눌렀는지 확인(count)
	int recomCheck(int boardNum, String userId);
	
	//추천 추가
	void registRecom(int boardNum, String userId);
	
	//추천 삭제
	void deleteRecom(int boardNum, String userId);
	
	//특정 보드의 총 추천 수 가져오기
	int calcTotalRecom(int boardNum);
}
