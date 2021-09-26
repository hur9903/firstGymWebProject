package kr.co.firstgym.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyVO {

	private int replyNum;
	private String replyContent;
	private Timestamp replyDate;
	private String userId;
	private int boardNum;
	
}
