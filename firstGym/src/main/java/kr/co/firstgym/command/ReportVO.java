package kr.co.firstgym.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReportVO {

	private int reportNum;
	private String reportContent;
	private Timestamp reportDate;
	private char reportYN;
	private int boardNum;
	private String userId;

}
