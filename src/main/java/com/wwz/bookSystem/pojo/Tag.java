package com.wwz.bookSystem.pojo;

/**
 * 标签实体----与数据库tag表对应
 * @author ASUS
 *
 */
public class Tag {

	private int id;			//主键
	private String name; 	//标签名称
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Tag(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public Tag() {
		super();
	}
	
}
