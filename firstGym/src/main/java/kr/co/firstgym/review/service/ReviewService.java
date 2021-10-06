package kr.co.firstgym.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.firstgym.command.ReplyVO;
import kr.co.firstgym.command.ReviewVO;
import kr.co.firstgym.review.mapper.IReviewMapper;

@Service
public class ReviewService implements IReviewService {

	@Autowired
	private IReviewMapper mapper;
	
	
	@Override
	public List<ReviewVO> select(int pNum) {
		
		List<ReviewVO> reviews = mapper.select(pNum);
		
		for(ReviewVO vo : reviews) {
			if(vo.getUserId() == null) {
				vo.setUserId("(탈퇴한 회원입니다)");
			}
		}
		
		return reviews;
	}
	
	@Override
	public void regist(ReviewVO vo) {
		mapper.regist(vo);
	}

}
