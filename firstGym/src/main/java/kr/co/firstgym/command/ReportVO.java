package kr.co.firstgym.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReportVO {

	private int rpNum;
	private String userId;
	private String rpContent;
	private Timestamp rpDate;
	private String reason;

}
