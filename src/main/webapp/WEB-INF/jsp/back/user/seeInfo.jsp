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
<title>seeInfo</title>

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
    <h1 align="center">用户信息</h1>
  </section>

  <section class="content">
  	<div class="row">
  	
  	  <div class="col-md-4"></div>
  	  
  	  <div class="col-md-4">
		<div class="box box-primary">
			<div class="box-body box-profile">
			  <img class="profile-user-img img-responsive img-circle" src="<%= basePath %>resources/dist/img/avatar5.png" alt="用户资料 picture">
		
			  <h3 class="profile-username text-center">${ user.name }</h3>
		
			  <p class="text-muted text-center">
			    <c:forEach items="${user.roles}" var="r">
				  ${ r.identity } 
				</c:forEach>
			  </p>
		
			  <ul class="list-group list-group-unbordered">
				<li class="list-group-item">
				  <b><i class="glyphicon glyphicon-user"></i></b> 
				  <a class="pull-right">${ user.username }</a>
				</li>
				<li class="list-group-item">
				  <b><i class="glyphicon glyphicon-envelope"></i></b> 
				  <a class="pull-right">${ user.email }</a>
				</li>
				<li class="list-group-item">
				  <b><i class="glyphicon glyphicon-phone"></i></b> 
				  <a class="pull-right">${ user.phone }</a>
				</li>
				<li class="list-group-item">
				  <b><i class="glyphicon glyphicon-time"></i></b> 
				  <a class="pull-right">${ user.regDate }</a>
				</li>
			  </ul>
		
			  <a href="modifyInfo?id=${ user.id }" class="btn btn-primary btn-block"><b>修改信息</b></a>
			</div>
		</div>
  	  </div>
  	  
  	  <div class="col-md-4"></div>
	  
	</div>
	
  </section>

</body>
</html>