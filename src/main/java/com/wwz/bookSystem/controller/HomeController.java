package com.wwz.bookSystem.controller;


import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wwz.bookSystem.service.UserService;

/**
 * 图书管理系统后台主界面控制器
 * @author ASUS
 *
 */
@Controller
public class HomeController {
	
	@Autowired
	UserService userService;
	
	//跳转到后台主界面home.jsp
	@RequestMapping("/home")
	public String home() 
	{
		return "back/home";
	}
	
	//加载欢迎界面
	@RequestMapping("/welcome")
	public String welcome()
	{
		return "back/welcome";
	}
	
	//跳转到没有权限界面
	@RequestMapping("/nopermission")
	public String nopermission()
	{
		return "back/nopermission";
	}
	
	//退出操作
	@RequestMapping("/logout")
	public String logout(HttpSession session)
	{
		Subject subject=SecurityUtils.getSubject();
		subject.logout();
		return "redirect:/login";
	}
	
	//异常测试
	@RequestMapping("/testException")
	public void testException() throws Exception
	{
		throw new Exception("测试的异常");
	}
	


}
