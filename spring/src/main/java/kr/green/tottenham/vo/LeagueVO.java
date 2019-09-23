package kr.green.tottenham.vo;

public class LeagueVO {
	private int num;
	private String team_name;
	private int game_num;
	private int score;
	private int win;
	private int draw;
	private int lose;
	private int point;
	private int lose_point;
	private int diff_point;
	private String season_league;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public int getGame_num() {
		return game_num;
	}
	public void setGame_num(int game_num) {
		this.game_num = game_num;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getWin() {
		return win;
	}
	public void setWin(int win) {
		this.win = win;
	}
	public int getDraw() {
		return draw;
	}
	public void setDraw(int draw) {
		this.draw = draw;
	}
	public int getLose() {
		return lose;
	}
	public void setLose(int lose) {
		this.lose = lose;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getLose_point() {
		return lose_point;
	}
	public void setLose_point(int lose_point) {
		this.lose_point = lose_point;
	}
	public int getDiff_point() {
		return diff_point;
	}
	public void setDiff_point(int diff_point) {
		this.diff_point = diff_point;
	}
	public String getSeason_league() {
		return season_league;
	}
	public void setSeason_league(String season_league) {
		this.season_league = season_league;
	}
	
	@Override
	public String toString() {
		return "LeagueVO [num=" + num + ", team_name=" + team_name + ", game_num=" + game_num + ", score=" + score
				+ ", win=" + win + ", draw=" + draw + ", lose=" + lose + ", point=" + point + ", lose_point="
				+ lose_point + ", diff_point=" + diff_point + ", season_league=" + season_league + "]";
	}
	
	
}
