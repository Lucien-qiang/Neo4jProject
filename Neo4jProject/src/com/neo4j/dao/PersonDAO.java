package com.neo4j.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

import com.neo4j.model.Moment;
import com.neo4j.model.Person;
import com.neo4j.util.Neo4jConnection;

public class PersonDAO {
	private Person person = new Person();

	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
    public void insertPerson(Person person) throws Exception{
    	 PreparedStatement stmt = null;       
         ResultSet rs = null;
         String cypher = "create (p:Person {Id:{5},username:{1},password:{2},email:{3},portrait:{4}})"; 
         try {
        	 System.out.println(person.getId());
             stmt = Neo4jConnection.getConn().prepareStatement(cypher);
             stmt.setString(1, person.getUsername());
             stmt.setString(2,person.getPassword());
             stmt.setString(3, person.getEmail());
             stmt.setString(4, person.getPortrait());
             stmt.setString(5, person.getId());
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
    public void updatePerson(Person person) throws Exception{
    	 PreparedStatement stmt = null;       
         ResultSet rs = null;
         String id = person.getId();
         String cypher = "match (p:Person{Id:{5}}) set p.username={1},p.password={2},p.email={3},p.portrait={4}"; 
         try {
             stmt = Neo4jConnection.getConn().prepareStatement(cypher);
             stmt.setString(1, person.getUsername());
             stmt.setString(2,person.getPassword());
             stmt.setString(3, person.getEmail());
             stmt.setString(4, person.getPortrait());
             stmt.setString(5, id);
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
    public void deletePerson(String id) throws Exception{	
    	 PreparedStatement stmt = null;       
         ResultSet rs = null;
         String cypher = "match (p:Person{Id:{5}}) DETACH DELETE p"; 
         try {
             stmt = Neo4jConnection.getConn().prepareStatement(cypher);
             stmt.setString(5, id);
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
    public List<Person> selectPersons(String cypher) throws Exception{
    	List<Person> persons = new ArrayList<Person>();
   	    PreparedStatement stmt = null;       
        ResultSet rs = null;
        try {
            stmt = Neo4jConnection.getConn().prepareStatement(cypher);
            rs = stmt.executeQuery();
            while(rs.next()){
             Person person = new Person();
           	 person.setEmail(rs.getString("p.email"));
           	 person.setUsername(rs.getString("p.username"));
           	 person.setPassword(rs.getString("p.password"));
           	 person.setPortrait(rs.getString("p.portrait"));
           	 person.setId(rs.getString("p.Id"));
           	 person.setFanCount(this.fanCount(person.getId()));
           	 person.setFollowCount(this.followCount(person.getId()));
           	 person.setMomentCount(this.momentCount(person.getId()));
           	 persons.add(person);
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
    public Person findById(String id) throws Exception{
    	 Person person = new Person();
    	 PreparedStatement stmt = null;       
         ResultSet rs = null;
         String cypher = "match (p:Person {Id:'"+id+"'}) return p.username,p.email,p.password,p.portrait"; 
         try {
             stmt = Neo4jConnection.getConn().prepareStatement(cypher);
             rs = stmt.executeQuery();
             while(rs.next()){
            	 person.setEmail(rs.getString("p.email"));
            	 person.setUsername(rs.getString("p.username"));
            	 person.setPassword(rs.getString("p.password"));
            	 person.setPortrait(rs.getString("p.portrait"));
            	 person.setId(id);
            	 person.setFanCount(this.fanCount(id));
            	 person.setFollowCount(this.followCount(id));
            	 person.setMomentCount(this.momentCount(id));
            	 return person;
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
    	return null;	
    }
    public List<Moment> postMomentsByPersonId(String id) throws Exception{
  		PreparedStatement stmt = null;       
          ResultSet RS = null;
          String cypher = "match (p:Person{Id:'"+id+"'})-[r:Relation{type:'Post'}]->(m:Moment) return m.timestamp, m.content, m.Id,m.photos,p.username,p.Id,p.portrait";
          try {
              stmt = Neo4jConnection.getConn().prepareStatement(cypher);
              RS = stmt.executeQuery();
              List<Moment> momentList = new ArrayList<Moment>();
              while(RS.next()){
              	Moment moment = new Moment();
              	Person author = new Person();
              	author.setId(RS.getString("p.Id"));
            	author.setUsername(RS.getString("p.username"));
            	author.setPortrait(RS.getString("p.portrait"));
  	        	moment.setContent(RS.getString("m.content"));
  	        	moment.setId(RS.getString("m.Id"));
  	        	List<String> photos = new ArrayList<String>();
  	        	String[] strlist = RS.getString("m.photos").split(",");
  	        	for(String s : strlist){
  	        		photos.add(s);
  	        	}
  	        	moment.setPhotos(photos);
  				moment.setTimestamp(RS.getString("m.timestamp"));
  				moment.setAuthor(author);
  				ResultSet rs = null;
  				String momentId = moment.getId();
  				int likeCount = 0;
  				int repostCount = 0;
  				cypher = "match (:Person)-[r:Relation{type:'Like'}]->(Moment{Id:'"+momentId+"'}) return type(r)";
  				stmt = Neo4jConnection.getConn().prepareStatement(cypher);
  	            rs = stmt.executeQuery();
  	            while(rs.next()){
  	            	likeCount += 1;
  	            }
  	            cypher = "match (:Person)-[r:Relation{type:'Repost'}]->(Moment{Id:'"+momentId+"'}) return type(r)";
  				stmt = Neo4jConnection.getConn().prepareStatement(cypher);
  	            rs = stmt.executeQuery();
  	            while(rs.next()){
  	            	repostCount += 1;
  	            }
  				moment.setLikeCount(likeCount);
  				moment.setRepostCount(repostCount);
  				
  				int commentCount = 0;
  				List<JSONObject> commentList = new ArrayList<JSONObject>();
  				cypher = "match (p:Person)-[r:Relation{type:'Comment'}]->(Moment{Id:'"+momentId+"'}) return p.Id, p.portrait, p.username,r.comments, r.timestamp, r.toPerson";
  				stmt = Neo4jConnection.getConn().prepareStatement(cypher);
  	            rs = stmt.executeQuery();
  	            while(rs.next()){ 
  	            	commentCount +=1;
  	                JSONObject comment = new JSONObject();  
  	                comment.put("from_id", rs.getString("p.Id"));
  	            	comment.put("from_portrait", rs.getString("p.portrait"));
  	            	comment.put("from_name", rs.getString("p.username"));
  	            	comment.put("content", rs.getString("r.comments"));
  	            	comment.put("timestamp", rs.getString("r.timestamp"));
  	            	String to_id = rs.getString("r.toPerson");
  	            	comment.put("to_id", to_id);
  	            	PersonDAO pDAO = new PersonDAO();
  	            	//comment.put("to_name", pDAO.findById(to_id).getUsername());
  	            	commentList.add(comment);
  	            }
  				moment.setCommentCount(commentCount);
  				moment.setCommentList(commentList);
  				
  				momentList.add(moment);
  				
  			}
              return momentList;
          } catch (Exception e) {
              throw e;
          } finally {
              if (null != RS) {
                  RS.close();
              }
              if (null != stmt) {
                  stmt.close();
              }
          }
     }
      
      @SuppressWarnings("unchecked")
  	public List<Moment> followMomentsByPersonId(String id)throws Exception{
      	PreparedStatement stmt = null;       
          ResultSet RS = null;
          List<Moment> momentList = new ArrayList<Moment>();
          String cypher = "match (Person{Id:'"+id+"'})-[r:Follow]->(p:Person) return p.Id";
          try {
              stmt = Neo4jConnection.getConn().prepareStatement(cypher);
              RS = stmt.executeQuery();
              while(RS.next()){
              	String followId = RS.getString("p.Id");
  				momentList.addAll(postMomentsByPersonId(followId));
  			}
              Collections.sort(momentList, new Comparator() {
              	public int compare(Object a, Object b) {
              		String one = ((Moment) a).getTimestamp();
              		String two = ((Moment) b).getTimestamp();
              		return Integer.parseInt(two) - Integer.parseInt(one);
              	}
              });
              return momentList;
          } catch (Exception e) {
              throw e;
          } finally {
              if (null != RS) {
                  RS.close();
              }
              if (null != stmt) {
                  stmt.close();
              }
          }
      }
      public List<Person> recommendFriendById(String id) throws Exception{
      	Map<String, Integer> idMap = new HashMap<String, Integer>();
      	PreparedStatement stmt = null;
          ResultSet rs = null;
          String cypher = "match (fromp:Person {Id:'"+id+"'})-[:Follow]->(Person)-[:Follow]->(p:Person) WHERE NOT (fromp)-[:Follow]->(p) return p.Id";
          List<Person> recommendList = new ArrayList<Person>();
          try {
              stmt = Neo4jConnection.getConn().prepareStatement(cypher);
              rs = stmt.executeQuery();
              while(rs.next()){
              	String recommendId = rs.getString("p.Id");
              	if(idMap.containsKey(recommendId)){
              		idMap.put(recommendId, idMap.get(recommendId)+1);
              	}else{
              		idMap.put(recommendId, 1);
  				}
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
          List<Map.Entry<String, Integer>> idForSort = new ArrayList<Map.Entry<String, Integer>>(idMap.entrySet());
          Collections.sort(idForSort, new Comparator<Map.Entry<String, Integer>>() {   
              public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {      
                  return (o2.getValue() - o1.getValue());
              }
          }); 
          for (int i = 0; i < 10 && i < idForSort.size(); i++) {
              recommendList.add(findById(idForSort.get(i).getKey()));
          }
          return recommendList;
     }
    public static void main(String[] args) throws Exception{
    	PersonDAO pDAO = new PersonDAO();
    	List list = pDAO.selectPersons("match(p:Person) return p.username,p.email,p.password,p.portrait,p.Id");
    	System.out.println(list.size());
    	Person person= new Person();
    }
}
