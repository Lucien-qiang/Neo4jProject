package com.neo4j.model;

public class Person {
	private String Id;//id
	private String username;//êÇ³Æ
	private String password;//µÇÂ¼ÃÜÂë
	private String email;//×¢²áÓÊÏä
	private String portrait;//ÓÃ»§Í·Ïñ
	private int fanCount;
	private int followCount;
	private int momentCount;
	public String getId() {
		return Id;
	}
	public int getFanCount() {
		return fanCount;
	}
	public void setFanCount(int fanCount) {
		this.fanCount = fanCount;
	}
	public int getFollowCount() {
		return followCount;
	}
	public void setFollowCount(int followCount) {
		this.followCount = followCount;
	}
	public int getMomentCount() {
		return momentCount;
	}
	public void setMomentCount(int momentCount) {
		this.momentCount = momentCount;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPortrait() {
		return portrait;
	}
	public void setPortrait(String portrait) {
		this.portrait = portrait;
	}
	
	

}
