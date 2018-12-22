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
<title>后台管理</title>

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


<body class="hold-transition skin-blue sidebar-mini">

<!-- 整个页面的div -->
<div class="wrapper">

  <!-- 头部 -->
  <header class="main-header">

    <!-- Logo -->
    <a href="home" class="logo">
      <!-- 侧边栏迷你50X50像素迷你标志 -->
      <span class="logo-mini"><b>Library</b></span>
      <!-- 常规状态标志和移动设备标志 -->
      <span class="logo-lg"><b>Library</b></span>
    </a>

    <!-- 头部导航栏 -->
    <nav class="navbar navbar-static-top" role="navigation">
    
      <!-- 侧边栏切换按钮-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
			<li class="pii-right"><a href="register">register</a></li>
            <!-- 用户信息 -->
			<li class="dropdown user user-menu">
				<!-- 显示在导航栏 -->
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				  <img src="<%= basePath %>resources/dist/img/avatar5.png" class="user-image" alt="用户图像">
				  <span class="hidden-xs">${ sessionScope.user.name }</span>
				</a>
				
				<!-- 弹出用户信息 -->
				<ul class="dropdown-menu">
				  <!-- 用户头像 -->
				  <li class="user-header">
					<img src="<%= basePath %>resources/dist/img/avatar5.png" class="img-circle" alt="用户图像">
			
					<p>
					  ${ sessionScope.user.name }
					  <small>注册于${ sessionScope.user.regDate }</small>
					</p>
				  </li>
				  
				  <!-- 底部-->
				  <li class="user-footer">
					<div class="pull-left">
					  <a href="seeInfo?id=${ sessionScope.user.id }" target="menuFrame" class="btn btn-default btn-flat">资料</a>
					</div>
					<div class="pull-right">
					  <a href="logout" class="btn btn-default btn-flat">退出</a>
					</div>
				  </li>
				</ul>
			</li>
			
        </ul>
      </div>
    </nav>
  </header>

  
  <!-- 侧边栏 -->
  <aside class="main-sidebar">

    <section class="sidebar">
    
    <!-- 用户信息栏 -->
    <div class="user-panel">
		<div class="pull-left image">
		  <img src="<%= basePath %>resources/dist/img/avatar5.png" class="img-circle" alt="用户图像">
		</div>
		<div class="pull-left info">
		  <p><a href="seeInfo?id=${ sessionScope.user.id }" target="menuFrame">${ sessionScope.user.name }</a></p>
		  <a href="seeInfo?id=${ sessionScope.user.id }" target="menuFrame"><i class="fa fa-circle text-success"></i> 在线</a>
		</div>
	</div>
	<br>

      <!-- 侧边栏菜单 -->
      <ul class="sidebar-menu" data-widget="tree">
      
        <li class="header">导航栏</li>
        
        <li class="active"><a href="home"><i class="glyphicon glyphicon-home"></i> <span>首页</span></a></li>
      	
        <!-- 图书管理 -->  
        <li class="treeview">
          <a href="#"><i class="glyphicon glyphicon-book"></i> <span>图书管理</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
          	<li>
              <a href="addBook" target="menuFrame">
              	<i class="fa fa-circle-o"></i>添加图书
              </a>
            </li>
            <li>
              <a href="bookList" target="menuFrame">
              	<i class="fa fa-circle-o"></i>图书列表
              </a>
            </li>
            <li>
              <a href="tagList" target="menuFrame">
              	<i class="fa fa-circle-o"></i>图书类型
              </a>
            </li>
            
          </ul>
        </li>
        
        <!-- 用户管理 -->  
        <li class="treeview">
          <a href="#"><i class="glyphicon glyphicon-user"></i> <span>用户管理</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li>
              <a href="userList" target="menuFrame">
              	<i class="fa fa-circle-o"></i>用户列表
              </a>
            </li>
            <li>
              <a href="resetPassword" target="menuFrame">
              	<i class="fa fa-circle-o"></i>重置密码
              </a>
            </li>
          </ul>
        </li>
        
        <!-- 公告管理 -->  
        <li class="treeview">
          <a href="#"><i class="glyphicon glyphicon-volume-up"></i> <span>公告管理</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li>
              <a href="releaseNotice" target="menuFrame">
              	<i class="fa fa-circle-o"></i>发布公告
              </a>
            </li>
            <li>
              <a href="noticeList" target="menuFrame">
              	<i class="fa fa-circle-o"></i>历史公告
              </a>
            </li>
            <li>
              <a href="latestNotice" target="menuFrame">
              	<i class="fa fa-circle-o"></i>最新公告
              </a>
            </li>
          </ul>
        </li>
        
        <!-- 角色管理 -->  
        <li class="treeview">
          <a href="#"><i class="glyphicon glyphicon-knight"></i> <span>角色管理</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li>
              <a href="roleList" target="menuFrame">
              	<i class="fa fa-circle-o"></i>角色列表
              </a>
            </li>
            <li>
              <a href="roleMember" target="menuFrame">
              	<i class="fa fa-circle-o"></i>角色成员
              </a>
            </li>
          </ul>
        </li>
        
        <!-- 权限管理 -->  
        <li class="treeview">
          <a href="#"><i class="glyphicon glyphicon-pawn"></i> <span>权限管理</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li>
              <a href="permissionList" target="menuFrame">
              	<i class="fa fa-circle-o"></i>权限列表
              </a>
            </li>
            <li>
              <a href="rolePermission" target="menuFrame">
              	<i class="fa fa-circle-o"></i>授予权限
              </a>
            </li>
          </ul>
        </li>
        
        <!-- 借阅记录 -->
        <li><a href="borrowList" target="menuFrame"><i class="glyphicon glyphicon-edit"></i> <span>借阅记录</span></a></li>
        
        <!-- 退出操作 -->
        <li><a href="logout"><i class="glyphicon glyphicon-log-out"></i> <span>退出登录</span></a></li>
        
      </ul>
    </section>
  </aside>

  <!-- 内容主体 -->
  <div class="content-wrapper">
  
    <section class="content-header">
      <h1>
        Library
        <small>welcome to you</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- 主体 -->
    <section class="content container-fluid">

      <iframe id="menuFrame" name="menuFrame" src="welcome" style="overflow:visible;"
                scrolling="auto"
                frameborder="no" height="100%" width="100%">
	  </iframe>

    </section>
    
  </div>

  <!-- 页脚 -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
      Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2018 <a href="#">Library</a>.</strong> All rights reserved.
  </footer>

  
</div>



<script>
    $("#menuFrame").height(window.innerHeight-180);
</script>

</body>
</html>