package com.threeblog.domain;

import java.util.Date;

public class ArticleBean {
	private String id;
	private String author_id;
	private String author;
	private String cover;
	private String title;
	private String introduction;
	private String label;
	private String text;
	private String allpic;
	private Date publish_date;
	private int click_num;
	private int liked_num;
	private int collect_num;
	private int comment_num;
	private String status;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(String author_id) {
		this.author_id = author_id;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getAllpic() {
		return allpic;
	}
	public void setAllpic(String allpic) {
		this.allpic = allpic;
	}
	public Date getPublish_date() {
		return publish_date;
	}
	public void setPublish_date(Date publish_date) {
		this.publish_date = publish_date;
	}
	public int getClick_num() {
		return click_num;
	}
	public void setClick_num(int click_num) {
		this.click_num = click_num;
	}
	public int getLiked_num() {
		return liked_num;
	}
	public void setLiked_num(int liked_num) {
		this.liked_num = liked_num;
	}
	public int getCollect_num() {
		return collect_num;
	}
	public void setCollect_num(int collect_num) {
		this.collect_num = collect_num;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Article [id=" + id + ", author_id=" + author_id + ", author=" + author + ", cover=" + cover + ", title="
				+ title + ", introduction=" + introduction + ", label=" + label + ", text=" + text + ", allpic="
				+ allpic + ", publish_date=" + publish_date + ", click_num=" + click_num + ", liked_num=" + liked_num
				+ ", collect_num=" + collect_num + ", comment_num=" + comment_num + ", status=" + status + "]";
	}
	public ArticleBean() {
		super();
	}
	public ArticleBean(String id, String author_id, String author, String cover, String title, String introduction, String label,
			String text, String allpic, Date publish_date, int click_num, int liked_num, int collect_num,
			int comment_num, String status) {
		super();
		this.id = id;
		this.author_id = author_id;
		this.author = author;
		this.cover = cover;
		this.title = title;
		this.introduction = introduction;
		this.label = label;
		this.text = text;
		this.allpic = allpic;
		this.publish_date = publish_date;
		this.click_num = click_num;
		this.liked_num = liked_num;
		this.collect_num = collect_num;
		this.comment_num = comment_num;
		this.status = status;
	}
	
	
}
