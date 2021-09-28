package kr.co.firstgym.order.mapper;

import java.util.List;
import java.util.Map;

import kr.co.firstgym.command.OrderProductVO;
import kr.co.firstgym.command.OrdersVO;
import kr.co.firstgym.command.ProductVO;

public interface IOrderMapper {

	//글 목록
	List<OrderProductVO> getList(Map<String, Object> map);

	//총 게시물 수
	int getTotal(Map<String, Object> map);
		
	//상세보기
	OrdersVO getContent(int orderNum);
	
	//제품 정보 가져오기
	ProductVO getProduct(int proNum);
	
	//글 등록
	void regist(OrdersVO vo);
	
	//op등록
	void registOP(Map<String, Object> map);
	
	//seq가져오기
	int selectSeq();
	
	String selectName(int proNum);
	
	int selectPrice(int seq);
	
	String selectDate(int seq);
	
	String selectCategory(int proNum);
	
}
