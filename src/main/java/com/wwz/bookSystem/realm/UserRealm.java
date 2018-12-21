package com.wwz.bookSystem.realm;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.wwz.bookSystem.pojo.User;
import com.wwz.bookSystem.service.PermissionService;
import com.wwz.bookSystem.service.RoleService;
import com.wwz.bookSystem.service.UserService;

/**
 * 自定义的realm，用于登录和授权
 * @author ASUS
 *
 */
public class UserRealm extends AuthorizingRealm {
	
	@Autowired
	UserService userService;
	
	@Autowired
	RoleService roleService;
	
	@Autowired
	PermissionService permissionService;

	//授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		//测试是否进入授权--添加缓存
		System.out.println("进入授权");
		//获取用户
		User user=(User) principals.getPrimaryPrincipal();
		//roles为用户角色集合，permissions为用户权限集合
		List<String> permissions=new ArrayList<String>();
		List<String> roles=new ArrayList<String>();
		
		//获取角色和权限
		roles=roleService.selectIdentityById(user.getId());
		permissions=permissionService.selectResourceById(user.getId());
		
		SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
		info.addStringPermissions(permissions);
		info.addRoles(roles);
		return info;
	}

	//登录认证
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String username=(String) token.getPrincipal();
		User user=userService.selectByUsername(username);
		if(user==null){
			return null;
		}
		SimpleAuthenticationInfo info=new SimpleAuthenticationInfo(user,user.getPassword(),ByteSource.Util.bytes(user.getUsername()),getName());
		return info;
	}

}
