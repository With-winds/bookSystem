package com.wwz.bookSystem.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wwz.bookSystem.annotation.PermissionName;
import com.wwz.bookSystem.pojo.Permission;
import com.wwz.bookSystem.pojo.Role;
import com.wwz.bookSystem.pojo.Role_Permission;
import com.wwz.bookSystem.pojo.User;
import com.wwz.bookSystem.pojo.User_Role;
import com.wwz.bookSystem.service.RoleService;
import com.wwz.bookSystem.util.Page;

/**
 * 对角色表role进行操作的控制器
 * @author ASUS
 *
 */
@Controller
public class RoleController {
	
	@Autowired
	RoleService roleService;
	
	/**
	 *跳转到角色列表界面 
	*查询所有角色
	 */
	@RequestMapping(value="/roleList",method=RequestMethod.GET)
	@RequiresPermissions("role:list")
    @PermissionName("角色列表")
	public String roleList(ModelMap modelMap,Page page)
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
		List<Role> roles=roleService.selectAllRole();
		//通过总数计算最后一页开始位置
		page.setTotal((int) new PageInfo<Role>(roles).getTotal());
		page.caculateLast(page.getTotal());
				
		//设置页码
		page.setUpIndex(page.getStart(), page.getCount());
						
		modelMap.addAttribute("roles", roles);
		return "back/role/roleList";
	}
	
	//添加角色
	@RequestMapping("/addRole")
	@RequiresPermissions("role:add")
    @PermissionName("角色添加")
	public String addRole(Role role) throws Exception
	{
		roleService.addRole(role);
		return "redirect:/roleList";
	}
	
	//删除角色
	@RequestMapping("/deleteRole")
	@RequiresPermissions("role:delete")
    @PermissionName("角色删除")
	public String deleteRole(int id)
	{
		roleService.deleteRole(id);
		return "redirect:/roleList";
	}
	
	//修改角色
	@RequestMapping("/updateRole")
	@RequiresPermissions("role:update")
    @PermissionName("角色修改")
	public String updateRole(Role role) throws Exception
	{
		roleService.updateRole(role);
		return "redirect:/roleList";
	}
	
	/**
	 * 跳转到角色成员界面
	 * 查询角色对应的用户集合
	 */
	@RequestMapping("/roleMember")
	public String roleMember(ModelMap modelMap,Page page)
	{
		page.setCount(3);
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
		List<Role> roles=roleService.selectRoleAndUser();
		//通过总数计算最后一页开始位置
		page.setTotal((int) new PageInfo<Role>(roles).getTotal());
		page.caculateLast(page.getTotal());
				
		//设置页码
		page.setUpIndex(page.getStart(), page.getCount());
		
		modelMap.addAttribute("roles", roles);
		return "back/role/roleMember";
	}
	
	//跳转到添加用户到角色的界面
	@RequestMapping(value="/addUserToRole",method=RequestMethod.GET)
	@RequiresPermissions("role:give")
    @PermissionName("角色赋予")
	public String toAddUserToRole(Role role,ModelMap modelMap,Page page)
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
		List<User> users=roleService.selectUserNotEqId(role.getId());
		//通过总数计算最后一页开始位置
		page.setTotal((int) new PageInfo<User>(users).getTotal());
		page.caculateLast(page.getTotal());
				
		//设置页码
		page.setUpIndex(page.getStart(), page.getCount());
		modelMap.addAttribute("users", users);
		modelMap.addAttribute("role", role);
		return "back/role/addUserToRole";
	}
	
	//添加用户到角色
	@RequestMapping(value="/addUserToRole",method=RequestMethod.POST)
	@RequiresPermissions("role:give")
    @PermissionName("角色赋予")
	public String addUserToRole(int[] user_ids,int role_id) throws Exception
	{
		roleService.addUserToRole(user_ids, role_id);
		return "redirect:/roleMember";
	}
	
	//将用户移除出角色
	@RequestMapping("/deleteRoleMember")
	@RequiresPermissions("role:remove")
    @PermissionName("角色移除")
	public String deleteRoleMember(User_Role user_Role)
	{
		roleService.deleteRoleMember(user_Role);
		return "redirect:/roleMember";
	}
	
	
	/**
	 * 跳转到角色权限界面
	 * 查询角色对应的权限集合
	 */
	@RequestMapping("/rolePermission")
	public String rolePermission(ModelMap modelMap,Page page)
	{
		page.setCount(3);
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
		List<Role> roles=roleService.selectRoleAndPermission();
		//通过总数计算最后一页开始位置
		page.setTotal((int) new PageInfo<Role>(roles).getTotal());
		page.caculateLast(page.getTotal());
				
		//设置页码
		page.setUpIndex(page.getStart(), page.getCount());
		modelMap.addAttribute("roles", roles);
		return "back/permission/rolePermission";
	}
	
	//跳转到添加权限到角色的界面
	@RequestMapping(value="/addPermissionToRole",method=RequestMethod.GET)
	@RequiresPermissions("permission:give")
    @PermissionName("权限授予")
	public String toAddPermissionToRole(Role role,ModelMap modelMap,Page page)
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
		List<Permission> permissions=roleService.selectPermissionNotEqId(role.getId());
		//通过总数计算最后一页开始位置
		page.setTotal((int) new PageInfo<Permission>(permissions).getTotal());
		page.caculateLast(page.getTotal());
				
		//设置页码
		page.setUpIndex(page.getStart(), page.getCount());
		modelMap.addAttribute("permissions", permissions);
		modelMap.addAttribute("role", role);
		return "back/permission/addPermissionToRole";
	}
	
	//添加权限到角色
	@RequestMapping(value="/addPermissionToRole",method=RequestMethod.POST)
	@RequiresPermissions("permission:give")
    @PermissionName("权限授予")
	public String addPermissionToRole(int[] permission_ids,int role_id) throws Exception
	{
		roleService.addPermissionToRole(permission_ids, role_id);
		return "redirect:/rolePermission";
	}
	
	//移除角色的权限
	@RequestMapping("/deleteRolePermission")
	@RequiresPermissions("permission:remove")
    @PermissionName("权限移除")
	public String deleteRolePermission(Role_Permission role_Permission)
	{
		roleService.deleteRolePermission(role_Permission);
		return "redirect:/rolePermission";
	}
	
}
