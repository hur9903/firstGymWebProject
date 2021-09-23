package kr.co.firstgym.order.service;

import java.util.List;

import kr.co.firstgym.command.OrderProductVO;
import kr.co.firstgym.command.OrdersVO;
import kr.co.firstgym.util.PageVO;

public interface IOrderService {
	
	//글 목록
	List<OrderProductVO> getList(PageVO vo, String userId);

	//총 게시물 수
	int getTotal(PageVO vo, String userId);
	
	//상세보기
	OrdersVO getContent(int o_num);
	
}
