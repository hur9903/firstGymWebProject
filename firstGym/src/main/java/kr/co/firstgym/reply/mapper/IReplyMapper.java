package kr.co.firstgym.reply.mapper;

import java.util.List;
import java.util.Map;

import kr.co.firstgym.command.ReplyVO;

public interface IReplyMapper {

	//댓글 등록
	void regist(ReplyVO reply);
		
	//댓글 가져오기
	List<ReplyVO> getList(Map<String, Object> listParam);
	
	//댓글 수 가져오기
	int getTotalReplyNum(int boardNum);
	
	//댓글 수정
	void modify(ReplyVO reply);
		
	//댓글 삭제
	void delete(int replyNum);
}
