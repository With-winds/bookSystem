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
<title>Exception</title>

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
      <h1>
        404 Error Page
      </h1>
    </section>

    <section class="content">
      <div class="error-page">
        <h2 class="headline text-yellow"> 404</h2>

        <div class="error-content">
          <h3><i class="fa fa-warning text-yellow"></i> Oops! Page not found.</h3>

          <p>
            We could not find the page you were looking for.
            Meanwhile, you may <a href="welcome">return to dashboard</a>
          </p>

        </div>
      </div>
      <div>
      	<p>${ exception }</p>
      </div>
    </section>

</body>
</html>