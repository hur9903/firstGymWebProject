package kr.co.firstgym.board.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.firstgym.command.BoardPageVO;
import kr.co.firstgym.command.BoardVO;

public interface IBoardService {

	//게시글 등록
	void regist(BoardVO boardInfo, List<MultipartFile> images, MultipartFile video);
	
	//게시글 불러오기(게시글 번호)
	BoardVO getArticle(int boardNum);
	
	//게시글 이미지 불러오기
	List<String> getImages(int boardNum);
	
	//특정 사용자의 최신 게시글 번호 가져오기
	int getArticleNo(String userId);
	
	//게시글 리스트 불러오기
	List<BoardVO> getBoard(BoardPageVO page);
	
	//게시글 리스트 글 수 불러오기
	int getTotalArticleNum(BoardPageVO page);
		
	//게시글 수정
}
