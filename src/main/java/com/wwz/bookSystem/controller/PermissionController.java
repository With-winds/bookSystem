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
import com.wwz.bookSystem.service.PermissionService;
import com.wwz.bookSystem.util.Page;

/**
 * 对权限表permission进行操作的控制器
 * @author ASUS
 *
 */
@Controller
public class PermissionController {
	
	@Autowired
	PermissionService permissionService;
	
	/**
	 * 跳转到权限列表界面
	 * 查看所有权限
	 */
	@RequestMapping(value="/permissionList",method=RequestMethod.GET)
	@RequiresPermissions("permission:list")
    @PermissionName("权限列表")
	public String permissionList(ModelMap modelMap,Page page)
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
		List<Permission> permissions=permissionService.selectAllPermission();
		
		//通过总数计算最后一页开始位置
		page.setTotal((int) new PageInfo<Permission>(permissions).getTotal());
		page.caculateLast(page.getTotal());
				
		//设置页码
		page.setUpIndex(page.getStart(), page.getCount());
				
		modelMap.addAttribute("permissions",permissions);
		return "back/permission/permissionList";
	}
	
	//添加权限
	@RequestMapping("/addPermission")
	@RequiresPermissions("permission:add")
    @PermissionName("权限添加")
	public String addPermission(Permission permission) throws Exception
	{
		permissionService.addPermission(permission);
		return "redirect:/permissionList";
	}
	
	//删除权限
	@RequestMapping("/deletePermission")
	@RequiresPermissions("permission:delete")
    @PermissionName("权限删除")
	public String deletePermission(int id)
	{
		permissionService.deletePermission(id);
		return "redirect:/permissionList";
	}
	
	//修改权限
	@RequestMapping("/updatePermission")
	@RequiresPermissions("permission:update")
    @PermissionName("权限修改")
	public String updatePermission(Permission permission) throws Exception
	{
		permissionService.updatePermission(permission);
		return "redirect:/permissionList";
	}

}
