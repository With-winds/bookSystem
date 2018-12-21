package com.wwz.bookSystem.pojo;

import java.util.List;

/**
 * 用户实体----与数据库user表对应
 * @author ASUS
 *
 */
public class User {

	private int id;            //递增主键
	private String username;   //用户账号
	private String password;   //用户密码
	private String name;       //姓名
	private String email;      //邮箱
	private String phone;      //手机号码
	private String regDate;      //注册日期
	
	private List<Role> roles;   //角色集合
	
	//非数据库字段
	private String newPassword;   //用于修改密码
	private String rePassword;   //用于确认密码
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public String getRePassword() {
		return rePassword;
	}
	public void setRePassword(String resPassword) {
		this.rePassword = resPassword;
	}
	
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public User() {
		super();
	}
	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + "]";
	}
	
	
}
