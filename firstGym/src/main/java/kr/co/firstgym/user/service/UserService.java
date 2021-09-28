package kr.co.firstgym.user.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.firstgym.command.UserVO;
import kr.co.firstgym.user.repository.IUserMapper;

@Service
public class UserService implements IUserService {

	@Autowired
	private IUserMapper mapper;
	
	@Override
	public UserVO login(String id, String pw) {
		return mapper.login(id, pw);
	}
	
	@Override
	public int checkId(String account) {
		return mapper.checkId(account);
	}
	
	@Override
	public int checkEmail(String email) {
		return mapper.checkEmail(email);
	}

	@Override
	public void register(UserVO user) {
		mapper.register(user);
	}

	@Override
	public UserVO selectOne(String account) {
		return mapper.selectOne(account);
	}

	@Override
	public void delete(UserVO vo) {
		mapper.delete(vo);
	}
	
	@Override
	public void modify(UserVO vo) {
		mapper.modify(vo);
	}
	
	@Override
	public UserVO findId(String name, String email) {
		return mapper.findId(name, email);
	}

	@Override
	public String findPw(String id, String email) {
		UserVO userInfo = mapper.findPw(id, email);
		if(userInfo == null) {
			return null;
		} else {
			
			String[] alpaPw = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"};
			String[] numPw = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
			String[] etcPw = {"$", "@", "$", "!", "%", "*", "#", "?", "&"};

			//임시 비밀번호 생성
			Random ran = new Random();
			String newPw = "";
			
			for(int i = 0; i < 3; i++) {
				newPw += numPw[ran.nextInt(numPw.length)];
			}
			for(int i = 0; i < 3; i++) {
				newPw += alpaPw[ran.nextInt(alpaPw.length)];
			}
			newPw += etcPw[ran.nextInt(etcPw.length)];
			for(int i = 0; i < 3; i++) {
				newPw += numPw[ran.nextInt(numPw.length)];
			}
			
			//생성된 임시 비밀번호를 인코딩
			
//			
//			userInfo.setUserPw(newPw);
			mapper.modify(userInfo);
			
			return newPw;
		}		
	}
}
