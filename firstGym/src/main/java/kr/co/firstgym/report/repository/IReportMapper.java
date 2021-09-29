package kr.co.firstgym.report.repository;

import java.util.List;
import java.util.Map;

import kr.co.firstgym.command.BoardPageVO;
import kr.co.firstgym.command.ReportVO;

public interface IReportMapper {

	//신고하기
	void report(ReportVO vo);
		
	//신고 리스트 가져오기
	List<ReportVO> reportList(BoardPageVO vo);
		
	//신고 여부 확인
	int checkRp(Map<String, Object> map);
	
	//신고 하나 가져오기
	ReportVO getReport(int reportNum);
	
	//신고 거절
	void refuse(int reportNum);
}
