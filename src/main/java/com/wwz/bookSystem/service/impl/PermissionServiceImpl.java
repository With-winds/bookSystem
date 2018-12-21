package com.wwz.bookSystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wwz.bookSystem.mapper.PermissionMapper;
import com.wwz.bookSystem.pojo.Permission;
import com.wwz.bookSystem.service.PermissionService;

/**
 * 业务逻辑层，与RoleMapper对应的实现类
 * @author ASUS
 *
 */
@Service("permissionService")
public class PermissionServiceImpl implements PermissionService {
	
	@Autowired
	PermissionMapper permissionMapper;

	//列出权限列表
	@Override
	public List<Permission> selectAllPermission() {
		return permissionMapper.selectAllPermission();
	}

	//添加权限
	@Override
	public void addPermission(Permission permission) throws Exception {
		int result=permissionMapper.addPermission(permission);
		if (result==0) {
			throw new Exception("修改用户信息失败");
		}
	}

	//删除权限
	@Override
	public void deletePermission(int id) {
		permissionMapper.deletePermission(id);
	}

	//修改权限
	@Override
	public void updatePermission(Permission permission) throws Exception {
		int result=permissionMapper.updatePermission(permission);
		if (result==0) {
			throw new Exception("修改用户信息失败");
		}
	}

	//通过用户ID查询所有权限表达式
	@Override
	public List<String> selectResourceById(int user_id) {
		return permissionMapper.selectResourceById(user_id);
	}

}
