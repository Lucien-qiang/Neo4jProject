package com.neo4j.service;

import com.neo4j.dao.FriendRelationDAO;
import com.neo4j.dao.PersonDAO;

public class FriendService {
	private PersonDAO personDAO = new PersonDAO();
	private FriendRelationDAO friendRelationDAO = new FriendRelationDAO();
	public PersonDAO getPersonDAO() {
		return personDAO;
	}
	public void setPersonDAO(PersonDAO personDAO) {
		this.personDAO = personDAO;
	}
	public FriendRelationDAO getFriendRelationDAO() {
		return friendRelationDAO;
	}
	public void setFriendRelationDAO(FriendRelationDAO friendRelationDAO) {
		this.friendRelationDAO = friendRelationDAO;
	}
	

}
