package kr.co.firstgym.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchPagingVO {
	
	private String text_box;
	
	public SearchPagingVO() {
		this.text_box = "";
	}

}
