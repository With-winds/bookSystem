package com.wwz.bookSystem.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

/**
 * 自定义的过滤器
 * 实现shiro登录成功后跳到指定的URL
 * @author ASUS
 *
 */
public class LoginFormAuthenticationFilter extends FormAuthenticationFilter {

	//重写该方法清掉之前的URL，防止登录成功后跳到那个URL
	@Override
	protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request,
			ServletResponse response) throws Exception {
		//清理原先的URL
		WebUtils.getAndClearSavedRequest(request);
		//登录成功后跳转到/home
		WebUtils.redirectToSavedRequest(request, response, "/home");
		return false;
		
	}
	
}
