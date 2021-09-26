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
		
		return mapper.getList(listParam);
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
