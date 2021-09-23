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
		// TODO Auto-generated method stub
		return 0;
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
	public void delete(String account) {
		// TODO Auto-generated method stub

	}

}
