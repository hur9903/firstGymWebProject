package com.spring.mvc.user;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.mvc.user.model.UserVO;
import com.spring.mvc.user.repository.IUserMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/mvc-config.xml"})
public class UserMapperTest {

	//mapper 계층의 객체 필요
	@Autowired
	private IUserMapper mapper;
	
	//회원가입을 아무 아이디로 진행
	@Test
	public void registTest() {
		UserVO vo = new UserVO();
		vo.setAccount("abc1234");
		vo.setName("홍길동");
		vo.setPassword("aaa1111");
		mapper.register(vo);
		
	}
	//회원가입한 아이디로 중복 확인해서 COUNT(*)를 이용해서 1이 리턴되는지 확인
	@Test
	public void checkIdTest() {
		int result = mapper.checkId("abc1234");
		if(result == 1) {
			System.out.println("아이디가 이미 존재함");
		}else {
			System.out.println("아이디 사용 가능");
		}
	}
	//가입한 회원의 모든 정보를 얻어서 출력
	@Test
	public void selectTest() {
		System.out.println(mapper.selectOne("abc1234"));
	}
	//위에서 가입한 계정의 탈퇴를 진행
	//탈퇴 성공 여부도 체크
	@Test
	public void deleteTest() {
		mapper.delete("abc1234");
		if(mapper.selectOne("abc1234") == null) {
			System.out.println("회원 탈퇴 완료");
		}else {
			System.out.println("회원 탈퇴 실패");
		}
	}
}




