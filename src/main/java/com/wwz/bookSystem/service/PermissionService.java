package com.wwz.bookSystem.service;

import java.util.List;

import com.wwz.bookSystem.pojo.Permission;

/**
 * 业务逻辑层,与PermissionMapper对应
 * @author ASUS
 *
 */
public interface PermissionService {

	//查看权限列表
	public List<Permission> selectAllPermission();
	
	//添加权限
	public void addPermission(Permission permission) throws Exception;
	
	//删除权限
	public void deletePermission(int id);
	
	//修改权限
	public void updatePermission(Permission permission) throws Exception;
	
	//通过用户ID查询所有权限表达式
	public List<String> selectResourceById(int user_id);
	
}
