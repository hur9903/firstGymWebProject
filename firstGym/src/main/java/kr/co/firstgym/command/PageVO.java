package kr.co.firstgym.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageVO {

	private int page;
	private int countPerPage;
	
	public PageVO() {
		this.page = 1;
		this.countPerPage = 12;
	}
	
}
