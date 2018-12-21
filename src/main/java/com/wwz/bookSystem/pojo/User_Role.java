package com.wwz.bookSystem.pojo;

/**
 * 用户-角色实体----与数据库user_role表相对应
 * 用来存储用户和角色的关系
 * @author ASUS
 *
 */
public class User_Role {

	private int id;         //递增主键
	private int user_id;    //用户表ID
	private int role_id;    //角色表ID
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	
	
}
