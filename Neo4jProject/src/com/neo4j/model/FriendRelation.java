package com.neo4j.model;

public class FriendRelation {
	private String Id;
	private String timestamp;
	private Person lPerson;
	private Person rPerson;
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	public Person getlPerson() {
		return lPerson;
	}
	public void setlPerson(Person lPerson) {
		this.lPerson = lPerson;
	}
	public Person getrPerson() {
		return rPerson;
	}
	public void setrPerson(Person rPerson) {
		this.rPerson = rPerson;
	}
	
	

}
