package kr.co.firstgym.order.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.firstgym.command.OrderProductVO;
import kr.co.firstgym.command.OrdersVO;
import kr.co.firstgym.util.PageVO;

public interface IOrderMapper {

	//글 목록
	List<OrderProductVO> getList(Map<String, Object> map);

	//총 게시물 수
	int getTotal(Map<String, Object> map);
		
	//상세보기
	OrdersVO getContent(int o_num);
	
}
