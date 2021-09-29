package kr.co.firstgym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.firstgym.board.service.IBoardService;
import kr.co.firstgym.command.BoardPageVO;
import kr.co.firstgym.command.ReportVO;
import kr.co.firstgym.report.service.IReportService;

@Controller
@RequestMapping("/manage")
public class ManageController {

	@Autowired
	private IReportService service;
	
	@Autowired
	private IBoardService boardService;
	
	//매니저 페이지 이동
	@GetMapping("/manager")
	public String manage(BoardPageVO page, Model model) {
		List<ReportVO> reports = service.reportList(page);
		model.addAttribute("reports", reports);
		return "manage/manager";
	}
	
	//신고하기
	@PostMapping("/report")
	public String report(ReportVO report, BoardPageVO page, RedirectAttributes ra) {
		
		if(service.checkRp(report.getBoardNum(), report.getUserId()) == 1) {
			ra.addAttribute("msg", "reportFail");
		} else {
			service.report(report);
			ra.addAttribute("msg", "reportDone");
		}
		
		String redirectUrl = "redirect:/board/boardDetailPage/" + report.getBoardNum() + "?category=" + page.getCategory() +"&condition=" + page.getCondition() + "&keyword=" + page.getKeyword() + "&pageNum=" + page.getPageNum();
		
		System.out.println("conre: " + redirectUrl);
		
		return redirectUrl;
	}
	
	//신고목록으로 이동
	@GetMapping("/reportPage")
	public String reportPage(@RequestParam("reportNum") int reportNum, Model model) {
		model.addAttribute("report", service.getReport(reportNum));
		return "manage/reportContent";
	}
	
	//신고 수락
	@PostMapping("/reportAccept")
	public String reportAccept(@RequestParam("boardNum") int boardNum) {
		boardService.deleteArticle(boardNum);
		return "redirect:/manage/manager";
	}
	
	//신고 거절
	@PostMapping("/reportRefuse")
	public String reportRefuse(@RequestParam("reportNum") int reportNum) {
		service.refuse(reportNum);
		return "redirect:/manage/manager";
	}
}
