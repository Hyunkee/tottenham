package kr.green.tottenham.vo;

public class StatsVO {
	private int num;
	private int player_num;
	private int minutes_played;
	private int goal_scored;
	private int assists;
	private int clearances;
	private int interceptions;
	private int tackles;
	private int passes;
	private int completed_passes;
	private String position;
	private String season;
	private int g_cleanseet;
	private int g_save;
	private int g_pkclean;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPlayer_num() {
		return player_num;
	}
	public void setPlayer_num(int player_num) {
		this.player_num = player_num;
	}
	public int getMinutes_played() {
		return minutes_played;
	}
	public void setMinutes_played(int minutes_played) {
		this.minutes_played = minutes_played;
	}
	public int getGoal_scored() {
		return goal_scored;
	}
	public void setGoal_scored(int goal_scored) {
		this.goal_scored = goal_scored;
	}
	public int getAssists() {
		return assists;
	}
	public void setAssists(int assists) {
		this.assists = assists;
	}
	public int getClearances() {
		return clearances;
	}
	public void setClearances(int clearances) {
		this.clearances = clearances;
	}
	public int getInterceptions() {
		return interceptions;
	}
	public void setInterceptions(int interceptions) {
		this.interceptions = interceptions;
	}
	public int getTackles() {
		return tackles;
	}
	public void setTackles(int tackles) {
		this.tackles = tackles;
	}
	public int getPasses() {
		return passes;
	}
	public void setPasses(int passes) {
		this.passes = passes;
	}
	public int getCompleted_passes() {
		return completed_passes;
	}
	public void setCompleted_passes(int completed_passes) {
		this.completed_passes = completed_passes;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public int getG_cleanseet() {
		return g_cleanseet;
	}
	public void setG_cleanseet(int g_cleanseet) {
		this.g_cleanseet = g_cleanseet;
	}
	public int getG_save() {
		return g_save;
	}
	public void setG_save(int g_save) {
		this.g_save = g_save;
	}
	public int getG_pkclean() {
		return g_pkclean;
	}
	public void setG_pkclean(int g_pkclean) {
		this.g_pkclean = g_pkclean;
	}
	
	@Override
	public String toString() {
		return "StatsVO [num=" + num + ", player_num=" + player_num + ", minutes_played=" + minutes_played
				+ ", goal_scored=" + goal_scored + ", assists=" + assists + ", clearances=" + clearances
				+ ", interceptions=" + interceptions + ", tackles=" + tackles + ", passes=" + passes
				+ ", completed_passes=" + completed_passes + ", position=" + position + ", season=" + season
				+ ", g_cleanseet=" + g_cleanseet + ", g_save=" + g_save + ", g_pkclean=" + g_pkclean + "]";
	}	
	
}
