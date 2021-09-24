package kr.co.firstgym.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageCreator {

	private SearchPagingVO paging;
	private int articleTotalCount; //총 게시물의 수
	private int beginPage; // 시작 페이지 번호
	private int endPage; // 끝 페이지 번호
	private boolean prev; //이전 버튼
	private boolean next; //다음 버튼

	//한 화면에 보여질 페이지 버튼 수
	private final int displayPageNum = 5;

	//페이징 알고리즘을 수행할 메서드 선언.
	private void calcDataOfPage() {

		//보정 전 끝 페이지 번호 구하기
		endPage = (int) (Math.ceil(paging.getPage() / (double) displayPageNum) * displayPageNum);

		//시작 페이지 번호 구하기
		beginPage = (endPage - displayPageNum) + 1;

		//이전 버튼 활성 여부
		prev = (beginPage == 1) ? false : true;

		//다음 버튼 활성 여부
		next = articleTotalCount <= (endPage * paging.getCountPerPage()) ? false : true;

		//끝 페이지 보정
		if(!isNext()) {
			endPage = (int) Math.ceil(articleTotalCount / (double) paging.getCountPerPage());
		}

	}
	
	
	public void setArticleTotalCount(int articleTotalCount) {
		this.articleTotalCount = articleTotalCount;
		calcDataOfPage();
	}
	
	
	public int getArticleTotalCount() {
		return articleTotalCount;
	}
	
	
	
	
	


}
