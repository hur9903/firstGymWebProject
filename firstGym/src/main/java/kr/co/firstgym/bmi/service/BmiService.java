package kr.co.firstgym.bmi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.firstgym.bmi.mapper.IBmiMapper;
import kr.co.firstgym.command.BmiResultVO;
import kr.co.firstgym.command.SearchPagingVO;
import kr.co.firstgym.util.PageVO;

@Service
public class BmiService implements IBmiService {
	
	@Autowired
	private IBmiMapper mapper;

	@Override
	public List<BmiResultVO> selectOne(String userId, PageVO paging) {
		System.out.println("service: " + userId);
		Map<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("userId", userId);
		
		return mapper.selectOne(map);
	}
	
	@Override
	public int countBMI(String userId) {
		return mapper.countBMI(userId);
	}

	@Override
	public int totCount(SearchPagingVO paging) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	
}
