package com.neo4j.view;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.neo4j.model.FriendRelation;
import com.neo4j.model.Person;
import com.neo4j.service.FriendService;
import com.neo4j.service.PersonService;
import com.neo4j.util.DateUtil;
import com.neo4j.util.IDGenerator;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FriendAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private PersonService personService = new PersonService();
    private FriendService friendService = new FriendService();
    private String userId;
    private String followerId;
    private String timestamp;
    private String searchName;
    private Person person;
    private String username;
   
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public int getPersonType() {
		return personType;
	}
	public void setPersonType(int personType) {
		this.personType = personType;
	}

	private int personType = 0; 
    public String getFollowerId() {
		return followerId;
	}
	public void setFollowerId(String followerId) {
		this.followerId = followerId;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	
	public List<Person> getPersons() {
		return persons;
	}
	public void setPersons(List<Person> persons) {
		this.persons = persons;
	}

	private List<Person> persons = new ArrayList<Person>();
    public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public PersonService getPersonService() {
		return personService;
	}
	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}
	public FriendService getFriendService() {
		return friendService;
	}
	public void setFriendService(FriendService friendService) {
		this.friendService = friendService;
	}
	
	public String ObtainOwnFollowers(){
		try{
			person = (Person)ActionContext.getContext().getSession().get("person");
			this.userId = ((Person)ActionContext.getContext().getSession().get("person")).getId();
			this.persons  = this.getFriendService().getFriendRelationDAO().obtainOwnFollowers(userId);
			this.personType = 0;
			return SUCCESS;
		}catch(Exception e){
			return ERROR;
		}
	}
	public String ObtainOwnFans(){
		try{
			person = (Person)ActionContext.getContext().getSession().get("person");
			this.userId = ((Person)ActionContext.getContext().getSession().get("person")).getId();
			this.persons  = this.getFriendService().getFriendRelationDAO().obtainOwnFans(userId);
			this.personType = 1;
			return SUCCESS;
		}catch(Exception e){
			return ERROR;
		}
	}
	public String ObtainPopularUsers(){
		try{
			person = (Person)ActionContext.getContext().getSession().get("person");
			this.persons  = this.getFriendService().getFriendRelationDAO().obtainPopularUser();
			this.personType = 2;
			return SUCCESS;
		}catch(Exception e){
			return ERROR;
		}
	}
	public String createFollow(){
		try{
			person = (Person)ActionContext.getContext().getSession().get("person");
			String id = IDGenerator.genKey(IDGenerator.FOLLOWRELATION);
			Person lp = new Person();
			Person rp = new Person();
			lp = (Person)ActionContext.getContext().getSession().get("person");
			rp.setId(followerId);
			FriendRelation friend = new FriendRelation();
			friend.setId(id);
			friend.setTimestamp(DateUtil.defaultFormat(new Date()));
			friend.setlPerson(lp);
			friend.setrPerson(rp);
			this.getFriendService().getFriendRelationDAO().createFollow(friend);
		    this.ObtainOwnFans();
		    person = this.getPersonService().getPersonDAO().findById(lp.getId());
			ActionContext.getContext().getSession().put("person",person);
			return SUCCESS;
		}catch(Exception e){
			return ERROR;
		}
	}
	public String deleteFollow(){
		try{
			person = (Person)ActionContext.getContext().getSession().get("person");
			this.userId = ((Person)ActionContext.getContext().getSession().get("person")).getId();
			this.getFriendService().getFriendRelationDAO().deleteFollow(userId, followerId);
			person = this.getPersonService().getPersonDAO().findById(this.userId);
			ActionContext.getContext().getSession().put("person",person);
			return SUCCESS;
		}catch(Exception e){
			return ERROR;
		}
	}
	public String SearchByName(){
		try{
			person = (Person)ActionContext.getContext().getSession().get("person");
			this.persons = this.friendService.getPersonDAO().
			                selectPersons("match (p:Person {username:'"+this.searchName+"'}) return p.Id,p.username,p.email,p.portrait,p.password");
			return SUCCESS;
		}catch (Exception e){
			return ERROR;
		}
	}
	public String recommendFriends(){
		try{
			person = (Person)ActionContext.getContext().getSession().get("person");
			 this.personType  =3;
			 this.userId = ((Person)ActionContext.getContext().getSession().get("person")).getId();
			 this.persons = this.getFriendService().getPersonDAO().recommendFriendById(this.userId);
		     return SUCCESS;
		}catch (Exception e){
			return ERROR;
		}
	}
	public String ObtainUserFans(){
		try{
			person = (Person)ActionContext.getContext().getSession().get("person");
			 this.persons = this.getFriendService().getFriendRelationDAO().obtainOwnFans(userId);
		     return SUCCESS;
		}catch (Exception e){
			return ERROR;
		}
	}
	public String ObtainUserFallows(){
		try{
			person = (Person)ActionContext.getContext().getSession().get("person");
			 this.persons = this.getFriendService().getFriendRelationDAO().obtainOwnFollowers(userId);
		     return SUCCESS;
		}catch (Exception e){
			return ERROR;
		}
	}
    
}
