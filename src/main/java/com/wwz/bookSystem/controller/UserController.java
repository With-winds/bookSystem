package com.wwz.bookSystem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wwz.bookSystem.annotation.PermissionName;
import com.wwz.bookSystem.pojo.Role;
import com.wwz.bookSystem.pojo.User;
import com.wwz.bookSystem.service.UserService;
import com.wwz.bookSystem.util.Page;

/**
 * 对用户表操作的控制器
 * @author ASUS
 *
 */
@SessionAttributes("user")
@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	
	//跳转到查看信息界面
	@RequestMapping("/seeInfo")
	public String seeInfo(int id,ModelMap modelMap)
	{
		User user=userService.selectUserById(id);
		modelMap.addAttribute("user", user);
		return "back/user/seeInfo";
	}
	
	//跳转到修改信息界面
	@RequestMapping("/modifyInfo")
	public String modifyInfo(Integer id,ModelMap modelMap)
	{
		User user=userService.selectUserById(id);
		modelMap.addAttribute("user", user);
		return "back/user/modifyInfo";
	}
	
	//修改用户基本信息
	@RequestMapping("/modifyUser")
	public String modifyInfo(User user,ModelMap modelMap) throws Exception
	{
		userService.modifyUser(user);
		modelMap.addAttribute("user", user);
		return "redirect:/seeInfo?id="+user.getId();
	}
	
	//跳转到修改用户密码界面
	@RequestMapping(value="/modifyPassword",method=RequestMethod.GET)
	public String toModifyPassword(int id,ModelMap modelMap)
	{
		User user=userService.selectUserById(id);
		modelMap.addAttribute("user", user);
		return "back/user/modifyPassword";
	}

	//修改用户密码
	@RequestMapping(value="/modifyPassword",method=RequestMethod.POST)
	public String modifyPassword(User user,HttpSession session) throws Exception
	{
		User currentUser=(User) session.getAttribute("user");
		if ((currentUser.getPassword()).equals(user.getPassword())) {
			currentUser.setPassword(user.getNewPassword());
			userService.modifyPassword(currentUser);
			return "redirect:/seeInfo?id="+user.getId();
		}
		else {
			return "back/user/modifyPassword?id="+user.getId();
		}
	}
	
	//跳转到重置用户密码--管理员权限，用于找回密码
	@RequestMapping(value="/resetPassword",method=RequestMethod.GET)
	@RequiresPermissions("password:reset")
    @PermissionName("密码重置")
	public String toResetPassword(ModelMap modelMap,Page page)
	{
		//如果开始位置start小于0，则置0
		if(page.getStart()<0) {
			page.setStart(0);
		}
		
		//如果开始位置start大于总数，则置为最后一页开始位置
		if(page.getStart()>=page.getTotal()) {
			page.setStart(page.getLast());
		}
		
		//在查询所有数据之前调用pagehelper,参数为开始位置和每页个数
		PageHelper.offsetPage(page.getStart(),page.getCount());
		//查询
		List<User> users=userService.selectAllUser();
		//通过总数计算最后一页开始位置
		page.setTotal((int) new PageInfo<User>(users).getTotal());
		page.caculateLast(page.getTotal());
				
		//设置页码
		page.setUpIndex(page.getStart(), page.getCount());
						
		modelMap.addAttribute("users", users);
		return "back/user/resetPassword";
	}
	
	//重置用户密码--管理员权限，用于找回密码
	@RequestMapping(value="/resetPassword",method=RequestMethod.POST)
	@RequiresPermissions("password:reset")
    @PermissionName("密码重置")
	public String resetPassword(User user) throws Exception
	{
		userService.modifyPassword(user);
		return "redirect:/userList";
	}
	
	/**
	 * 跳转到用户列表界面
	 * 查询所有用户
	 */
	@RequestMapping("/userList")
	@RequiresPermissions("user:list")
    @PermissionName("用户列表")
	public String userList(ModelMap modelMap,Page page)
	{
		//如果开始位置start小于0，则置0
		if(page.getStart()<0) {
			page.setStart(0);
		}
		
		//如果开始位置start大于总数，则置为最后一页开始位置
		if(page.getStart()>=page.getTotal()) {
			page.setStart(page.getLast());
		}
		
		//在查询所有数据之前调用pagehelper,参数为开始位置和每页个数
		PageHelper.offsetPage(page.getStart(),page.getCount());
		//查询
		List<User> users=userService.selectAllUser();
		//通过总数计算最后一页开始位置
		page.setTotal((int) new PageInfo<User>(users).getTotal());
		page.caculateLast(page.getTotal());
				
		//设置页码
		page.setUpIndex(page.getStart(), page.getCount());
						
		modelMap.addAttribute("users", users);
		return "back/user/userList";
	}
	
	//删除用户
	@RequestMapping("/deleteUser")
	@RequiresPermissions("user:delete")
    @PermissionName("用户删除")
	public String deleteUser(int id)
	{
		userService.deleteUser(id);
		return "redirect:/userList";
	}
	
}
