package com.wwz.bookSystem.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wwz.bookSystem.mapper.UserMapper;
import com.wwz.bookSystem.pojo.User;
import com.wwz.bookSystem.service.UserService;

/**
 * 业务逻辑层，与UserMapper对应的实现类
 * @author ASUS
 *
 */
@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper userMapper;
	
	//对日期进行格式化
	static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	//通过id查询用户和角色
	@Override
	public User selectUserById(int id) {
		return userMapper.selectUserById(id);
	}
	
	//添加用户
	@Override
	public void addUser(User user) throws Exception {
		//注册日期
		user.setRegDate(dateFormat.format(new Date()));
		Md5Hash hash=new Md5Hash(user.getPassword(),user.getUsername(),3);
		user.setPassword(""+hash);
		int result=userMapper.addUser(user);
		if (result==0) {
			throw new Exception("添加用户失败");
		}
	}
	
	//删除用户
	@Override
	public void deleteUser(int id) {
		userMapper.deleteUser(id);
	}

	//通过用户账号和密码验证登录
	@Override
	public User selectByUsername(String username) {
		return userMapper.selectByUsername(username);
	}

	//修改用户基本信息
	@Override
	public void modifyUser(User user) throws Exception {
		int result=userMapper.modifyUser(user);
		if (result==0) {
			throw new Exception("修改用户信息失败");
		}
	}

	//修改用户密码
	@Override
	public void modifyPassword(User user) throws Exception {
		Md5Hash hash=new Md5Hash(user.getPassword(),user.getUsername(),3);
		user.setPassword(""+hash);
		int result=userMapper.modifyPassword(user);
		if (result==0) {
			throw new Exception("修改密码失败");
		}
	}

	//通过username和password验证用户是否存在
	@Override
	public User selectByUsernameAndPassword(String username, String password) {
		return userMapper.selectByUsernameAndPassword(username, password);
	}

	//查询所有用户
	@Override
	public List<User> selectAllUser() {
		return userMapper.selectAllUser();
	}

	//重置密码
	@Override
	public void resetPassword(int id, String password) throws Exception {
		User user=new User();
		user.setId(id);
		user.setPassword(password);
		int result=userMapper.modifyPassword(user);
		if (result==0) {
			throw new Exception("重置密码失败");
		}
	}

}
