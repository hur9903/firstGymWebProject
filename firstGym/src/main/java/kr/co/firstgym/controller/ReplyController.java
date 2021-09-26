package kr.co.firstgym.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.firstgym.command.BoardPageVO;
import kr.co.firstgym.command.ReplyVO;
import kr.co.firstgym.reply.service.IReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private IReplyService service;
	
	//댓글 등록
	@PostMapping("/replyUpdate")
	public String replyUpdate(@RequestBody ReplyVO reply) {
		
		service.regist(reply);
		return "registSuccess";
	
	}
	
	//댓글 수정
	@PostMapping("/replyModify")
	public String replyModify(@RequestBody ReplyVO reply) {
		
		service.modify(reply);
		return "modifySuccess";
	}
	
	//댓글 삭제
	@PostMapping("/replyDelete/{replyNum}")
	public String replyDelete(@PathVariable int replyNum) {
		
		service.delete(replyNum);
		return "deleteSuccess";
	}
	
	//댓글 목록 가져오기
	@GetMapping("/replyList/{boardNum}/{pageNum}")
	public Map<String, Object> replyList(@PathVariable("boardNum") int boardNum, @PathVariable("pageNum") int pageNum){
		
		BoardPageVO page = new BoardPageVO();
		page.setPageNum(pageNum);
		page.setCountPerPage(20); //한번에 띄울 댓글 수 설정
		
		List<ReplyVO> replyList = service.getList(boardNum, page);
		page.setTotalArticleCount(service.getTotalReplyNum(boardNum));
		
		Map<String, Object> replyInfo = new HashMap<String, Object>();
		replyInfo.put("replyList", replyList);
		replyInfo.put("page", page);
		
		return replyInfo;
	}
	
}
