package com.wwz.bookSystem.service;

import java.util.List;

import com.wwz.bookSystem.pojo.User;

/**
 * 业务逻辑层，与UserMapper对应
 * @author ASUS
 *
 */
public interface UserService {
	
	//通过id查询用户和角色
	public User selectUserById(int id);

	//添加用户
	public void addUser(User user) throws Exception;
	
	//删除用户
	public void deleteUser(int id);
	
	//通过用户账号和密码验证登录
	public User selectByUsername(String username);
	
	//通过username和password验证用户是否存在
	public User selectByUsernameAndPassword(String username,String password);
	
	//修改用户基本信息
	public void modifyUser(User user) throws Exception;
		
	//修改用户密码
	public void modifyPassword(User user) throws Exception;
	
	//查询所有用户
	public List<User> selectAllUser();
	
	//通过用户ID重置密码
	public void resetPassword(int id,String password) throws Exception;
	
}
