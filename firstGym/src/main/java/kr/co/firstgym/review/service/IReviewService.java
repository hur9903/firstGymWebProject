package kr.co.firstgym.review.service;

import java.util.List;

import kr.co.firstgym.command.ReviewVO;

public interface IReviewService {

	//리뷰 조회하기
	List<ReviewVO> select(int pNum);

	//리뷰 등록하기
	void regist(ReviewVO vo);


}
