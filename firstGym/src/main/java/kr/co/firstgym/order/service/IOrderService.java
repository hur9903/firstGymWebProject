package kr.co.firstgym.order.service;

import java.sql.Timestamp;
import java.util.List;

import kr.co.firstgym.command.OrderProductVO;
import kr.co.firstgym.command.OrdersVO;
import kr.co.firstgym.command.ProductVO;
import kr.co.firstgym.util.PageVO;

public interface IOrderService {
	
	//글 목록
	List<OrderProductVO> getList(PageVO vo, String userId);

	//총 게시물 수
	int getTotal(PageVO vo, String userId);
	
	//상세보기
	OrdersVO getContent(int o_num);

	//제품 정보 가져오기
	ProductVO getProduct(int p_num);
	
	//등록
	void regist(OrdersVO vo);
	
	//OP등록
	void registOP(OrdersVO vo, int seq, int p_num, String name, int price, Timestamp date, String category);
	
	//seq 가져오기
	int selectSeq();
	
	String selectName(int p_num);
	
	int selectPrice(int seq);
	
	String selectDate(int seq);
	
	String selectCategory(int p_num);
	
}
