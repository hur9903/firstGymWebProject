package kr.co.firstgym.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductVO {
	private int p_num;
	private String p_category;
	private String p_company;
	private String p_country;
	private String p_image;
	private String p_name;
	private int p_price;
	private String p_method;
	private int p_sendPrice;
	private String p_exchangeInfo;
	private String p_info;
}
