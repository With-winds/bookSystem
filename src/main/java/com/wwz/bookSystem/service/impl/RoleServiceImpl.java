package com.wwz.bookSystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wwz.bookSystem.mapper.PermissionMapper;
import com.wwz.bookSystem.mapper.RoleMapper;
import com.wwz.bookSystem.mapper.UserMapper;
import com.wwz.bookSystem.pojo.Permission;
import com.wwz.bookSystem.pojo.Role;
import com.wwz.bookSystem.pojo.Role_Permission;
import com.wwz.bookSystem.pojo.User;
import com.wwz.bookSystem.pojo.User_Role;
import com.wwz.bookSystem.service.RoleService;

/**
 * 业务逻辑层，与RoleMapper对应的实现类
 * @author ASUS
 *
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	RoleMapper roleMapper;
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	PermissionMapper permissionMapper;

	//查看角色列表
	@Override
	public List<Role> selectAllRole() {
		return roleMapper.selectAllRole();
	}

	//添加角色
	@Override
	public void addRole(Role role) throws Exception {
		int result=roleMapper.addRole(role);
		if (result==0) {
			throw new Exception("修改用户信息失败");
		}
	}

	//通过id删除角色
	@Override
	public void deleteRole(int id) {
		roleMapper.deleteRole(id);
	}

	//修改角色
	@Override
	public void updateRole(Role role) throws Exception {
		int result=roleMapper.updateRole(role);
		if (result==0) {
			throw new Exception("修改用户信息失败");
		}
	}
	
	//通过用户ID查询角色的身份
	@Override
	public List<String> selectIdentityById(int user_id) {
		return roleMapper.selectIdentityById(user_id);
	}

	
	/**
	 * 下面四个方法实现角色管理模块
	 */
	//查询所有角色对应的用户集合
	@Override
	public List<Role> selectRoleAndUser() {
		List<Role> roles=roleMapper.selectAllRole();
		for (Role role : roles) {
			List<User> users=userMapper.selectUserByRoleId(role.getId());
			role.setUsers(users);
		}
		return roles;
	}

	//查询用户集合--用户的角色不为role_id对应的角色
	@Override
	public List<User> selectUserNotEqId(int role_id) {
		return roleMapper.selectUserNotEqId(role_id);
	}

	//将用户添加到角色
	@Override
	public void addUserToRole(int[] user_ids,int role_id) throws Exception 
	{
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("role_id", role_id);
		map.put("userIds", user_ids);
		int result=roleMapper.addUserToRole(map);
		if (result==0) {
			throw new Exception("将用户添加到角色失败");
		}
	}
	
	//将用户移除出角色
	@Override
	public void deleteRoleMember(User_Role user_Role) {
		roleMapper.deleteRoleMember(user_Role);
	}
	

	/**
	 * 下面四个方法实现权限管理模块
	 */
	//查询角色对应的权限集合
	@Override
	public List<Role> selectRoleAndPermission() {
		List<Role> roles=roleMapper.selectAllRole();
		for (Role role : roles) {
			List<Permission> permissions=permissionMapper.selectPermissionByRoleId(role.getId());
			role.setPermissions(permissions);
		}
		return roles;
	}

	//查询权限集合--权限的角色不为id对应的角色
	@Override
	public List<Permission> selectPermissionNotEqId(int permission_id) {
		return roleMapper.selectPermissionNotEqId(permission_id);
	}

	//将权限添加到角色
	@Override
	public void addPermissionToRole(int[] permission_ids,int role_id) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("role_id", role_id);
		map.put("permissionIds", permission_ids);
		int result=roleMapper.addPermissionToRole(map);
		if (result==0) {
			throw new Exception("将权限添加到角色失败");
		}
	}

	//移除角色的权限
	@Override
	public void deleteRolePermission(Role_Permission role_Permission) {
		roleMapper.deleteRolePermission(role_Permission);
	}

}
