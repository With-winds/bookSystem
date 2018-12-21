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
<title>roleMember</title>

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

  <!-- 页面标题 -->
  <section class="content-header">
    <h1 align="center">角色成员</h1>
  </section>

  <!-- 页面主体 -->
  <section class="content">
  	<div class="row">
  	
  	  <div class="col-md-1"></div>
  	  
  	  <div class="col-md-10">
	   <!-- 盒子主体 -->
	   <div class="box-body">
	    <div class="box-group" id="accordion">
  	     <c:forEach items="${roles}" var="r" varStatus="st">
		  <!-- 折叠面板 -->
		  <div class="panel box box-primary">
			  <!-- 头部 -->
			  <div class="box-header with-border">
				<h4 class="box-title">
				  <a data-toggle="collapse" data-parent="#accordion" href="#collapse${st.index}" aria-expanded="true">
					${ r.identity }
				  </a>
				</h4>
				<a href="addUserToRole?id=${ r.id }&identity=${ r.identity }" class="btn btn-primary pull-right">添加</a>
			  </div>
			  <!-- 内容 -->
			  <div id="collapse${st.index}" class="panel-collapse collapse" aria-expanded="true">
				<div class="box-body">
				  <!-- 用户列表 -->
				  <table class="table table-hover table-striped">
					  <tr>
						<th>序号</th>
						<th>Username</th>
						<th>Name</th>
						<th>删除</th>
					  </tr>
					  <c:forEach items="${r.users}" var="u" varStatus="st">
						<tr>
						  <td>${ st.index+1 }</td>
						  <td>${ u.username }</td>
						  <td>${ u.name }</td>
						  <td>
						    <a href="deleteRoleMember?role_id=${ r.id }&user_id=${ u.id }" class="btn btn-danger">
							  <span class="glyphicon glyphicon-trash"></span>
							</a>
						  </td>
						</tr>
					  </c:forEach>
				  </table>
				</div>
			  </div>
	      </div>
		 </c:forEach>
		</div>
	   </div>
	   <!-- 页脚 -->
	   <div class="box-footer clearfix no-border">
		  <!-- 分页 -->
		  <ul class="pagination no-margin pull-right">
			<li><a href="?start=0">首  页</a></li>
			<li>
			  <a href="?start=${page.start-page.count}&last=${page.last}&total=${page.total}">
				&laquo;
			  </a>
			</li>
			<li class="active">
			  <span>${page.index} <span class="sr-only">(current)</span></span>
			 </li>
			 <li>
				<a href="?start=${page.start+page.count}&last=${page.last}&total=${page.total}">
				  &raquo;
				</a>
			 </li>
			 <li>
			   <a href="?start=${page.last}&last=${page.last}&total=${page.total}">末  页</a>
			 </li>
		  </ul>
		</div>
  	  </div>
  	  
  	  <div class="col-md-1"></div>  
	</div>
  </section>

<script type="text/javascript">
	//页面加载完成执行
    window.onload = function(){
		//让第一个折叠框显示
    	$('#collapse0').collapse('show');
    }
</script>

</body>
</html>