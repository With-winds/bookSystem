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
<meta name="referrer" content="no-referrer">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>bookDetail</title>

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
    
  </section>

  <section class="content">
  	<div class="row">
  	
  	  <div class="col-md-3"></div>
  	  
  	  <div class="col-md-6">
  	    <div>
  	      <h3>${ book.name }</h3><br>
  	      <div class="row">
  	        <div class="col-md-3">
  	          <img src="${ book.imagePath }" class="img-responsive" alt="${ book.name }">
  	        </div>
  	        <div class="col-md-9">
  	          <p>作者：${ book.author }</p>
  	          <p>出版社：${ book.publisher }</p>
  	          <p>出版年：${ book.pubdate }</p>
  	          <p>借阅次数：${ book.borrowNum }</p>
  	          <p>库存：${ book.stock }</p>
  	          <p>ISBN：${ book.isbn }</p>
  	          
  	        </div>
  	      </div>
  	      <br>
  	      <!-- 内容简介 -->
  	      <div class="row">
  	        <div class="col-md-12">
  	        	<h4 class="text-success">内容简介······</h4>
  	        	<p>${ book.summary }</p>
  	        </div>
  	      </div>
  	      <br>
  	      <!-- 标签 -->
  	      <div class="row">
  	        <div class="col-md-12">
  	        	<h4 class="text-success">标签······</h4>
  	        	<c:forEach items="${book.tags}" var="t">
  	        	  <a href="seeTag?id=${ t.id }">
  	        		<span class="label label-default">${ t.name }</span>&nbsp;
  	        	  </a>
  	        	</c:forEach>
  	        </div>
  	      </div>
  	      <br>
  	    </div>
  	  </div>
  	  
  	  <div class="col-md-3"></div>
	  
	</div>
	
  </section>
</body>
</html>