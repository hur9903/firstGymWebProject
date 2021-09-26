package kr.co.firstgym.reply.service;

import java.util.List;

import kr.co.firstgym.command.BoardPageVO;
import kr.co.firstgym.command.ReplyVO;

public interface IReplyService {
	
	//댓글 등록
	void regist(ReplyVO reply);
	
	//댓글 가져오기
	List<ReplyVO> getList(int boardNum, BoardPageVO page);
	
	//댓글 수 가져오기
	int getTotalReplyNum(int boardNum);
	
	//댓글 수정
	void modify(ReplyVO reply);
	
	//댓글 삭제
	void delete(int replyNum);
}
