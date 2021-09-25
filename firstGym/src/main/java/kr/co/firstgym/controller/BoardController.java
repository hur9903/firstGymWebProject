package kr.co.firstgym.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.firstgym.board.service.BoardService;
import kr.co.firstgym.board.service.IBoardService;
import kr.co.firstgym.command.BoardPageVO;
import kr.co.firstgym.command.BoardVO;
import kr.co.firstgym.command.UserVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private IBoardService service;
	
	//게시글 목록으로 이동
	@GetMapping("/boardListPage")
	public String boardListPage(Model model, BoardPageVO page){
		
		List<BoardVO> board = service.getBoard(page);
		page.setTotalArticleCount(service.getTotalArticleNum(page));
		
		model.addAttribute("board", board);
		model.addAttribute("page", page);
		
		return "/board/boardList";
	}
	
	//게시글 상세보기로 이동
	@GetMapping("/boardDetailPage/{boardNum}")
	public String boardDetailPage(@PathVariable("boardNum") int boardNum, Model model) {
		
		BoardVO article = service.getArticle(boardNum);
		List<String> images = service.getImages(boardNum);
		
		model.addAttribute("article", article);
		model.addAttribute("images", images);
		
		return "/board/boardContent";
	}
	
	//게시글 등록 페이지로 이동
	@GetMapping("/boardUpdatePage")
	public String boardUpdatePage() {
		return "/board/boardModify";
	}
	
	//게시글 수정 페이지로 이동
	@GetMapping("/boardModifyPage")
	public String boardModifyPage(@RequestParam("boardNum") int boardNum, Model model) {
			
		model.addAttribute("article", service.getArticle(boardNum));
		model.addAttribute("msg", "boardModify");
			
		return "/board/boardModify";
	}
	
	//게시글 등록
	@PostMapping("/boardUpdate")
	public String boardUpdate(BoardVO article, @RequestParam("images") List<MultipartFile> images, @RequestParam("video") MultipartFile video, HttpSession session) {
		
		UserVO user = (UserVO)session.getAttribute("login");
		String userId = user.getUserId();
		
		article.setUserId(userId);
		
		service.regist(article, images, video); //게시글 등록
		int bno = service.getArticleNo(userId); //게시글 번호 반환
		
		return "redirect:/board/boardDetailPage/" + bno;
	}
	
	//게시글 수정
	@PostMapping("/boardModify")
	public String boardModify(BoardVO article, @RequestParam("images") List<MultipartFile> images, @RequestParam("video") MultipartFile video, @RequestParam(value="imageDelCheck", defaultValue="false") boolean imageDelCheck) {
		
		System.out.println("controller-imdel: "+imageDelCheck);
		service.updateArticle(article, images, video, imageDelCheck);
		
		return "redirect:/board/boardDetailPage/" + article.getBoardNum();
	}
	
	//게시글 삭제
	@PostMapping("/boardDelete")
	public String boardDelete(@RequestParam("boardNum") int boardNum, RedirectAttributes ra) {
		service.deleteArticle(boardNum);
		
		ra.addFlashAttribute("msg", "deleteSuccess");
		return "redirect:/board/boardListPage";
	}
	
	//좋아요 처리(비동기)
	@PostMapping("/boardLike")
	public String boardLike() {
		return "";
	}
	
}
