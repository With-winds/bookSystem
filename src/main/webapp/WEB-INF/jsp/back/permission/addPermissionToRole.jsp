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
<title>addPermissionToRole</title>

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
    <h1 align="center">权限授予</h1>
  </section>

  <section class="content">
  	<div class="row">
  	
  	  <div class="col-md-1"></div>
  	  
  	  <div class="col-md-10">
		<div class="box box-primary">
		  <!-- 盒子头部 -->
		  <div class="box-header ui-sortable-handle">
		    <i class="glyphicon glyphicon-arrow-right"></i>
		    <h3 class="box-title">${ role.identity }</h3>
		
			<div class="box-tools pull-right">
			  <ul class="pagination pagination-sm inline">
				<li><a href="?start=${page.start-page.count}&last=${page.last}&total=${page.total}&id=${role.id}&identity=${role.identity}">«</a></li>
				<li><span>${page.index} <span class="sr-only">(current)</span></span></li>
				<li><a href="?start=${page.start+page.count}&last=${page.last}&total=${page.total}&id=${role.id}&identity=${role.identity}">»</a></li>
			  </ul>
		    </div>
		  </div>
		  
		  <!-- 添加权限到角色表单 -->
		  <form class="form-horizontal" action="addPermissionToRole" method="post">
		    <!-- 角色ID -->
		    <div class="form-group">
			  <input type="hidden" name="role_id" value="${ role.id }" class="form-control">
		    </div>
		  <!-- 盒子主体 -->
		  <div class="box-body">
		   <table class="table table-hover">
		      <tr class="active">
		        <th></th>
		        <th>权限</th>
		        <th>表达式</th>
		      </tr>
		    <c:forEach items="${permissions}" var="p" varStatus="st">
			  <tr class="active">
			    
			    <td>
					<!-- 图标 -->
				    <span class="handle ui-sortable-handle">
						<i class="fa fa-ellipsis-v"></i>
						<i class="fa fa-ellipsis-v"></i>
				    </span>
				    <!-- 复选框 -->
				    <input type="checkbox" name="permission_ids"  value="${p.id}">
			    </td>
			 
			    <td class="text">${ p.name }</td>
			    <td class="text">${ p.resource }</td>
			  </tr>
			</c:forEach>
		   </table>  
		  </div>
		  
		  <div class="box-footer clearfix no-border">
		    <button type="submit" class="btn btn-default pull-right">Add</button>
		  </div>
		
		  </form>
		  
		</div>
  	  </div>
  	  
  	  <div class="col-md-1"></div>
	  
	</div>
	
  </section>

</body>
</html>