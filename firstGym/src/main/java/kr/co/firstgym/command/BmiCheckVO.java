package kr.co.firstgym.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BmiCheckVO {
	
	private String gender;
	private int year;
	private int month;
	private int day;
	private int height;
	private int weight;

}
