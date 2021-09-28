package kr.co.firstgym.user.service;

import kr.co.firstgym.command.UserVO;

public interface IUserService {

		//로그인
		UserVO login(String id, String pw);
	
		//암호화
		String security(UserVO vo);
		
		//아이디 중복 체크 기능
		int checkId(String account);
		
		//이메일 중복 체크 기능
		int checkEmail(String email);
		
		//회원 가입 기능
		void register(UserVO user);
		
		//회원 정보 조회 기능
		UserVO selectOne(String account);
		
		//회원 탈퇴
		void delete(UserVO vo);
		
		//회원정보 수정 
		void modify (UserVO vo);

		//아이디 찾기
		UserVO findId(String name, String email);

	
	
}
