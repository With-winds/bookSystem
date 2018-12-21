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
<title>permissionList</title>

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
    <h1 align="center">权限列表</h1>
  </section>

  <section class="content">
  	<div class="row">
  	
  	  <div class="col-md-1"></div>
  	  
  	  <div class="col-md-10">
		  <div class="box-body no-padding">
			<!-- 展示用户的表格 -->
		    <table class="table table-striped table-hover">
			  <tr>
				<th>序号</th>
				<th>权限</th>
				<th>表达式</th>
				<th>修改</th>
				<th>删除</th>
			  </tr>
			  <c:forEach items="${permissions}" var="p" varStatus="st">
				<tr>
					<td>${ (page.index-1)*page.count+st.index+1}</td>
					<td>${ p.name }</td>
					<td>${ p.resource }</td>
					<td>
					  <a onclick="showUpdatePermissionModal('${ p.id }','${ p.name }','${ p.resource }')" class="btn btn-info">
					    <span class="glyphicon glyphicon-wrench"></span>
					  </a>
					</td>
					<td>
					  <a href="deletePermission?id=${ p.id }" class="btn btn-danger">
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
			  <div class="pagination no-margin pull-left">
			    <!-- 点击该按钮触发模态框 -->
				<button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#addPermissionModal">
				 <i class="fa fa-plus"></i> 添加权限
				</button>
			  </div>	      
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
  
  
	
	<!-- 添加学生的模态框 -->
	<div class="modal fade" id="addPermissionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
		<!-- 添加权限表单 -->
	     <form action="addPermission" class="form-horizontal">
		  <!-- 头部 -->
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加权限</h4>
	      </div>
	      <div class="modal-body">
	        <div class="row">
	          
	              <div class="form-group">
	              	<label for="inputEmail3" class="col-sm-2 control-label">权限</label>
	              	<div class="col-sm-9">
	  				  <input type="text" name="name" class="form-control" placeholder="请输入权限名称">
	  				</div>
	  			  </div>
	  			  
	  			  <div class="form-group">
	              	<label for="inputEmail3" class="col-sm-2 control-label">表达式</label>
	              	<div class="col-sm-9">
	  				  <input type="text" name="resource" class="form-control" placeholder="输入样式：user:list">
	  				</div>
	  			  </div>
	          
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary">Add</button>
	      </div>
	     </form>
	    </div>
	  </div>
	</div>
	
	<!-- 修改权限的模态框 -->
	<div class="modal fade" id="updatePermissionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
		<!-- 修改权限表单 -->
	     <form action="updatePermission" class="form-horizontal">
		  <!-- 头部 -->
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">修改权限</h4>
	      </div>
	      <div class="modal-body">
	        <div class="row">
			
				  <div class="form-group">
	              	<div class="col-sm-9">
	  				  <input type="hidden" id="modalPermissionId" name="id" class="form-control">
	  				</div>
	  			  </div>
	          
	              <div class="form-group">
	              	<label for="inputEmail3" class="col-sm-2 control-label">权限</label>
	              	<div class="col-sm-9">
	  				  <input type="text" id="modalName" name="name" class="form-control" placeholder="请输入权限名称">
	  				</div>
	  			  </div>
	  			  
	  			  <div class="form-group">
	              	<label for="inputEmail3" class="col-sm-2 control-label">表达式</label>
	              	<div class="col-sm-9">
	  				  <input type="text" id="modalResource" name="resource" class="form-control" placeholder="输入样式：user:list">
	  				</div>
	  			  </div>
	          
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary">Update</button>
	      </div>
	     </form>
	    </div>
	  </div>
	</div>

<script>

//展示修改权限的模态框
function showUpdatePermissionModal(id,name,resource) {
	//传值
    $("#modalPermissionId").val(id);
    $("#modalName").val(name);
    $("#modalResource").val(resource);
    $("#updatePermissionModal").modal("show");            //显示模态框
}

</script>

</body>
</html>