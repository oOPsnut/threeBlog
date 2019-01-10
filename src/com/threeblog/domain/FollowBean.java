package com.threeblog.domain;

import java.util.Date;

public class FollowBean {
	
	private String id;
	private String following_id;
	private String follower_id;
	private Date follow_date;
	private String status;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFollowing_id() {
		return following_id;
	}
	public void setFollowing_id(String following_id) {
		this.following_id = following_id;
	}
	public String getFollower_id() {
		return follower_id;
	}
	public void setFollower_id(String follower_id) {
		this.follower_id = follower_id;
	}
	public Date getFollow_date() {
		return follow_date;
	}
	public void setFollow_date(Date follow_date) {
		this.follow_date = follow_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "FollowBean [id=" + id + ", following_id=" + following_id + ", follower_id=" + follower_id
				+ ", follow_date=" + follow_date + ", status=" + status + "]";
	}
	public FollowBean(String id, String following_id, String follower_id, Date follow_date, String status) {
		super();
		this.id = id;
		this.following_id = following_id;
		this.follower_id = follower_id;
		this.follow_date = follow_date;
		this.status = status;
	}
	public FollowBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
