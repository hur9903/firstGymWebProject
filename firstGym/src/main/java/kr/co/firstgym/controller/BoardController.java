package kr.co.firstgym.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.firstgym.board.service.IBoardRecomService;
import kr.co.firstgym.board.service.IBoardService;
import kr.co.firstgym.command.BoardPageVO;
import kr.co.firstgym.command.BoardVO;
import kr.co.firstgym.command.UserVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private IBoardService service;
	
	@Autowired
	private IBoardRecomService recomService;
	
	//게시글 목록으로 이동
	@GetMapping("/boardListPage")
	public String boardListPage(Model model, BoardPageVO page, HttpSession session){
		
		List<BoardVO> board = service.getBoard(page);
		page.setTotalArticleCount(service.getTotalArticleNum(page));
		
		model.addAttribute("board", board);
		model.addAttribute("page", page);
		
		return "/board/boardList";
	}
	
	//게시글 상세보기로 이동
	@GetMapping("/boardDetailPage/{boardNum}")
	public String boardDetailPage(@PathVariable("boardNum") int boardNum, BoardPageVO page, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		BoardVO article = service.getArticle(boardNum);
		article.setBoardRecom(recomService.calcTotalRecom(boardNum));
		List<String> images = service.getImages(boardNum);
		
		Cookie[] cookies = request.getCookies();
		boolean hasViewed = false;
		
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("articleView" + boardNum)) { //조회 쿠키 이름: articleView0000(게시글 번호)
					hasViewed = true;
				}
			}
		}
		
		if(! hasViewed) {
			Cookie newCookie = new Cookie("articleView" + boardNum, "articleView" + boardNum);
			newCookie.setMaxAge(60*60); //쿠키 지속 시간 1시간
			response.addCookie(newCookie);
			service.updateViewNum(article);
		}
		
		model.addAttribute("article", article);
		model.addAttribute("images", images);
		model.addAttribute("page", page);
		
		return "/board/boardContent";
	}
	
	//게시글 등록 페이지로 이동
	@GetMapping("/boardUpdatePage")
	public String boardUpdatePage(BoardPageVO page, Model model) {
		if(!page.getCondition().equals("myBoard")) {
			page.setKeyword("");
			page.setCondition("title");
		}
		if(!page.getCategory().equals("info")) {
			page.setCategory("none");
		}
		model.addAttribute("page", page);
		return "/board/boardModify";
	}
	
	//게시글 수정 페이지로 이동
	@GetMapping("/boardModifyPage")
	public String boardModifyPage(@RequestParam("boardNum") int boardNum, BoardPageVO page, Model model) {
		if(!page.getCondition().equals("myBoard")) {
			page.setKeyword("");
			page.setCondition("title");
		}
		if(!page.getCategory().equals("info")) {
			page.setCategory("none");
		}
		model.addAttribute("page", page);
		model.addAttribute("article", service.getArticle(boardNum));
		model.addAttribute("msg", "boardModify");
			
		return "/board/boardModify";
	}
	
	//게시글 등록
	@PostMapping("/boardUpdate")
	public String boardUpdate(BoardVO article, BoardPageVO page, @RequestParam("images") List<MultipartFile> images, @RequestParam("video") MultipartFile video, HttpSession session) {
		
		UserVO user = (UserVO)session.getAttribute("login");
		String userId = user.getUserId();
		
		article.setUserId(userId);
		
		service.regist(article, images, video); //게시글 등록
		int bno = service.getArticleNo(userId); //게시글 번호 반환
		
		return "redirect:/board/boardDetailPage/" + bno  + "?category=" + page.getCategory() +"&condition=" + page.getCondition() + "&keyword=" + page.getKeyword() + "&pageNum=1";
	}
	
	//게시글 수정
	@PostMapping("/boardModify")
	public String boardModify(BoardVO article, BoardPageVO page, @RequestParam("images") List<MultipartFile> images, @RequestParam("video") MultipartFile video, @RequestParam(value="imageDelCheck", defaultValue="false") boolean imageDelCheck) {
		
		System.out.println("controller-imdel: "+imageDelCheck);
		service.updateArticle(article, images, video, imageDelCheck);
		
		return "redirect:/board/boardDetailPage/" + article.getBoardNum() + "?category=" + page.getCategory() +"&condition=" + page.getCondition() + "&keyword=" + page.getKeyword() + "&pageNum=1";
	}
	
	//게시글 삭제
	@PostMapping("/boardDelete")
	public String boardDelete(@RequestParam("boardNum") int boardNum, BoardPageVO page, RedirectAttributes ra) {
		service.deleteArticle(boardNum);
		
		if(!page.getCondition().equals("myBoard")) {
			page.setKeyword("");
			page.setCondition("title");
		}
		if(!page.getCategory().equals("info")) {
			page.setCategory("none");
		}
		
		ra.addFlashAttribute("msg", "deleteSuccess");
		
		return "redirect:/board/boardListPage"  + "?category=" + page.getCategory() +"&condition=" + page.getCondition() + "&keyword=" + page.getKeyword() + "&pageNum=1";
	}
	
	//좋아요 처리(비동기)
	@ResponseBody
	@GetMapping("/boardLike/{boardNum}/{userId}")
	public Map<String, Object> boardLike(@PathVariable("boardNum") int boardNum, @PathVariable("userId") String userId) {
		
		int isRecom = 0;
		if(recomService.recomCheck(boardNum, userId) == 0) {
			recomService.registRecom(boardNum, userId);
			isRecom = 1;
		} else {
			recomService.deleteRecom(boardNum, userId);
			isRecom = 0;
		}
		Map<String, Object> recomInfo = new HashMap<>();
		recomInfo.put("recomNum", recomService.calcTotalRecom(boardNum));
		recomInfo.put("isRecom", isRecom);
		return recomInfo;
	}
	
	//좋아요 여부 검사(비동기)
	@ResponseBody
	@GetMapping("/boardLikeCheck/{boardNum}/{userId}")
	public int boardLikeCheck(@PathVariable("boardNum") int boardNum, @PathVariable("userId") String userId) {
		
		return recomService.recomCheck(boardNum, userId);
	}
	
}
