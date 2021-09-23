package firstGym.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.firstgym.command.UserVO;
import kr.co.firstgym.user.repository.IUserMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class userTest {

	@Autowired
	IUserMapper mapper;
	
	@Test
	public void userRegistTest() {
		UserVO vo = new UserVO();
		vo.setUserId("useID");
		vo.setUserPw("userPW");
		vo.setUserName("userName");
		vo.setUserBirth("userBirth");
		vo.setUserGen("userGen");
		vo.setUserEmail("email");
		vo.setUserPhone("phone");
		vo.setUserMail("mail");
		vo.setUserAddr1("addr1");
		vo.setUserAddr2("useraddr2");
		
		mapper.register(vo);
	}
}
