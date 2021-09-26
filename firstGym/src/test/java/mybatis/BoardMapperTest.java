package mybatis;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.firstgym.board.mapper.IBoardImageMapper;
import kr.co.firstgym.board.mapper.IBoardMapper;
import kr.co.firstgym.command.BoardVO;
import kr.co.firstgym.command.ReplyVO;
import kr.co.firstgym.reply.mapper.IReplyMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTest {

	@Autowired
	private IBoardMapper mapper;
	
	@Autowired
	private IBoardImageMapper imageMapper;
	
	@Autowired
	private IReplyMapper replyMapper;
	
	@Test
	public void registTest() {
		
		BoardVO vo = new BoardVO();
		
		for(int i = 0; i <1000; i++) {
			vo.setUserId("userId");
			vo.setBoardContent("test" + i);
			vo.setBoardTitle("test" + i);
			vo.setBoardCategory("none");
			mapper.regist(vo);
		}
	}
	
	
	@Test
	public void getArticleTest() {
		
		System.out.println(mapper.getArticle(2));
	}
	
	@Test
	public void getImagesTest() {
		
		System.out.println(imageMapper.getImages(28));
	}
	
	@Test
	public void replyRegistTest() {
		
		ReplyVO vo = new ReplyVO();
		vo.setReplyContent("content");
		vo.setBoardNum(1047);
		vo.setUserId("woozu99");
		
		replyMapper.regist(vo);
		
	}
	
//	@Test
//	public void replyGetListTest() {
//		
//		System.out.println(replyMapper.getList(1047));
//	}
	
	@Test
	public void replyModifyTest() {
		
		ReplyVO vo = new ReplyVO();
		
		vo.setReplyContent("수정된 정보임다..");
		vo.setReplyNum(1);
		vo.setUserId("woozu99");
		
		replyMapper.modify(vo);
	}
	
	@Test
	public void replyDeleteTest() {
		
		replyMapper.delete(1);
	}
}
