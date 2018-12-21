package com.wwz.bookSystem.pojo;

import java.util.List;

/**
 * 角色实体----与数据库role表相对应
 * @author ASUS
 *
 */
public class Role {

	private int id;             //递增主键
	private String identity;    //身份
	
	private List<User> users;   //用户集合
	private List<Permission> permissions;   //权限集合
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIdentity() {
		return identity;
	}
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public List<Permission> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}
	
}
