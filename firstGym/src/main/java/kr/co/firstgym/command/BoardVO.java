package kr.co.firstgym.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
	
	private int boardNum; //게시글 번호
	private String userId; //게시글 작성자
	private String boardContent; //게시글 내용
	private String boardTitle; //게시글 제목
	private String boardCategory; //게시글 카테고리
	private int boardView; //게시글 조회수
	private int boardRecom; //게시글 추천 수
	private Timestamp boardDate; //게시글 등록일
	private String boardThum; //게시글 썸네일 이미지 주소
	private String boardVideo; //게시글 비디오 주소
	private int replyCnt; //게시글 댓글 수
	
	private boolean imageDelCheck; //게시글 수정시 이미지 삭제 여부
	
}
