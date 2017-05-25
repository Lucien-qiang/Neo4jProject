package com.neo4j.model;

import java.util.List;

import org.json.JSONObject;


public class Moment {
	private String timestamp;
	private String content;
	private String Id;
	private List<String> photos;
	private int likeCount;
	private int repostCount;
	private int commentCount;
	private List<JSONObject> commentList;
	private Person author = new Person();
	
	public Person getAuthor() {
		return author;
	}
	public void setAuthor(Person author) {
		this.author = author;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getRepostCount() {
		return repostCount;
	}
	public void setRepostCount(int repostCount) {
		this.repostCount = repostCount;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	
	public List<JSONObject> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<JSONObject> commentList) {
		this.commentList = commentList;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public List<String> getPhotos() {
		return photos;
	}
	public void setPhotos(List<String> photos) {
		this.photos = photos;
	}
	

}
