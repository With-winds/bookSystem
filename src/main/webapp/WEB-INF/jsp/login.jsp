<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>login</title>

<!-- 引入css文件 -->
<link href="<%= basePath %>resources/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= basePath %>resources/bower_components/bootstrap/dist/css/bootstrapValidator.min.css" rel="stylesheet">
<link href="<%= basePath %>resources/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="<%= basePath %>resources/bower_components/Ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="<%= basePath %>resources/dist/css/AdminLTE.min.css" rel="stylesheet">
<link href="<%= basePath %>resources/dist/css/skins/skin-blue.min.css" rel="stylesheet">

<!-- 引入js文件 -->
<script src="<%= basePath %>resources/bower_components/jquery/dist/jquery.min.js"></script>
<script src="<%= basePath %>resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<%= basePath %>resources/bower_components/bootstrap/dist/js/bootstrapValidator.min.js"></script>
<script src="<%= basePath %>resources/dist/js/adminlte.min.js"></script>
<!-- Google Font -->
<link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="hold-transition login-page">

<div class="login-box">

  <div class="login-logo">
    <a href="login"><b>Library</b></a>
  </div>
  
  <div class="login-box-body">
    <p class="login-box-msg">登录界面</p>
	
	<!-- 登录表单 -->
    <form action="login" method="post" id="loginForm">
	
	  <!-- 账号 -->
      <div class="form-group has-feedback">
      	<div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input type="text" name="username" id="username" class="form-control" placeholder="Username">
        </div>
      </div>
	  
	  <!-- 密码 -->
      <div class="form-group has-feedback">
        <div class="input-group">
           <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
           <input type="password" name="password" id="password" class="form-control" placeholder="Password">
        </div>
      </div>
	  
	  <!-- 提交按钮 -->
	  <div class="form-group">		   
		<button type="submit" class="btn btn-primary btn-block">Sign in</button> 
	  </div>
      
      <!-- 页脚 -->
	  <div class="row">
	  
        <div class="col-xs-7">
        </div>
        <div class="col-xs-5">
          <p><a href="register">注册</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">忘记密码</a></p>
        </div>
        
      </div>
      
    </form>

  </div>
</div>

<script type="text/javascript">
$(document).ready(function() {
    /**
     * 下面是进行插件初始化
     * 你只需传入相应的键值对
     * */
    $('#loginForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {                        /*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {                               /*验证*/
                username: {                         /*键名username和input name值对应*/
                    message: 'The username is not valid',
                    threshold :  6 , //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
                    validators: {
                        notEmpty: {                 /*非空提示*/
                            message: '用户名不能为空'
                        },
                        stringLength: {            /*长度提示*/
                            min: 6,
                            max: 20,
                            message: '用户名长度必须在6到20之间'
                        },
                        //ajax验证。服务器返回{"valid",false}证明用户不存在，出现提示信息
                        remote: {
                            url: 'login/checkUserExist',          //验证地址
                            message: '账号不存在',      //提示消息
                            delay :  1000,  //每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                            type: 'GET'           //请求方式
                            /**自定义提交数据，默认值提交当前input value
                             *  data: function(validator) {
                                  return {
                                      password: $('[name="passwordNameAttributeInYourForm"]').val(),
                                      whatever: $('[name="whateverNameAttributeInYourForm"]').val()
                                  };
                               }
                             */
                        }
                    }
                },
                password: {
                    message:'密码无效',
                    threshold :  6 , //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 20,
                            message: '用户名长度必须在6到20之间'
                        },
                        
                        //ajax验证。服务器返回{"valid",false}证明用户密码不匹配，出现提示信息
                        remote: {
                            url: 'login/checkPasswordMatch',          //验证地址
                            message: '密码不正确',      //提示消息
                            delay :  1000,  //每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                            type: 'GET',           //请求方式
                            data: function(validator) {
                               return {
                                   username: $('[name="username"]').val(),
                                   password: $('[name="password"]').val()
                               };
                            }
                          
                        }
                    }
                }
            }
        });
});
</script>
	
</body>
</html>