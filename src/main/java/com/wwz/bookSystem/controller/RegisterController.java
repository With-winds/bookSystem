package com.wwz.bookSystem.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wwz.bookSystem.pojo.User;
import com.wwz.bookSystem.service.UserService;

/**
 * 注册控制器
 * @author ASUS
 *
 */
@Controller
@RequestMapping(value="/register")
public class RegisterController {
	
	@Autowired
	UserService userService;

	//跳转到注册界面register.jsp
	@RequestMapping(method=RequestMethod.GET)
	public String toRegister()
	{
		return "register";
	}
	
	//进行注册，将用户信息添加进user表
	@RequestMapping(method=RequestMethod.POST)
	public String register(User user) throws Exception
	{
		userService.addUser(user);
		//注册成功，跳转到登录界面login.jsp
		return "redirect:/login";
	}
	
	//检查用户名是否可用，返回true,证明用户不存在，可用；反之不可用（注册验证）
	@ResponseBody
	@RequestMapping(value="/checkUserNotExist",method=RequestMethod.GET)
	public String checkUserNotExist(String username)
	{
		boolean flag=true;
		String stringJson=null;
		User user=userService.selectByUsername(username);
		if (user!=null) {      //如果用户存在，则设flag为true
			flag=false;
		}
		Map<String, Boolean> map=new HashMap<String,Boolean>();
		map.put("valid", flag);
		try {
			stringJson=new ObjectMapper().writeValueAsString(map);
		} 
		catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return stringJson;
	}
	
	
	
}
