package com.neo4j.view;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.neo4j.model.Moment;
import com.neo4j.model.Person;
import com.neo4j.model.PersonMomentRelation;
import com.neo4j.service.MomentService;
import com.neo4j.service.PersonMomentRelationService;
import com.neo4j.service.PersonService;
import com.neo4j.util.DateUtil;
import com.neo4j.util.IDGenerator;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CricleOfFriendAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private PersonService personService = new PersonService();
	private PersonMomentRelationService pmrService = new PersonMomentRelationService();
	private String momentId  = "";
	private String comment = "";
	private int momentCount = 0;
	private String userId;
	//private String username;
	private String hotTopic = "";
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getHotTopic() {
		return hotTopic;
	}
	public void setHotTopic(String hotTopic) {
		this.hotTopic = hotTopic;
	}
	public int getMomentCount() {
		return momentCount;
	}
	public void setMomentCount(int momentCount) {
		this.momentCount = momentCount;
	}
	private List<String> topics = new ArrayList<String>();
	public List<String> getTopics() {
		return topics;
	}
	public void setTopics(List<String> topics) {
		this.topics = topics;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getMomentId() {
		return momentId;
	}
	public void setMomentId(String momentId) {
		this.momentId = momentId;
	}
	public List<Moment> getMomentlist() {
		return momentlist;
	}
	public void setMomentlist(List<Moment> momentlist) {
		this.momentlist = momentlist;
	}
	private Person person = null;
	private String username = null; 
	private int momentType = 0;//0:全站微博；1：我的关注；2：热门微博；3：我的微博
	private String weibo_content = null;
	public String getWeibo_content() {
		return weibo_content;
	}
	public void setWeibo_content(String weibo_content) {
		this.weibo_content = weibo_content;
	}
	public int getMomentType() {
		return momentType;
	}
	public void setMomentType(int momentType) {
		this.momentType = momentType;
	}
	private List<Moment> momentlist = new ArrayList<Moment>();
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	private MomentService momentService = new MomentService();
	public MomentService getMomentService() {
		return momentService;
	}
	public void setMomentService(MomentService momentService) {
		this.momentService = momentService;
	}
	public PersonMomentRelationService getPmrService() {
		return pmrService;
	}
	public void setPmrService(PersonMomentRelationService pmrService) {
		this.pmrService = pmrService;
	}
	public PersonService getPersonService() {
		return personService;
	}
	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	public String MainPage(){
		try{
			
			person = (Person)ActionContext.getContext().getSession().get("person");
			this.hotTopics();
			switch(this.momentType){
			case 0:
				this.momentlist = this.getPersonService().getMomentDAO().allMoments();
				break;
			case 1:
				this.momentlist = this.getPersonService().getPersonDAO().followMomentsByPersonId(person.getId());
				break;
			case 2:
				this.momentlist = this.getPersonService().getMomentDAO().hotMoments();
				break;
			case 3:
				this.momentlist = this.getPersonService().getPersonDAO().postMomentsByPersonId(person.getId());
				break;
			}
			ActionContext.getContext().getSession().put("momentCount",this.momentlist.size());
			return SUCCESS;
		}catch(Exception e){
			System.out.println("fgfg"+e.getMessage());
			return ERROR;
		}
	}
	public String postMoment(){
		try{
			Person person = (Person)ActionContext.getContext().getSession().get("person");
			Moment moment = new Moment();
			moment.setAuthor(person);
			moment.setContent(this.weibo_content);
			moment.setId(IDGenerator.genKey(IDGenerator.MOMENT));
			moment.setPhotos(new ArrayList<String>());
			moment.setTimestamp(DateUtil.defaultFormat(new Date()));
			PersonMomentRelation pmr = new PersonMomentRelation();
			pmr.setId(IDGenerator.genKey(IDGenerator.MOMENTRELATION));
			pmr.setPerson(person);
			pmr.setMoment(moment);
			pmr.setTimestamp(moment.getTimestamp());
			pmr.setToPerson("");
			pmr.setType("Post");
			this.getPersonService().getPersonmomentRelationDAO().postMoment(pmr, moment);
			person = this.getPersonService().getPersonDAO().findById(person.getId());
			ActionContext.getContext().getSession().put("person",person);
			return SUCCESS;
		}catch(Exception e){
			//System.out.println(e.getMessage());
			return ERROR;
		}
	}
	public String deleteMoment(){
		try{
			this.getPersonService().getMomentDAO().deleteMoment(this.momentId);
			return SUCCESS;
			
		}catch (Exception e){
			return ERROR;
		}
	}
	public String commentMoment(){
		try{
			PersonMomentRelation pmr = new PersonMomentRelation();
			Moment m = new Moment();
			m.setId(this.momentId);
			pmr.setComments(this.comment);
			pmr.setId(IDGenerator.genKey(IDGenerator.MOMENTRELATION));
			pmr.setTimestamp(DateUtil.defaultFormat(new Date()));
			pmr.setToPerson("");
			pmr.setType("Comment");
			pmr.setMoment(m);
			pmr.setPerson((Person)ActionContext.getContext().getSession().get("person"));
			this.getPersonService().getPersonmomentRelationDAO().createMRelation(pmr);
			return SUCCESS;
		}catch(Exception e){
			return ERROR;
		}
	}
	public String hotTopics(){
		try{
			this.topics = this.personService.getMomentDAO().hotTopics();
			System.out.println(this.topics);
			ActionContext.getContext().getSession().put("topics", this.topics);
			return SUCCESS;
		}catch(Exception e){
			return ERROR;
		}
	}
	public String likeMoment(){
		try{
			System.out.println("click like");
			PersonMomentRelation pmr = new PersonMomentRelation();
			Moment m = new Moment();
			m.setId(this.momentId);
			pmr.setId(IDGenerator.genKey(IDGenerator.MOMENTRELATION));
			pmr.setTimestamp(DateUtil.defaultFormat(new Date()));
			pmr.setToPerson("");
			pmr.setType("Like");
			pmr.setMoment(m);
			pmr.setPerson((Person)ActionContext.getContext().getSession().get("person"));
			this.getPersonService().getPersonmomentRelationDAO().createMRelation(pmr);
			System.out.println("click like1");
			return SUCCESS;
		}catch(Exception e){
			return ERROR;
		}
	}
	public String ObtainTopicMoment(){
		try{
			System.out.println(this.hotTopic);
			this.momentlist = this.getPersonService().getMomentDAO().findByTopic(this.hotTopic);
			System.out.println(this.momentlist.size());
			this.momentType = 4;
			return SUCCESS;
		}catch (Exception e){
			return ERROR;
		}
	}
	public String ObtainUserMoment(){
		try{
			person = (Person)ActionContext.getContext().getSession().get("person");
			this.momentlist = this.getPersonService().getPersonDAO().postMomentsByPersonId(userId);
			return SUCCESS;
		}catch (Exception e){
			return ERROR;
		}
	}
	
	

}
