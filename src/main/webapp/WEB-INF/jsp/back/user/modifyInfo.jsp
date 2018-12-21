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
<title>welcome</title>

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
    <h1 align="center">修改信息</h1>
  </section>

  <section class="content">
  	<div class="row">
  	
  	  <div class="col-md-4"></div>
  	  
  	  <div class="col-md-4">
		<!-- 修改密码 -->
		<form class="form-horizontal" action="modifyUser" method="post" id="modifyUserForm">
		
		  <!-- ID -->
		  <div class="form-group has-feedback">
			<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-tree-deciduous"></i></span>
				<input type="text" name="id" class="form-control" value="${ user.id }" disabled>
			</div>
		  </div>
		  
		  <!-- 账号 -->
		  <div class="form-group has-feedback">
			<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				<input type="text" name="username" class="form-control" value="${ user.username }" disabled>
			</div>
		  </div>
		  
		  <!-- 姓名 -->
		  <div class="form-group has-feedback">
			<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-certificate"></i></span>
				<input type="text" name="name" class="form-control" value="${ user.name }">
			</div>
		  </div>
				
		  <!-- 电子邮箱 -->
		  <div class="form-group has-feedback">
			<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
				<input type="text" name="email" class="form-control" value="${ user.email }">
			</div>
		  </div>
		  
		  <!-- 手机号码 -->
		  <div class="form-group has-feedback">
			<div class="input-group">
				<span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
				<input type="text" name="phone" class="form-control" value="${ sessionScope.user.phone }">
			</div>
		  </div>
		  
		  <div class="form-group">
		    <div class="pull-left">
			  <a href="modifyPassword?id=${ user.id }" class="btn btn-default">修改密码</a>
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
    $('#modifyUserForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {                        //输入框不同状态，显示图片的样式
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {                               //验证域
            	
                
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