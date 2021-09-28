package kr.co.firstgym.order.mapper;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.firstgym.command.OrderProductVO;
import kr.co.firstgym.command.OrdersVO;
import kr.co.firstgym.command.ProductVO;
import kr.co.firstgym.util.PageVO;

public interface IOrderMapper {

	//글 목록
	List<OrderProductVO> getList(Map<String, Object> map);

	//총 게시물 수
	int getTotal(Map<String, Object> map);
		
	//상세보기
	OrdersVO getContent(int o_num);
	
	//제품 정보 가져오기
	ProductVO getProduct(int p_num);
	
	//글 등록
	void regist(OrdersVO vo);
	
	//op등록
	void registOP(Map<String, Object> map);
	
	//seq가져오기
	int selectSeq();
	
	String selectName(int p_num);
	
	int selectPrice(int seq);
	
	String selectDate(int seq);
	
	String selectCategory(int p_num);
	
}
