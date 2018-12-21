package com.wwz.bookSystem.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wwz.bookSystem.pojo.User;
import com.wwz.bookSystem.service.UserService;

/**
 * 登录控制器
 * @author ASUS
 *
 */
@SessionAttributes("user")
@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	UserService userService;

	//跳转到登录界面login.jsp
	@RequestMapping(method=RequestMethod.GET)
	public String toLogin()
	{
		return "login";
	}
	
	//验证登录
	@RequestMapping(method=RequestMethod.POST)
	public String login(ModelMap modelMap,HttpServletRequest request)
	{
		//获取账号密码
		String username=request.getParameter("username");
        String password=request.getParameter("password");
        if((username!=null && password!=null)){
            UsernamePasswordToken token=new UsernamePasswordToken(username,password);
            Subject subject= SecurityUtils.getSubject();
            try{
            	//进行登录认证
                subject.login(token);
                //将用户信息保存到session
                User user=(User) subject.getPrincipal();
                System.out.println("登录成功："+user.toString());
                modelMap.addAttribute("user", user);
                //认证成功
                return "redirect:/home";
            }
            catch (AuthenticationException e){
            	modelMap.addAttribute("error", "密码不正确");
            	return "redirect:/login";
            }
        }
        return "login";
	}
	
	//检查用户是否存在，返回true,证明用户存在，可用；反之不可用(登录验证)
	@ResponseBody
	@RequestMapping(value="/checkUserExist",method=RequestMethod.GET)
	public String checkUserExist(String username)
	{
		boolean flag=false;
		String stringJson=null;
		User user=userService.selectByUsername(username);
		if (user!=null) {      //如果用户存在，则设flag为true
			flag=true;
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
	
	//检查密码是否与账号匹配
	@ResponseBody
	@RequestMapping(value="/checkPasswordMatch",method=RequestMethod.GET)
	public String checkPasswordMatch(String username,String password)
	{
		boolean flag=false;
		String stringJson=null;
		User user=userService.selectByUsername(username);
		if (user!=null) {      //如果用户存在，则设flag为true
			String hashPassword=new Md5Hash(password,user.getUsername(),3)+"";
			if (user.getPassword().equals(hashPassword)) {
				flag=true;
			}
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
