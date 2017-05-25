package com.neo4j.service;

import com.neo4j.dao.MomentDAO;
import com.neo4j.dao.PersonDAO;

public class MomentService {
	private PersonDAO personDAO = null;
	private MomentDAO momentDAO = null;
	public PersonDAO getPersonDAO() {
		return personDAO;
	}
	public void setPersonDAO(PersonDAO personDAO) {
		this.personDAO = personDAO;
	}
	public MomentDAO getMomentDAO() {
		return momentDAO;
	}
	public void setMomentDAO(MomentDAO momentDAO) {
		this.momentDAO = momentDAO;
	}
	

}
