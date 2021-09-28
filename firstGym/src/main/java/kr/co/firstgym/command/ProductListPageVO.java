package kr.co.firstgym.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductListPageVO {

	private int page;
	private int countPerPage;
	
	public ProductListPageVO() {
		this.page = 1;
		this.countPerPage = 12;
	}
	
}
