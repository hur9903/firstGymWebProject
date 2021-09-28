package kr.co.firstgym.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderProductVO {
	private int o_productNum;
	private int o_num;
	private String p_name;
	private int o_totalPrice;
	private Timestamp o_date;
	private String p_category;
	private int p_num;
}
