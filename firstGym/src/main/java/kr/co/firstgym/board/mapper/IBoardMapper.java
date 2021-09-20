package kr.co.firstgym.board.mapper;

import java.util.List;

import kr.co.firstgym.command.BoardVO;

public interface IBoardMapper {
	
	//게시글 등록
	void regist(BoardVO boardInfo);
	
	//게시글 이미지 등록
	void registImage(int boardNum, String fileName);
	
	//게시글 불러오기(게시글 번호)
	BoardVO getArticle(int boardNum);
		
	//특정 사용자의 최신 게시글 번호 가져오기
	int getArticleNo(String userId);
		
	//게시글 리스트 불러오기
	List<BoardVO> getBoard();
			
	//게시글 수정
	
	
}
