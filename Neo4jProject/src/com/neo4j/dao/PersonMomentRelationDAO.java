package com.neo4j.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.neo4j.model.Moment;
import com.neo4j.model.Person;
import com.neo4j.model.PersonMomentRelation;
import com.neo4j.util.DateUtil;
import com.neo4j.util.IDGenerator;
import com.neo4j.util.Neo4jConnection;

public class PersonMomentRelationDAO {
	private Person person = null;
	private Moment moment = null;
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	public Moment getMoment() {
		return moment;
	}
	public void setMoment(Moment moment) {
		this.moment = moment;
	}
	public void createMRelation(PersonMomentRelation pmr) throws Exception{
		 String cypher = "match (a:Person {Id:'"+pmr.getPerson().getId()+"'})"
			       +",(b:Moment {Id:'"+pmr.getMoment().getId()+"'})"
			       +" create (a)-[r1:Relation {Id:{0},timestamp:{1},type:{2},comments:{3},toPerson:{4}}]->(b)";
		 PreparedStatement stmt = null;       
         ResultSet rs = null;
         try {
        	 stmt = Neo4jConnection.getConn().prepareStatement(cypher);
        	 stmt.setString(0, pmr.getId());
             stmt.setString(1, pmr.getTimestamp());
             stmt.setString(2, pmr.getType());
             stmt.setString(3,pmr.getComments());
             stmt.setString(4,pmr.getToPerson());
             stmt.execute();
   } catch (Exception e) {
       throw e;
   } finally {
       if (null != rs) {
           rs.close();
       }
       if (null != stmt) {
           stmt.close();
       }
   }		
		
	}
	public void deleteMRelation(String userId,String relationId,String momentId) throws Exception{
		PreparedStatement stmt = null;       
        ResultSet rs = null;
        String cypher = "match (p1:Person {Id:'"+userId+"'})-[r:Relation {Id:'"+relationId+"'}]->(m1:Moment {Id:'"+momentId+"'})"
       		 + " detach delete r";
        try {
            stmt = Neo4jConnection.getConn().prepareStatement(cypher);
            stmt.execute();
        } catch (Exception e) {
            throw e;
        } finally {
            if (null != rs) {
                rs.close();
            }
            if (null != stmt) {
                stmt.close();
            }
        }
	}
	public void postMoment(PersonMomentRelation pmr,Moment moment) throws Exception{
		
		 String cypher = "match (a:Person {Id:'"+pmr.getPerson().getId()+"'})"
			       +"  create (a)-[r1:Relation {Id:{0},timestamp:{1},type:{2},comments:{3},toPerson:{4}}]->"
				   +"(b:Moment {Id:{5},timestamp:{6},content:{7},photos:{8}})";
		 PreparedStatement stmt = null;       
       ResultSet rs = null;
       try {
    	   String photos = "";
    	   
    	   for (int i =0;moment.getPhotos()!=null&&i<moment.getPhotos().size();i++){
    		   if(i<moment.getPhotos().size()-1)
    		   photos+= moment.getPhotos().get(i)+";";
    		   else photos+= moment.getPhotos().get(i);
    	   }
    	 
      	   stmt = Neo4jConnection.getConn().prepareStatement(cypher);
      	   stmt.setString(0, pmr.getId());
           stmt.setString(1, pmr.getTimestamp());
           stmt.setString(2, pmr.getType());
           stmt.setString(3, pmr.getComments());
           stmt.setString(4, pmr.getToPerson()==null?"":pmr.getToPerson());
           stmt.setString(5, moment.getId());
           stmt.setString(6, moment.getTimestamp());
           stmt.setString(7, moment.getContent());
           stmt.setString(8, photos);
          
           stmt.execute();
           
       } catch (Exception e) {
    	  
    	   throw e;
    	   } finally {
     if (null != rs) {
         rs.close();
     }
     if (null != stmt) {
         stmt.close();
     }
     }			
 }
	public static void main(String[] args) throws Exception{
		Moment m = new Moment();
		PersonMomentRelation pmr = new PersonMomentRelation();
		pmr.setComments("¹þ¹þ£¡");
		pmr.setId(IDGenerator.genKey(IDGenerator.MOMENTRELATION));
		pmr.setType("Comment");
		Person p = new Person();
		p.setId("p2");
		pmr.setPerson(p);
		pmr.setToPerson("P201701120850361");
		pmr.setTimestamp(DateUtil.defaultFormat(new Date()));
		PersonMomentRelationDAO pdao = new PersonMomentRelationDAO();
		m.setId("M201701121050151");
		pmr.setMoment(m);
		pdao.createMRelation(pmr);
		
		
		
	}

}
