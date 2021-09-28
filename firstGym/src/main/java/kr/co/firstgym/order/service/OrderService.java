package kr.co.firstgym.order.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.firstgym.command.OrderProductVO;
import kr.co.firstgym.command.OrdersVO;
import kr.co.firstgym.command.ProductVO;
import kr.co.firstgym.order.mapper.IOrderMapper;
import kr.co.firstgym.util.PageVO;

@Service
public class OrderService implements IOrderService{
	
	@Autowired
	private IOrderMapper mapper;

	@Override
	public List<OrderProductVO> getList(PageVO vo, String userId) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("page", vo);
		map.put("id", userId);
		List<OrderProductVO> list = mapper.getList(map);
		
		/*
		for(OrderProductVO article : list) {
			//현재 시간 읽어오기
			long now = System.currentTimeMillis();
			//각 게시물들의 작성시간 읽어오기 (밀리초)
			long regTime = article.getRegdate().getTime();
			
			//이틀이 지나지 않았는지 비교해서 newMark를 true로 처리
			if(now - regTime < 60 * 60 * 24 * 2 * 1000) {
				article.setNewMark(true);
			}
		}
		*/	
		return list;
		
	}

	@Override
	public int getTotal(PageVO vo, String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("page", vo);
		map.put("id", userId);
		return mapper.getTotal(map);
	}

	@Override
	public OrdersVO getContent(int o_num) {
		return mapper.getContent(o_num);
	}
	
	@Override
	public ProductVO getProduct(int p_num) {
		return mapper.getProduct(p_num);
	}

	@Override
	public void regist(OrdersVO vo) {
		mapper.regist(vo);
		
	}

	@Override
	public void registOP(OrdersVO vo, int seq, int p_num, String name, int price, Timestamp date, String category) {
		Map<String, Object> map = new HashMap<>();
		map.put("vo", vo);
		map.put("seq", seq);
		map.put("p_num", p_num);
		map.put("name", name);
		map.put("price", price);
		map.put("date", date);
		map.put("category", category);
		mapper.registOP(map);
		
	}

	@Override
	public int selectSeq() {
		return mapper.selectSeq();
	}

	@Override
	public String selectName(int p_num) {
		return mapper.selectName(p_num);
	}

	@Override
	public int selectPrice(int seq) {
		return mapper.selectPrice(seq);
	}

	@Override
	public String selectDate(int seq) {
		return mapper.selectDate(seq);
	}

	@Override
	public String selectCategory(int p_num) {
		return mapper.selectCategory(p_num);
	}

}
