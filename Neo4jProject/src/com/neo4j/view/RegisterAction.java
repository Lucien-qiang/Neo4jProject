package com.neo4j.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
//import org.springframework.context.ApplicationContext;

import com.neo4j.dao.PersonDAO;
import com.neo4j.model.Person;
import com.neo4j.service.PersonService;
import com.neo4j.util.IDGenerator;
import com.neo4j.util.Neo4jConnection;
import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public Map<String, String> getJson() {
		return json;
	}
	public void setJson(Map<String, String> json) {
		this.json = json;
	}
	private PersonService personService = new PersonService();
	private Person person = null;
	private String email = null;
	private Map<String,String> json = new HashMap<String,String>();
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public PersonService getPersonService() {
		return personService;
	}
	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}
	public String Register(){
		try{
			person.setId(IDGenerator.genKey(IDGenerator.PERSON));
			String str = (char)person.getId().toCharArray()[person.getId().length()-1]+"";
			person.setPortrait((Integer.parseInt(str)%10)+".jpg");
			this.getPersonService().getPersonDAO().insertPerson(person);
			return SUCCESS;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ERROR;
		}
	}
	public String IsExist(){
		try{
			this.json.clear();
			List<Person> list = this.getPersonService().getPersonDAO().selectPersons("match (person:Person{email:"+this.email+"}) return person");
			if(list.size()>0){
				this.json.put("isExist","1");
			}
			else this.json.put("isExist","0");
			return SUCCESS;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return ERROR;
		}
	}

}