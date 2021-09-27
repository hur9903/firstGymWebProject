package kr.co.firstgym.user.service;

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
}
