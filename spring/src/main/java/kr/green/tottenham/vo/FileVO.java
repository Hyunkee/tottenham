package kr.green.tottenham.vo;

public class FileVO {
	private int num;
	private int board_num;
	private String name;
	private String state;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getName() {
		return name;
	}
	public String getFileName() {
		if(name == null)
			return "";
		int index = name.indexOf("_");
		return name.substring(index+1);
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	@Override
	public String toString() {
		return "FileVO [num=" + num + ", board_num=" + board_num + ", name=" + name + ", state=" + state + "]";
	}	
}
