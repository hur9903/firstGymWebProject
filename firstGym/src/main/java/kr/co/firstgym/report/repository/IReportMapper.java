package kr.co.firstgym.report.repository;

import kr.co.firstgym.command.ReportVO;

public interface IReportMapper {

		//신고하기
		void report(ReportVO vo);
		
		//신고 리스트 가져오기
		ReportVO reportList(ReportVO vo);
		
		//신고 여부 확인
		int checkRp(String content);
}
