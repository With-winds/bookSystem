package com.wwz.bookSystem.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wwz.bookSystem.pojo.Permission;

/**
 * 对用户表permission进行操作
 * @author ASUS
 *
 */
@Mapper
public interface PermissionMapper {
	
	//查看权限列表
	public List<Permission> selectAllPermission();
	
	//添加权限
	public int addPermission(Permission permission);
	
	//删除权限
	public void deletePermission(int id);
	
	//修改权限
	public int updatePermission(Permission permission);
	
	//通过用户ID查询所有权限表达式
	public List<String> selectResourceById(int user_id);
	
	//通过角色ID查询权限集合
	public List<Permission> selectPermissionByRoleId(int role_id);
	
}
