package com.neo4j.model;

public class PersonMomentRelation {
	private String Id;
	private String type;// POST;LIKE;COMMENT
	private String timestamp;
	private String comments;//评论的具体内容
	private String toPerson;
	private Person person;
	private Moment moment;
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getToPerson() {
		return toPerson;
	}
	public void setToPerson(String toPerson) {
		this.toPerson = toPerson;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	public Moment getMoment() {
		return moment;
	}
	public void setMoment(Moment moment) {
		this.moment = moment;
	}

}
