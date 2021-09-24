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

	private int productNum;
	private String pCategory;
	private String pCompany;
	private String pCountry;
	private String pImage;
	private String pName;
	private int pPrice;
	private String pMethod;
	private int pSendPrice;
	private String pExchangeInfo;
	private String pInfo;
	
}
