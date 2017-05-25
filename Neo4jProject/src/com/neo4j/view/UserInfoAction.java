package com.neo4j.view;

import com.neo4j.model.Person;
import com.neo4j.service.PersonService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserInfoAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private PersonService personService = null;
	private Person person = null;
	private String oldPassword = null;
	private String newPassword = null;
	
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	public PersonService getPersonService() {
		return personService;
	}
	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}
	
	public String ObtainUserInfo(){
		try{
			person = (Person)ActionContext.getContext().getSession().get("person");
			return SUCCESS;
			
		}catch(Exception e){
			return ERROR;
		}
	}
    public String UpdatePassword(){
    	try{
    		person = (Person)ActionContext.getContext().getSession().get("person");
    		if(person.getPassword().equals(oldPassword)){
    			person.setPassword(newPassword);
        		this.getPersonService().getPersonDAO().updatePerson(person);
        		return SUCCESS;
    		}
    		else return ERROR;//‘≠√‹¬Î ‰»Î¥ÌŒÛ
    		
    	}catch(Exception e){
    		return ERROR;
    	}
    }
    public String UpdataUserInfo(){
    	try{
    		this.personService.getPersonDAO().updatePerson(this.person);
    		return SUCCESS;
    	}catch(Exception e){
    		return ERROR;
    	}
    }

}
