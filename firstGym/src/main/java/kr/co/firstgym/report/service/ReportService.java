package kr.co.firstgym.report.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.firstgym.command.ReportVO;
import kr.co.firstgym.report.repository.IReportMapper;
import kr.co.firstgym.user.repository.IUserMapper;

@Service
public class ReportService implements IReportService {
	@Autowired
	private IReportMapper mapper;
	
	@Override
	public void report(ReportVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public ReportVO reportList(ReportVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int checkRp(String content) {
		// TODO Auto-generated method stub
		return 0;
	}

}
