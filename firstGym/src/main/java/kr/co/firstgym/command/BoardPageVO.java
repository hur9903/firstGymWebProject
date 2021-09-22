package kr.co.firstgym.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardPageVO {
	int pageNum;
	int countPerPage;

	String keyword; // 검색 키워드
	String category;// 검색 카테고리
	String condition; // 검색 상태
	
	private int totalArticleCount;//총 게시글 수
	private int beginPageNum; //시작 버튼
	private int endPageNum; //마지막 버튼
	private boolean prev; //이전 버튼
	private boolean next; //이후 버튼

	private final int maxButtonNum = 10;
	
	public BoardPageVO() { //model로 값이 들어가지 않아도 1페이지부터 검색될 수 있도록 설정
		this.category = "none";
		this.pageNum = 1;
		this.countPerPage = 10;
	}
	
	public void setTotalArticleCount(int totalArticleCount) {
		this.totalArticleCount = totalArticleCount;
		updatePageInfo();
	}
	
	private void updatePageInfo() {
		
		this.endPageNum = (int) (Math.ceil(this.pageNum / (double) this.maxButtonNum) * this.maxButtonNum); //마지막 버튼
		this.beginPageNum = (this.endPageNum - this.maxButtonNum) + 1; //시작버튼
		
		if(this.beginPageNum == 1) {
			this.prev = false;
		} else {
			this.prev = true;
		}
		
		if(this.totalArticleCount <= (this.endPageNum * this.countPerPage)) {
			this.next = false;
		} else {
			this.next = true;
		}
		
		if(!this.next) { //마지막 버튼 재설정
			this.endPageNum = (int) Math.ceil(this.totalArticleCount / (double)this.countPerPage); 
		}
	}
}
