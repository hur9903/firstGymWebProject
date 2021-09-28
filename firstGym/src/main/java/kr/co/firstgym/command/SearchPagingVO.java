package kr.co.firstgym.command;

import kr.co.firstgym.util.PageVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchPagingVO extends PageVO {
	
	private String text_box;
	private String category;
	
	public SearchPagingVO() {
		this.text_box = "";
		this.category = "";
	}

}
