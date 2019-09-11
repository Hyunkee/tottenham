package kr.green.tottenham.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardVO {
	private int num;
	private String title;
	private String contents;
	private String writer;
	private String valid;
	private String file;
	private Date registered;
	private Date modify_registered;
	private int views;
	private int comment_count;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
		this.valid = valid;
	}
	public String getFile() {
		return file;
	}
	public String getFileName() {
		if(file == null)
			return "";
		int index = file.indexOf("_");
		if(index == -1)
			return "";
		return file.substring(index+1); // 사용자가 첨부파일명을 봤을 때 uuid 와 같은 복잡한 문자열을 제외시키고 파일명과확장자명 만 추출해서 보여주기 위한 리턴값
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getRegistered() {
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return f.format(registered);
	}
	public String getRegisteredUntilDay() {
		if(registered == null) // 예외처리
			return "";
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		return f.format(registered);
	}
	public void setRegistered(Date registered) {
		this.registered = registered;
	}
	public Date getModify_registered() {
		return modify_registered;
	}
	public void setModify_registered(Date modify_registered) {
		this.modify_registered = modify_registered;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}	
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	
	@Override
	public String toString() {
		return "BoardVO [num=" + num + ", title=" + title + ", contents=" + contents + ", writer=" + writer + ", valid="
				+ valid + ", file=" + file + ", registered=" + registered + ", modify_registered=" + modify_registered
				+ ", views=" + views + ", comment_count=" + comment_count + "]";
	}
}
