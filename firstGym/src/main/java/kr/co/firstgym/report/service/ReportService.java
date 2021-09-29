package kr.co.firstgym.report.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.firstgym.command.BoardPageVO;
import kr.co.firstgym.command.ReportVO;
import kr.co.firstgym.report.repository.IReportMapper;

@Service
public class ReportService implements IReportService {
	@Autowired
	private IReportMapper mapper;

	@Override
	public void report(ReportVO vo) {
		mapper.report(vo);
	}

	@Override
	public List<ReportVO> reportList(BoardPageVO vo) {
		return mapper.reportList(vo);
	}

	@Override
	public int checkRp(int boardNum, String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("boardNum", boardNum);
		map.put("userId", userId);
		return mapper.checkRp(map);
	}

	@Override
	public ReportVO getReport(int reportNum) {
		return mapper.getReport(reportNum);
	}

	@Override
	public void refuse(int reportNum) {
		mapper.refuse(reportNum);
	}
	
	

}
