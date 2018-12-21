package com.wwz.bookSystem.pojo;

/**
 * 公告实体----与数据库notice表对应
 * @author ASUS
 *
 */
public class Notice {

	private int id;     		//主键
	private String title; 		//标题
	private String content;		//内容
	private String releaseTime;	//发布时间
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReleaseTime() {
		return releaseTime;
	}
	public void setReleaseTime(String releaseTime) {
		this.releaseTime = releaseTime;
	}
	
	
}
