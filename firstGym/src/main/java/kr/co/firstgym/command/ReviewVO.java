package kr.co.firstgym.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVO {
	
	private int reviewNum;
	private String reviewContent;
	private int reviewSatisfaction;
	private Timestamp reviewRegdate;
	private int proNum;
	private String userId;

}
