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
<title>bookList</title>

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
    <h1 align="center">图书列表</h1>
  </section>

  <section class="content">
  	<div class="row">
  	
  	  <div class="col-md-1"></div>
  	  
  	  <div class="col-md-10">
  	   <div class="box">
  	    <div class="box-header">
		  <h3 class="box-title">图书列表</h3>
		
		  <!-- 搜索框 -->
		  <div class="box-tools">
			<div class="input-group input-group-sm" style="width: 150px;">
			  <input type="text" name="table_search" class="form-control pull-right" placeholder="搜索">
		
			  <div class="input-group-btn">
				<a href="#" class="btn btn-default"><i class="fa fa-search"></i></a>
			  </div>
			</div>
		  </div>
		  
		  </div>
  	  
		  <div class="box-body no-padding">
			<!-- 图书的表格 -->
		    <table class="table table-hover">
			  <tr>
				<th>序号</th>
				<th>名称</th>
				<th>作者</th>
				<th>查看</th>
				<th>删除</th>
			  </tr>
			  <c:forEach items="${books}" var="b" varStatus="st">
				<tr>
					<td>${ (page.index-1)*page.count+st.index+1}</td>
					<td>${ b.name }</td>
					<td>${ b.author }</td>
					<td>
					  <a href="seeBook?id=${ b.id }" class="btn btn-info">
					    <span class="glyphicon glyphicon-eye-open"></span>
					  </a>
					</td>
					<td>
					  <a href="deleteBook?id=${ b.id }" class="btn btn-danger">
					    <span class="glyphicon glyphicon-trash"></span>
					  </a>
					</td>
				</tr>
			  </c:forEach>
			  
		    </table>
		    <br>
		    <!-- 表格底部 -->
		    <div class="box-footer clearfix">
			  <div class="pagination no-margin pull-left">
			    <!-- 添加图书 -->
				<a href="addBook" class="btn btn-primary btn-block">
					添加图书
				</a>
			  </div>	      
				<c:choose>
				   <c:when test="${ tagId != 0 }">
					  <!-- 标签ID不为空时的分页 -->
					  <ul class="pagination no-margin pull-right">
						<li><a href="?start=0&id=${tagId}">首  页</a></li>
						<li>
						  <a href="?start=${page.start-page.count}&last=${page.last}&total=${page.total}&id=${tagId}">
							&laquo;
						  </a>
						</li>
						<li class="active">
						  <span>${page.index} <span class="sr-only">(current)</span></span>
						 </li>
						 <li>
							<a href="?start=${page.start+page.count}&last=${page.last}&total=${page.total}&id=${tagId}">
							  &raquo;
							</a>
						 </li>
						 <li>
						   <a href="?start=${page.last}&last=${page.last}&total=${page.total}&id=${tagId}">末  页</a>
						 </li>
					  </ul>
				   </c:when>
				   <c:otherwise>
					  <!-- 标签ID为空时的分页 -->
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
				   </c:otherwise>
				</c:choose>
		    </div>
		  </div>
		</div>
  	  </div>
  	  
  	  <div class="col-md-1"></div>
	  
	</div>
	
  </section>

</body>
</html>