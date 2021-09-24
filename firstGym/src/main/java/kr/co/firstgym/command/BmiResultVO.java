package kr.co.firstgym.command;


import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BmiResultVO {
	
	private int bmiNum;
	private Timestamp bmiDate;
	private String bmiResult;
	private String userId;
}
