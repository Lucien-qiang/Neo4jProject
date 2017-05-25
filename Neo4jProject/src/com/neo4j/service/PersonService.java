package com.neo4j.service;

import com.neo4j.dao.MomentDAO;
import com.neo4j.dao.PersonDAO;
import com.neo4j.dao.PersonMomentRelationDAO;
import com.neo4j.model.Person;

public class PersonService {
	private PersonDAO personDAO = new PersonDAO();
	private MomentDAO momentDAO = new MomentDAO();
	private PersonMomentRelationDAO personmomentRelationDAO = new PersonMomentRelationDAO();
	public PersonMomentRelationDAO getPersonmomentRelationDAO() {
		return personmomentRelationDAO;
	}

	public void setPersonmomentRelationDAO(
			PersonMomentRelationDAO personmomentRelationDAO) {
		this.personmomentRelationDAO = personmomentRelationDAO;
	}

	public MomentDAO getMomentDAO() {
		return momentDAO;
	}

	public void setMomentDAO(MomentDAO momentDAO) {
		this.momentDAO = momentDAO;
	}

	public PersonDAO getPersonDAO() {
		return personDAO;
	}

	public void setPersonDAO(PersonDAO personDAO) {
		this.personDAO = personDAO;
	}
	public void insertPerson(Person person) throws Exception{
		this.getPersonDAO().insertPerson(person);
	}
	
}
