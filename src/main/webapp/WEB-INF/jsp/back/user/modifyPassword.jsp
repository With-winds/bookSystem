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
<title>modifyPassword</title>

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

<body>

  <section class="content-header">
    <h1 align="center">修改密码</h1>
  </section>

  <section class="content">
  	<div class="row">
  	
  	  <div class="col-md-4"></div>
  	  
  	  <div class="col-md-4">
		<!-- 修改密码 -->
		<form class="form-horizontal" action="modifyPassword" method="post" id="modifyPasswordForm">
		  <!-- 账号 -->
		  <div class="form-group has-feedback">
			<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				<input type="text" name="username" class="form-control" value="${ user.username }" disabled>
			</div>
		  </div>
		  
		  <!-- 密码 -->
		  <div class="form-group has-feedback">
			<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
				<input type="password" name="password" class="form-control" placeholder="请输入原密码">
			</div>
		  </div>
				
		  <!-- 新密码 -->
		  <div class="form-group has-feedback">
			<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
				<input type="password" name="newPassword" class="form-control" placeholder="请输入新密码">
			</div>
		  </div>
		  
		  <!-- 确认新密码 -->
		  <div class="form-group has-feedback">
			<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-log-in"></i></span>
				<input type="password" name="rePassword" class="form-control" placeholder="请确认新密码">
			</div>
		  </div>
		  
		  <div class="form-group">
		    <div class="pull-left">
			  <a href="modifyInfo?id=${ user.id }" class="btn btn-default">Back</a>
			</div>
			<div class="pull-right">
			  <button type="submit" class="btn btn-default">Update</button>
			</div>
		  </div>
		</form>  	    
  	  </div>
  	  
  	  <div class="col-md-4"></div>
	  
	</div>
	
  </section>


<script type="text/javascript">
$(document).ready(function() {
    
	//表单验证
    $('#modifyPasswordForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {                        //输入框不同状态，显示图片的样式
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {                               //验证域
            	
                //校验用户密码
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
                            message: '密码长度必须在6到20之间'
                        },
                        regexp: {                  //正则表达式匹配
                        	regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: '密码只能由字母、数字、点和下划线组成'
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
                },
                
                //校验用户新密码
                newPassword: {
                    message:'新密码无效',
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
                            field: 'newPassword',     //需要进行比较的input name值
                            message: '两次密码不一致'
                        }
                    }
                },
                
            }
        });
});
</script>

</body>
</html>