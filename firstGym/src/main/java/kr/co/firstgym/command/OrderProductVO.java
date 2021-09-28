package kr.co.firstgym.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderProductVO {
	private int orderProductNum;
	private int orderNum;
	private String proName;
	private int orderTotalPrice;
	private Timestamp orderDate;
	private String orderCategory;
	private int proNum;
}
