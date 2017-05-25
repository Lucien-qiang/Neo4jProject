package com.neo4j.view;
import java.util.List;

import com.neo4j.model.Person;
import com.neo4j.service.PersonService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private PersonService personService = new PersonService();
	private String username;
	private String password;
	private String state = "0";
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
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
	private boolean IsSuccess = false;

	public boolean isIsSuccess() {
		return IsSuccess;
	}
	public void setIsSuccess(boolean isSuccess) {
		IsSuccess = isSuccess;
	}
	public PersonService getPersonService() {
		return personService;
	}
	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}
	public String Login() throws Exception{
		try{
			List<Person> list = this.getPersonService().getPersonDAO()
			           .selectPersons("match(p:Person{email:'"+username+"',password:'"+password+"'}) return p.username,p.email,p.password,p.portrait,p.Id");
			if (list.size()==1){
				ActionContext.getContext().getSession().put("person",list.get(0));
		    return SUCCESS;
		}
			else {
				this.state = "1";
				return ERROR;
			}
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return ERROR;
		}
	}
	public String Logout(){
		try{
			ActionContext.getContext().getSession().clear();
			return SUCCESS;
			
		}catch(Exception e) {
			return ERROR;
		}
	}

}
