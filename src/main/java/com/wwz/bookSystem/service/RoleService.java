package com.wwz.bookSystem.service;

import java.util.List;
import java.util.Map;

import com.wwz.bookSystem.pojo.Permission;
import com.wwz.bookSystem.pojo.Role;
import com.wwz.bookSystem.pojo.Role_Permission;
import com.wwz.bookSystem.pojo.User;
import com.wwz.bookSystem.pojo.User_Role;

/**
 * 业务逻辑层,与RoleMapper对应
 * @author ASUS
 *
 */
public interface RoleService {
	
	//查看角色列表
	public List<Role> selectAllRole();
		
	//添加角色
	public void addRole(Role role) throws Exception;
		
	//通过id删除角色
	public void deleteRole(int id);
		
	//修改角色
	public void updateRole(Role role) throws Exception;
	
	//通过用户ID查询角色的身份
	public List<String> selectIdentityById(int user_id);

	
	/**
	 * 下面四个方法实现角色管理模块
	 */
	//查询所有角色对应的用户集合
	public List<Role> selectRoleAndUser();
	
	//查询用户集合--用户的角色不为role_id对应的角色
	public List<User> selectUserNotEqId(int role_id);
	
	//将用户添加到角色
	public void addUserToRole(int[] user_ids,int role_id) throws Exception;
	
	//将用户移除出角色
	public void deleteRoleMember(User_Role user_Role);
	
	
	/**
	 * 下面四个方法实现权限管理模块
	 */
	//查询角色对应的权限集合
	public List<Role> selectRoleAndPermission();
		
	//查询权限集合--权限的角色不为id对应的角色
	public List<Permission> selectPermissionNotEqId(int permission_id);
		
	//将权限添加到角色
	public void addPermissionToRole(int[] permission_ids,int role_id) throws Exception;
	
	//移除角色的权限
	public void deleteRolePermission(Role_Permission role_Permission);

}
