package com.neo4j.service;

import com.neo4j.dao.PersonMomentRelationDAO;

public class PersonMomentRelationService {
	private PersonMomentRelationDAO personMomentRelationDAO = null;

	public PersonMomentRelationDAO getPersonMomentRelationDAO() {
		return personMomentRelationDAO;
	}

	public void setPersonMomentRelationDAO(
			PersonMomentRelationDAO personMomentRelationDAO) {
		this.personMomentRelationDAO = personMomentRelationDAO;
	}

}
