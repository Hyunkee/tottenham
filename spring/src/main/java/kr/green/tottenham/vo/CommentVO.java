package kr.green.tottenham.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommentVO {
	private Integer num;
	private String writer;
	private Integer board_num;
	private String contents;
	private Date registered;
	private String state;

	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Integer getBoard_num() {
		return board_num;
	}
	public void setBoard_num(Integer board_num) {
		this.board_num = board_num;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegistered() {
		if(registered == null) // 예외처리
			return "";
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return f.format(registered);
	}
	public void setRegistered(Date registered) {
		this.registered = registered;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	@Override
	public String toString() {
		return "CommentVO [num=" + num + ", writer=" + writer + ", board_num=" + board_num + ", contents=" + contents
				+ ", registered=" + registered + ", state=" + state + "]";
	}	
}
