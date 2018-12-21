package com.wwz.bookSystem.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.wwz.bookSystem.pojo.Permission;
import com.wwz.bookSystem.pojo.Role;
import com.wwz.bookSystem.pojo.Role_Permission;
import com.wwz.bookSystem.pojo.User;
import com.wwz.bookSystem.pojo.User_Role;

/**
 * 对role数据表进行操作
 * @author ASUS
 *
 */
@Mapper
public interface RoleMapper {

	//查看角色列表
	public List<Role> selectAllRole();
	
	//添加角色
	public int addRole(Role role);
	
	//通过id删除角色
	public void deleteRole(int id);
	
	//修改角色
	public int updateRole(Role role);
	
	//通过用户ID查询角色的身份
	public List<String> selectIdentityById(int user_id);
	
	
	/**
	 * 下面三个方法实现角色管理模块
	 */
	//查询用户集合--用户的角色不为id对应的角色
	public List<User> selectUserNotEqId(int id);
	
	//将用户添加到角色
	public int addUserToRole(Map<String, Object> map);
	
	//将用户移除出角色
	public void deleteRoleMember(User_Role user_Role);
	
	
	/**
	 * 下面三个方法实现权限管理模块
	 */
	//查询权限集合--权限的角色不为id对应的角色
	public List<Permission> selectPermissionNotEqId(int id);
		
	//将权限添加到角色
	public int addPermissionToRole(Map<String, Object> map);
	
	//移除角色的权限
	public void deleteRolePermission(Role_Permission role_Permission);
	
}
