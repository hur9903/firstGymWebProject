package kr.co.firstgym.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrdersVO {

	private int o_num;
	private String o_sendId;
	private String o_sendName;
	private String o_pNum;
	private String o_method;
	private String o_receiveName;
	private String o_zipcode;
	private String o_address;
	private String o_detailAddress;
	private String o_message;
	private Timestamp o_date;
	private int o_totalPrice;
	private String o_email;
	
}
