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
<title>resetPassword</title>

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
    <h1 align="center">重置密码</h1>
  </section>

  <section class="content">
  	<div class="row">
  	
  	  <div class="col-md-1"></div>
  	  
  	  <div class="col-md-10">
		  <div class="box-body no-padding">
			<!-- 重置密码的表格 -->
		    <table class="table table-striped table-hover">
			  <tr>
				<th>序号</th>
				<th>账号</th>
				<th>姓名</th>
				<th>重置</th>
			  </tr>
			  <c:forEach items="${users}" var="u" varStatus="st">
				<tr>
					<td>${ (page.index-1)*page.count+st.index+1}</td>
					<td>${ u.username }</td>
					<td>${ u.name }</td>
					<td>
					  <a onclick="showResetPassword('${u.id}','${u.username}')" class="btn btn-warning">
					    <span class="glyphicon glyphicon-refresh"></span>
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
  
<!-- 重置密码模态框 -->
<div class="modal fade" id="showResetPasswordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog">
	<div class="modal-content">
	 <!-- 重置密码表单 -->
	 <form action="resetPassword" id="resetPasswordForm" class="form-horizontal" method="post">
	  <!-- 头部 -->
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		  <span aria-hidden="true">×</span></button>
		<h4 class="modal-title">重置密码</h4>
	  </div>
	  <!-- 主体 -->
	  <div class="modal-body">
        <div class="row">
		  <!-- ID -->
		  <div class="form-group">
           	<div class="col-sm-9">
			  <input type="hidden" id="id" name="id" class="form-control">
			</div>
		  </div>
		  
		  <!-- username -->
		  <div class="form-group">
           	<div class="col-sm-9">
			  <input type="hidden" id="username" name="username" class="form-control">
			</div>
		  </div>
       
       	   <!-- 密码 -->
           <div class="form-group">
           	<label for="inputEmail3" class="col-sm-2 control-label">密码</label>
           	<div class="col-sm-9">
			  <input type="text" name="password" class="form-control" placeholder="请重置密码...">
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

//重置密码的模态框
function showResetPassword(id,username) {
	$("#id").val(id);
	$("#username").val(username);
    $("#showResetPasswordModal").modal("show");            //显示模态框
}

$(document).ready(function() {
    /**
     * 下面是进行插件初始化
     * 你只需传入相应的键值对
     * */
    $('#resetPasswordForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {                        /*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {                               /*验证*/
                password: {
                    message:'密码无效',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 20,
                            message: '用户名长度必须在6到20之间'
                        }
                    }
                }
            }
        });
});

</script>
 

</body>
</html>