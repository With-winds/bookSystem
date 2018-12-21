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
<title>roleList</title>

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
    <h1 align="center">角色列表</h1>
  </section>

  <section class="content">
  	<div class="row">
  	
  	  <div class="col-md-1"></div>
  	  
  	  <div class="col-md-10">
		  <div class="box-body no-padding">
			<!-- 展示用户的表格 -->
		    <table class="table table-striped table-hover table-bordered">
			  <tr>
				<th>序号</th>
				<th>角色</th>
				<th>修改</th>
				<th>删除</th>
			  </tr>
			  <c:forEach items="${roles}" var="r" varStatus="st">
				<tr>
					<td>${ (page.index-1)*page.count+st.index+1}</td>
					<td>${ r.identity }</td>
					<td>
					  <a onclick="showUpdateRoleModal('${ r.id }','${ r.identity }')" class="btn btn-info">
					    <span class="glyphicon glyphicon-wrench"></span>
					  </a>
					</td>
					<td>
					  <a href="deleteRole?id=${ r.id }" class="btn btn-danger">
					    <span class="glyphicon glyphicon-trash"></span>
					  </a>
					</td>
				</tr>
			  </c:forEach>
			  <tr>
			    <td colspan="4">
				</td>
			  </tr>
		    </table>
		    <br>
		    <!-- 表格底部 -->
		    <div class="row">
			  <div class="pagination no-margin pull-left">
			    <!-- 点击该按钮触发模态框 -->
				<button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#addRoleModal">
					添加角色
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
	
	<!-- 添加角色的模态框 -->
	<div class="modal fade" id="addRoleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
		<!-- 添加角色表单 -->
	     <form action="addRole" class="form-horizontal">
		  <!-- 头部 -->
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加角色</h4>
	      </div>
	      <div class="modal-body">
	        <div class="row">
	          
	              <div class="form-group">
	              	<label for="inputEmail3" class="col-sm-2 control-label">身份</label>
	              	<div class="col-sm-9">
	  				  <input type="text" name="identity" class="form-control" placeholder="请输入角色名称">
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
	
	<!-- 修改角色的模态框 -->
	<div class="modal fade" id="updateRoleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
		<!-- 修改角色表单 -->
	     <form action="updateRole" class="form-horizontal">
		  <!-- 头部 -->
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">修改角色</h4>
	      </div>
	      <div class="modal-body">
	        <div class="row">
			
				  <div class="form-group">
	              	<div class="col-sm-9">
	  				  <input type="hidden" id="modalRoleId" name="id" class="form-control">
	  				</div>
	  			  </div>
	          
	              <div class="form-group">
	              	<label for="inputEmail3" class="col-sm-2 control-label">身份</label>
	              	<div class="col-sm-9">
	  				  <input type="text" id="modalIdentity" name="identity" class="form-control" placeholder="请输入角色名称">
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

//展示修改角色的模态框
function showUpdateRoleModal(id,identity) {
	//传值
    $("#modalRoleId").val(id);
    $("#modalIdentity").val(identity);
    $("#updateRoleModal").modal("show");            //显示模态框
}

</script>

</body>
</html>