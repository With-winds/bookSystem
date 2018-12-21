package com.wwz.bookSystem.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wwz.bookSystem.pojo.User;

/**
 * 对用户表user进行操作
 * @author ASUS
 *
 */
@Mapper
public interface UserMapper {
	
	//通过id查询用户和角色
	public User selectUserById(int id);

	//添加用户
	public int addUser(User user);
	
	//删除用户
	public void deleteUser(int id);
	
	//验证登录
	public User selectByUsername(String username);
	
	//修改基本信息
	public int modifyUser(User user);
	
	//修改用户密码
	public int modifyPassword(User user);
	
	//通过username和password验证用户是否存在
	public User selectByUsernameAndPassword(String username,String password);
	
	//通过角色ID查询用户集合
	public List<User> selectUserByRoleId(int role_id);
	
	//查询所有用户
	public List<User> selectAllUser();
	
	
}
