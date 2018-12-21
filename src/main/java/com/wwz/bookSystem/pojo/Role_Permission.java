package com.wwz.bookSystem.pojo;

/**
 * 角色-权限实体----与数据库role_permission表相对应
 * 用来存储角色和权限的关系
 * @author ASUS
 *
 */
public class Role_Permission {

	private int id;              //递增主键
	private int role_id;         //角色ID
	private int permission_id;   //权限ID
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public int getPermission_id() {
		return permission_id;
	}
	public void setPermission_id(int permission_id) {
		this.permission_id = permission_id;
	}
	
	
	
}
