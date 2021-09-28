package kr.co.firstgym.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrdersVO {

	private int orderNum;
	private String orderSendId;
	private String orderSendName;
	private String orderPNum;
	private String orderMethod;
	private String orderReceiveName;
	private String orderZipcode;
	private String orderAddress;
	private String orderDetailAddress;
	private String orderMessage;
	private Timestamp orderDate;
	private int orderTotalPrice;
	private String orderEmail;
	
}
