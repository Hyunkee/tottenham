package kr.green.tottenham.vo;

public class PlayersVO {
	private int num;
	private int back_num;
	private String name;
	private int age;
	private String position;
	private String weight;
	private String height;
	private String type;
	private String country;
	private String detail_position;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getBack_num() {
		return back_num;
	}
	public void setBack_num(int back_num) {
		this.back_num = back_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}	
	public String getDetail_position() {
		return detail_position;
	}
	public void setDetail_position(String detail_position) {
		this.detail_position = detail_position;
	}
	
	@Override
	public String toString() {
		return "PlayersVO [num=" + num + ", back_num=" + back_num + ", name=" + name + ", age=" + age + ", position="
				+ position + ", weight=" + weight + ", height=" + height + ", type=" + type + ", country=" + country
				+ ", detail_position=" + detail_position + "]";
	}
	
}
