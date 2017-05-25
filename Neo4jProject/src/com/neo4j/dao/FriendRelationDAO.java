package com.neo4j.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.neo4j.model.FriendRelation;
import com.neo4j.model.Person;
import com.neo4j.util.Neo4jConnection;

public class FriendRelationDAO {
	private FriendRelation friendRelation = null;
	private Person person = null;
	public FriendRelation getFriendRelation() {
		return friendRelation;
	}
	public void setFriendRelation(FriendRelation friendRelation) {
		this.friendRelation = friendRelation;
	}
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	//¹Ø×¢
	public void createFollow(FriendRelation friendRelation) throws Exception{
		
		 String cypher = "match (a:Person {Id:'"+friendRelation.getlPerson().getId()+"'})"
				       +",(b:Person {Id:'"+friendRelation.getrPerson().getId()+"'})"
				       +" create (a)-[f1:Follow {Id:{0},timestamp:{1}}]->(b)";
		 PreparedStatement stmt = null;       
         ResultSet rs = null;
         try {
             stmt = Neo4jConnection.getConn().prepareStatement(cypher);
             stmt.setString(0, friendRelation.getId());
             stmt.setString(1, friendRelation.getTimestamp());
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
	//È¡¹Ø
	public void deleteFollow(String leftId,String rightId) throws Exception{
		
		 PreparedStatement stmt = null;       
         ResultSet rs = null;
         String cypher = "match (p1:Person {Id:'"+leftId+"'})-[f:Follow]->(p2:Person {Id:'"+rightId+"'})"
        		 + " detach delete f";
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
    public List<Person> obtainOwnFollowers(String userId) throws Exception{
    	//System.out.println("fgfg");
    	 PreparedStatement stmt = null;  
    	 List<Person> persons = new ArrayList<Person>();
         ResultSet rs = null;
         String cypher = "match (p1:Person{Id:'"+userId+"'})-[f:Follow]->(p:Person) return p.Id,p.email,p.username,p.password,p.portrait";
         try {
             stmt = Neo4jConnection.getConn().prepareStatement(cypher);
             rs = stmt.executeQuery();
             while(rs.next()){
            	 Person p = new Person();
            	 p.setId(rs.getString("p.Id"));
            	 p.setEmail(rs.getString("p.email"));
            	 p.setPassword(rs.getString("p.password"));
            	 p.setPortrait(rs.getString("p.portrait"));
            	 p.setUsername(rs.getString("p.username"));
            	 p.setFanCount(this.fanCount(p.getId()));
            	 p.setFollowCount(this.followCount(p.getId()));
            	 p.setMomentCount(this.momentCount(p.getId()));
            	 persons.add(p);
            	 
             }
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
        return persons;
    }
    public List<Person> obtainOwnFans(String userId) throws Exception{
    	 PreparedStatement stmt = null;  
    	 List<Person> persons = new ArrayList<Person>();
         ResultSet rs = null;
         String cypher = "match (p:Person)-[f:Follow]->(p2:Person {Id:'"+userId+"'}) return p.Id,p.email,p.username,p.password,p.portrait";
         try {
             stmt = Neo4jConnection.getConn().prepareStatement(cypher);
             rs = stmt.executeQuery();
             while(rs.next()){
            	 Person p = new Person();
            	 p.setId(rs.getString("p.Id"));
            	 p.setEmail(rs.getString("p.email"));
            	 p.setPassword(rs.getString("p.password"));
            	 p.setPortrait(rs.getString("p.portrait"));
            	 p.setUsername(rs.getString("p.username"));
            	 p.setFanCount(this.fanCount(p.getId()));
            	 p.setFollowCount(this.followCount(p.getId()));
            	 p.setMomentCount(this.momentCount(p.getId()));
            	 persons.add(p);
            	 
             }
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
        return persons;
    }
    public List<Person> obtainPopularUser() throws Exception{
   	 PreparedStatement stmt = null;  
   	 List<Person> persons = new ArrayList<Person>();
        ResultSet rs = null;
        String cypher = "match (p:Person) return p.Id,p.email,p.username,p.password,p.portrait";
        try {
            stmt = Neo4jConnection.getConn().prepareStatement(cypher);
            rs = stmt.executeQuery();
            while(rs.next()){
           	 Person p = new Person();
           	 p.setId(rs.getString("p.Id"));
           	 p.setEmail(rs.getString("p.email"));
           	 p.setPassword(rs.getString("p.password"));
           	 p.setPortrait(rs.getString("p.portrait"));
           	 p.setUsername(rs.getString("p.username"));
           	 p.setFanCount(this.fanCount(p.getId()));
        	 p.setFollowCount(this.followCount(p.getId()));
        	 p.setMomentCount(this.momentCount(p.getId()));
           	 persons.add(p);
           	 
            }
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
       return persons;
   }
    public int fanCount(String id) throws Exception{
   	    PreparedStatement stmt = null;       
        ResultSet rs = null;
        int a = 0;
        String cypher = "match (n1:Person)-[f1:Follow]->(p:Person {Id:'"+id+"'}) return count(n1)"; 
        try {
            stmt = Neo4jConnection.getConn().prepareStatement(cypher);
            rs = stmt.executeQuery();
            while(rs.next()){
              a = rs.getInt("count(n1)");
           	 return a;
            }
          
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
   	return 0;	
    	
    }
    public int followCount(String id) throws Exception{
   	    PreparedStatement stmt = null;       
        ResultSet rs = null;
        int a = 0;
        String cypher = "match (p:Person {Id:'"+id+"'})-[f1:Follow]->(n1:Person) return count(n1)"; 
        try {
            stmt = Neo4jConnection.getConn().prepareStatement(cypher);
            rs = stmt.executeQuery();
            while(rs.next()){
              a = rs.getInt("count(n1)");
           	 return a;
            }
          
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
   	return 0;	
    	
    }
    public int momentCount(String id) throws Exception{
   	    PreparedStatement stmt = null;       
        ResultSet rs = null;
        int a = 0;
        String cypher = "match (p:Person {Id:'"+id+"'})-[f1:Relation {type:'Post'}]->(n1:Moment) return count(n1)"; 
        try {
            stmt = Neo4jConnection.getConn().prepareStatement(cypher);
            rs = stmt.executeQuery();
            while(rs.next()){
              a = rs.getInt("count(n1)");
           	 return a;
            }
          
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
   	return 0;	
    	
    }
}
