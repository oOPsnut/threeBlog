package com.threeblog.domain;

import java.util.Date;

public class ReportBean {
	
	private String id;
	private String username;
	private String type;
	private String content;
	private String simple_reason;
	private String all_reason;
	private String feedback_reason;
	private String url;
	private String author_id;
	private String user_id;
	private String content_id;
	private Date add_time;
	private Date notice_time;
	private String status1;
	private String status2;
	private String status3;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSimple_reason() {
		return simple_reason;
	}
	public void setSimple_reason(String simple_reason) {
		this.simple_reason = simple_reason;
	}
	public String getAll_reason() {
		return all_reason;
	}
	public void setAll_reason(String all_reason) {
		this.all_reason = all_reason;
	}
	public String getFeedback_reason() {
		return feedback_reason;
	}
	public void setFeedback_reason(String feedback_reason) {
		this.feedback_reason = feedback_reason;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(String author_id) {
		this.author_id = author_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContent_id() {
		return content_id;
	}
	public void setContent_id(String content_id) {
		this.content_id = content_id;
	}
	public Date getAdd_time() {
		return add_time;
	}
	public void setAdd_time(Date add_time) {
		this.add_time = add_time;
	}
	public Date getNotice_time() {
		return notice_time;
	}
	public void setNotice_time(Date notice_time) {
		this.notice_time = notice_time;
	}
	public String getStatus1() {
		return status1;
	}
	public void setStatus1(String status1) {
		this.status1 = status1;
	}
	public String getStatus2() {
		return status2;
	}
	public void setStatus2(String status2) {
		this.status2 = status2;
	}
	public String getStatus3() {
		return status3;
	}
	public void setStatus3(String status3) {
		this.status3 = status3;
	}
	@Override
	public String toString() {
		return "ReportBean [id=" + id + ", username=" + username + ", type=" + type + ", content=" + content
				+ ", simple_reason=" + simple_reason + ", all_reason=" + all_reason + ", feedback_reason="
				+ feedback_reason + ", url=" + url + ", author_id=" + author_id + ", user_id=" + user_id
				+ ", content_id=" + content_id + ", add_time=" + add_time + ", notice_time=" + notice_time
				+ ", status1=" + status1 + ", status2=" + status2 + ", status3=" + status3 + "]";
	}
	public ReportBean(String id, String username, String type, String content, String simple_reason, String all_reason,
			String feedback_reason, String url, String author_id, String user_id, String content_id, Date add_time,
			Date notice_time, String status1, String status2, String status3) {
		super();
		this.id = id;
		this.username = username;
		this.type = type;
		this.content = content;
		this.simple_reason = simple_reason;
		this.all_reason = all_reason;
		this.feedback_reason = feedback_reason;
		this.url = url;
		this.author_id = author_id;
		this.user_id = user_id;
		this.content_id = content_id;
		this.add_time = add_time;
		this.notice_time = notice_time;
		this.status1 = status1;
		this.status2 = status2;
		this.status3 = status3;
	}
	public ReportBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
