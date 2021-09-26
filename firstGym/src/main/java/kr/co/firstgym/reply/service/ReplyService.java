package kr.co.firstgym.reply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import kr.co.firstgym.command.BoardPageVO;
import kr.co.firstgym.command.ReplyVO;
import kr.co.firstgym.reply.mapper.IReplyMapper;

@Service
public class ReplyService implements IReplyService {

	@Autowired
	IReplyMapper mapper;
	
	@Override
	public void regist(ReplyVO reply) {
		mapper.regist(reply);
	}
	
	@Override
	public List<ReplyVO> getList(int boardNum, BoardPageVO page) {
		Map<String, Object> listParam = new HashMap<String, Object>();
		listParam.put("boardNum", boardNum);
		listParam.put("page", page);
		
		//탈퇴한 사용자 댓글 검사
		List<ReplyVO> returnList = mapper.getList(listParam);
		
		for(ReplyVO vo : returnList) {
			if(vo.getUserId() == null) {
				vo.setUserId("(탈퇴한 회원입니다)");
			}
		}
		
		for(ReplyVO vo : returnList) {
			System.out.println(vo.getUserId());
		}
		
		return returnList;
	}
	
	@Override
	public int getTotalReplyNum(int boardNum) {
		return mapper.getTotalReplyNum(boardNum);
	}
	
	@Override
	public void modify(ReplyVO reply) {
		mapper.modify(reply);
	}
	
	@Override
	public void delete(int replyNum) {
		mapper.delete(replyNum);
	}
	
}
