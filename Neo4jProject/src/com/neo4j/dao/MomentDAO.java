package com.neo4j.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import org.json.JSONObject;

import com.neo4j.model.Moment;
import com.neo4j.util.Neo4jConnection;

public class MomentDAO {
	private Moment moment = null;

	public Moment getMoment() {
		return moment;
	}

	public void setMoment(Moment moment) {
		this.moment = moment;
	}
	
	public String insertMoment(Moment moment) throws Exception{
		PreparedStatement stmt = null;       
        ResultSet rs = null;
        String cypher = "create ("+moment.getId()+":Moment {Id:{0}, timestamp:{1}, content:{2}, photos:{3}})"; 
        try {
            stmt = Neo4jConnection.getConn().prepareStatement(cypher);
            stmt.setString(0, moment.getId());
            stmt.setString(1, moment.getTimestamp());
            stmt.setString(2, moment.getContent());
            String photostring = "";
            for(int i = 0; i < moment.getPhotos().size(); i++){
            	if(i != 0){
            		photostring += ",";
            	}
            	photostring += moment.getPhotos().get(i);
            }
            stmt.setString(3, photostring);
            stmt.execute();
            return moment.getId();
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
	
	public void deleteMoment(String id) throws Exception{	
		PreparedStatement stmt = null;       
        ResultSet rs = null;
        String cypher = "match ("+id+":Moment{Id:{0}}) DETACH DELETE "+id; 
        try {
            stmt = Neo4jConnection.getConn().prepareStatement(cypher);
            stmt.setString(0, id);
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
	
	public Moment findById(String id) throws Exception{
		Moment moment = new Moment();
		PreparedStatement stmt = null;       
        ResultSet rs = null;
        String cypher = "match ("+id+":Moment {Id:'"+id+"'}) return "+id+".timestamp,"+id+".content,"+id+".Id,"+id+".photos"; 
        try {
            stmt = Neo4jConnection.getConn().prepareStatement(cypher);
            rs = stmt.executeQuery();
            while(rs.next()){
	        	moment.setContent(rs.getString(id+".content"));
	        	moment.setId(rs.getString(id+".Id"));
	        	List<String> photos = new ArrayList<String>();
	        	String[] strlist = rs.getString(id+".photos").split(",");
	        	for(String s : strlist){
	        		photos.add(s);
	        	}
	        	moment.setPhotos(photos);
				moment.setTimestamp(rs.getString(id+".timestamp"));
				
				int likeCount = 0;
				int repostCount = 0;
				cypher = "match (:Person)-[r:Relation{type:'Like'}]->(Moment{Id:'"+id+"'}) return type(r)";
				stmt = Neo4jConnection.getConn().prepareStatement(cypher);
	            rs = stmt.executeQuery();
	            while(rs.next()){
	            	likeCount += 1;
	            }
	            cypher = "match (:Person)-[r:Relation{type:'Repost'}]->(Moment{Id:'"+id+"'}) return type(r)";
				stmt = Neo4jConnection.getConn().prepareStatement(cypher);
	            rs = stmt.executeQuery();
	            while(rs.next()){
	            	repostCount += 1;
	            }
				moment.setLikeCount(likeCount);
				moment.setRepostCount(repostCount);
				
				int commentCount = 0;
				List<JSONObject> commentList = new ArrayList<JSONObject>();
				cypher = "match (p:Person)-[r:Relation{type:'Comment'}]->(Moment{Id:'"+id+"'}) return p.Id, p.portrait, p.username,r.comments, r.timestamp, r.toPerson";
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
	            	comment.put("to_name", pDAO.findById(to_id).getUsername());
	            	commentList.add(comment);
	            }
				moment.setCommentCount(commentCount);
				moment.setCommentList(commentList);
				
				return moment;
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
	@SuppressWarnings("unchecked")
	public List<Moment> allMoments()throws Exception{
    	PreparedStatement stmt = null;       
        ResultSet RS = null;
        PersonDAO pDAO = new PersonDAO();
        List<Moment> momentList = new ArrayList<Moment>();
        String cypher = "match (p:Person) return p.Id";
        try {
            stmt = Neo4jConnection.getConn().prepareStatement(cypher);
            RS = stmt.executeQuery();
            while(RS.next()){
            	//Person author = new Person();
            	String followId = RS.getString("p.Id");
            	/*author.setId(RS.getString("p.Id"));
            	author.setUsername(RS.getString("p.username"));
            	author.setPortrait(RS.getString("p.portrait"));*/
				momentList.addAll(pDAO.postMomentsByPersonId(followId));
			}
            Collections.sort(momentList, new Comparator() {
            	public int compare(Object a, Object b) {
            		String one = ((Moment) a).getTimestamp();
            		String two = ((Moment) b).getTimestamp();
            		return two.compareTo(one);
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
	public List<Moment> hotMoments() throws Exception{
        List<Moment> momentList = allMoments();
        int rangeEnd = momentList.size();
        if(rangeEnd > 100){
        	rangeEnd = 100;
        }
        momentList = momentList.subList(0, rangeEnd);
        Collections.sort(momentList, new Comparator<Object>() {
        	public int compare(Object a, Object b) {
        		int one = ((Moment) a).getCommentCount() * 5 + ((Moment) a).getLikeCount() + ((Moment) a).getLikeCount();
        		int two = ((Moment) b).getCommentCount() * 5 + ((Moment) b).getLikeCount() + ((Moment) b).getLikeCount();
        		return two - one;
        	}
        });
        return momentList;
    }
	public List<String> hotTopics() throws Exception{
		List<String> topicList = new ArrayList<String>();
		Map<String, Integer> topicMap = new HashMap<String, Integer>();
		PreparedStatement stmt = null;       
        ResultSet RS = null;
        String cypher = "match (m:Moment) return m.content";
        try {
            stmt = Neo4jConnection.getConn().prepareStatement(cypher);
            RS = stmt.executeQuery();
            while(RS.next()){
            	String content = RS.getString("m.content");
            	Pattern p = Pattern.compile("#(.*?)#");
            	Matcher m = p.matcher(content);
            	while(m.find()){
            		String topic = "#"+m.group(1)+"#";
            		if(topicMap.containsKey(topic)){
                        topicMap.put(topic, topicMap.get(topic)+1);
                       }else{
                        topicMap.put(topic, 1);
                       }
            	}
			}
            List<Map.Entry<String, Integer>> topicForSort = new ArrayList<Map.Entry<String, Integer>>(topicMap.entrySet());
            Collections.sort(topicForSort, new Comparator<Map.Entry<String, Integer>>() {   
                public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {      
                    return (o2.getValue() - o1.getValue()); 
                    //return (o1.getKey()).toString().compareTo(o2.getKey());
                }
            }); 
            for (int i = 0; i < 10 && i < topicForSort.size(); i++) {
                topicList.add(topicForSort.get(i).getKey());
            }
            return topicList;
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
	
	public List<Moment> findByTopic(String topic) throws Exception{
        List<Moment> momentList = allMoments();
        List<Moment> topicMoments = new ArrayList<Moment>();
        for(Moment moment: momentList){
        	String content = moment.getContent();
			Pattern p = Pattern.compile(topic);
            Matcher m = p.matcher(content);
            while (m.find()) {
                topicMoments.add(moment);
                break;
            }
        }
        Collections.sort(topicMoments, new Comparator<Object>() {
        	public int compare(Object a, Object b) {
        		String one = ((Moment) a).getTimestamp();
        		String two = ((Moment) b).getTimestamp();
        		return two.compareTo(one);
        	}
        });
        return topicMoments;
    }
	public static void main(String[] args) throws Exception{
    	MomentDAO mDAO = new MomentDAO();
    	mDAO.allMoments().size();
    	
    }

}
