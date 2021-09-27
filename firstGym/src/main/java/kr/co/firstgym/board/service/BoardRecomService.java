package kr.co.firstgym.board.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.firstgym.board.mapper.IBoardRecomMapper;

@Service
public class BoardRecomService implements IBoardRecomService {

	@Autowired
	private IBoardRecomMapper mapper;
	
	@Override
	public int recomCheck(int boardNum, String userId) {
		
		Map<String, Object> recomMap = new HashMap<>();
		recomMap.put("boardNum", boardNum);
		recomMap.put("userId", userId);
		return mapper.recomCheck(recomMap);
	}

	@Override
	public void registRecom(int boardNum, String userId) {
		
		Map<String, Object> recomMap = new HashMap<>();
		recomMap.put("boardNum", boardNum);
		recomMap.put("userId", userId);
		mapper.registRecom(recomMap);
	}

	@Override
	public void deleteRecom(int boardNum, String userId) {
		Map<String, Object> recomMap = new HashMap<>();
		recomMap.put("boardNum", boardNum);
		recomMap.put("userId", userId);
		mapper.deleteRecom(recomMap);
		
	}

	@Override
	public int calcTotalRecom(int boardNum) {
		
		return mapper.calcTotalRecom(boardNum);
	}

}
