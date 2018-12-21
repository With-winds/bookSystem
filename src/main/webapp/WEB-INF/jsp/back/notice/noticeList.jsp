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
<title>noticeList</title>

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
    <h1 align="center">历史公告</h1>
  </section>

  <section class="content">
  	<div class="row">
  	
  	  <div class="col-md-1"></div>
  	  
  	  <div class="col-md-10">
		  <div class="box-body no-padding">
			<!-- 展示公告的表格 -->
		    <table class="table table-striped table-hover">
			  <tr>
				<th>序号</th>
				<th>标题</th>
				<th>发布时间</th>
				<th>查看</th>
				<th>删除</th>
			  </tr>
			  <c:forEach items="${notices}" var="n" varStatus="st">
				<tr>
					<td>${ (page.index-1)*page.count+st.index+1}</td>
					<td>${ n.title }</td>
					<td>${ n.releaseTime }</td>
					<td>
					  <a onclick="seeNotice('${n.title}','${n.content}','${n.releaseTime}')" class="btn btn-info">
					    <span class="glyphicon glyphicon-eye-open"></span>
					  </a>
					</td>
					<td>
					  <a href="deleteNotice?id=${ n.id }" class="btn btn-danger">
					    <span class="glyphicon glyphicon-trash"></span>
					  </a>
					</td>
				</tr>
			  </c:forEach>
			  <tr>
			    <td colspan="5">
				  
				</td>
			  </tr>
		    </table>
		    <br>
		    <!-- 表格底部 -->
		    <div class="row">
			     
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
  	  </div>
  	  
  	  <div class="col-md-1"></div>
	  
	</div>
	
  </section>

<!-- 查看通知模态框 -->
<div class="modal fade" id="seeNoticeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog">
	<div class="modal-content">
	  <!-- 公告标题 -->
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		  <span aria-hidden="true">×</span></button>
		<h4 class="modal-title" id="title"></h4>
	  </div>
	  <!-- 公告内容 -->
	  <div class="modal-body">
		<p id="content"></p>
	  </div>
	  <div class="modal-footer">
		<p class="pull-left">发布时间：</p><p id="releaseTime" class="pull-left"></p>
		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	  </div>
	</div>
  </div>
</div> 

<script>

//查看公告的模态框
function seeNotice(title,content,releaseTime) {
	$("#title").text(title);
	$("#content").text(content);
	$("#releaseTime").text(releaseTime);
    $("#seeNoticeModal").modal("show");            //显示模态框
}

</script>
 

</body>
</html>