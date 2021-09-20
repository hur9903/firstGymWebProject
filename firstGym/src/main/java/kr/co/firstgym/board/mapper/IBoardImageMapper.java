package kr.co.firstgym.board.mapper;

import java.util.List;

import kr.co.firstgym.command.BoardImageVO;

public interface IBoardImageMapper {

	//이미지 등록
	void regist(BoardImageVO image);
	
	//게시글 이미지 불러오기
	List<String> getImages(int boardNum);
}
