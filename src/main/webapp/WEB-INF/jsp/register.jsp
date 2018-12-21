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
<title>register</title>

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

<div class="register-box">

  <div class="register-logo">
    <a href="register"><b>Library</b></a>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">注册界面</p>

    <form action="register" method="post" id="registerForm">
        
	  <!-- 账号 -->
      <div class="form-group has-feedback">
      	<div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input type="text" name="username" class="form-control" placeholder="账号由6-20个字母或者数字组成">
        </div>
      </div>
	  
	  <!-- 密码 -->
      <div class="form-group has-feedback">
      	<div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
            <input type="password" name="password" class="form-control" placeholder="密码由6-20个字母、数字、点和下划线组成">
        </div>
      </div>
	  
	  <!-- 确认密码 -->
      <div class="form-group has-feedback">
      	<div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-log-in"></i></span>
            <input type="password" name="rePassword" class="form-control" placeholder="请确认密码">
        </div>
      </div>
	  
	  <!-- 姓名 -->
      <div class="form-group has-feedback">
      	<div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-certificate"></i></span>
            <input type="text" name="name" class="form-control" placeholder="请输入姓名">
        </div>
      </div>
	  
	  <!-- 电子邮箱 -->
      <div class="form-group has-feedback">
      	<div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
            <input type="text" name="email" class="form-control" placeholder="请输入电子邮箱">
        </div>
      </div>
	  
	  <!-- 手机号码 -->
      <div class="form-group has-feedback">
      	<div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
            <input type="text" name="phone" class="form-control" placeholder="请输入手机号码">
        </div>
      </div>
	  
	  <!-- 提交按钮 -->
	  <div class="form-group">		   
		<button type="submit" class="btn btn-primary btn-block">Sign up</button> 
	  </div>
	  
	  <!-- 页脚 -->
	  <div class="row">
	  
        <div class="col-xs-7">
        </div>
        <div class="col-xs-5">
          <p><a href="login">已有账号？去登录</a></p>
        </div>
        
      </div>
        
    </form>

  </div>

</div>
	
<script type="text/javascript">
$(document).ready(function() {
    
	//表单验证
    $('#registerForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {                        //输入框不同状态，显示图片的样式
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {                               //验证域
            	
            	//校验用户账号
                username: {                         //键名username和input的name属性值对应
                    message: 'The username is not valid',
                    threshold :  6 , //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
                    validators: {
                        notEmpty: {                 //非空提示
                            message: '用户名不能为空'
                        },
                        stringLength: {            //长度提示
                            min: 6,
                            max: 20,
                            message: '用户名长度必须在6到20之间'
                        },                         
                        regexp: {                  //正则表达式匹配
                            regexp: /^[a-zA-Z0-9]+$/,
                            message: '用户名由数字或者字母组成'
                        },
                        
                        //ajax验证。服务器返回{"valid",true}证明该账号可用，反之不可用并出现提示信息。
                        remote: {
                            url: 'register/checkUserNotExist',          //验证地址
                            message: '用户已存在',      //提示消息
                            delay :  2000,  //每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
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
                
                //校验用户密码
                password: {
                    message:'密码无效',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 20,
                            message: '密码长度必须在6到20之间'
                        },
                        regexp: {                  //正则表达式匹配
                        	regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: '密码只能由字母、数字、点和下划线组成'
                        },
                        different: {                //不能和用户名相同
                            field: 'username',     //需要进行比较的input name值
                            message: '不能和用户名相同'
                        }
                    }
                },
                
                //校验确认密码
                rePassword: {
                    message: '密码无效',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 20,
                            message: '密码长度必须在6到20之间'
                        },
                        identical: {              //密码和确认密码要相同
                            field: 'password',     //需要进行比较的input name值
                            message: '两次密码不一致'
                        }
                    }
                },
                
              	//校验用户的名字
                name: {
                    message: 'The name is not valid',
                    validators: {
                        notEmpty: {                 //非空提示
                            message: '姓名不能为空'
                        },
                        stringLength: {            //长度提示
                            min: 2,
                            max: 30,
                            message: '姓名长度必须在2到30之间'
                        }
                    }
                },
                
                //校验邮箱
                email: {
                    validators: {
                        notEmpty: {
                            message: '邮箱不能为空'
                        },
                        emailAddress: {
                            message: '请输入正确的邮件地址如：123@qq.com'
                        }
                    }
                },
                
                //校验手机号码
                phone: {
                    message: 'The phone is not valid',
                    validators: {
                        notEmpty: {
                            message: '手机号码不能为空'
                        },
                        stringLength: {
                            min: 11,
                            max: 11,
                            message: '请输入11位手机号码'
                        },
                        regexp: {
                            regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                            message: '请输入正确的手机号码'
                        }
                    }
                },
                
            }
        });
});
</script>
	
</body>
</html>