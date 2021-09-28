package kr.co.firstgym.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/*
	-- 상품 테이블 생성
pNum number
pCategory varchar2(10)
pCompany varchar2(10)
pCountry varchar2(10)
pImage varchar2(100)
pName varchar2(10)
pPrice number
pMethod varchar2(10)
pSendPrice number
pExchangeInfo varchar2(100)
pInfo varchar2(100)
*/

@Getter
@Setter
@ToString
public class ProductVO {

	private int proNum;
	private String proCategory;
	private String proCompany;
	private String proCountry;
	private String proImage;
	private String proName;
	private int proPrice;
	private String proMethod;
	private int proSendPrice;
	private String proExchangeInfo;
	private String proInfo;

}






