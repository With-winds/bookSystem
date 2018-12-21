package com.wwz.bookSystem.pojo;

/**
 * 权限实体----与数据库permission表相对应
 * @author ASUS
 *
 */
public class Permission {

	private int id;           //递增主键
	private String name;      //权限名称 ，例：用户删除
	private String resource;  //权限            例：user:delete
	
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
	public String getResource() {
		return resource;
	}
	public void setResource(String resource) {
		this.resource = resource;
	}
	
	
}
