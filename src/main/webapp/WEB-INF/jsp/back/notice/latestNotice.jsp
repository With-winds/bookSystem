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
<title>latestNotice</title>

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
    <h1 align="center">最新公告</h1>
  </section>

  <section class="content">
  	<div class="row">
  	
  	  <div class="col-md-1"></div>
  	  
  	  <div class="col-md-10">
  	    <div class="box box-info">
		  <!-- 修改公告表单 -->
		  <form action="updateNotice" method="post" id="updateNoticeForm" role="form">
			<!-- 盒子头部 -->
			<div class="box-header with-border">
			  <h3 class="box-title">修改公告</h3>
			</div>
			
			<!-- 盒子主体 -->
			<div class="box-body">
			
				<!-- 公告ID -->
			    <div class="form-group">
				  <input type="hidden" name="id" value="${ notice.id }" class="form-control">
			    </div>
				<!-- 标题 -->
				<div class="form-group">
				  <label>标题</label>
				  <input type="text" name="title" class="form-control" value="${ notice.title }" placeholder="输入标题 ...">
				</div>      
		
				<!-- 内容 -->
				<div class="form-group">
				  <label>内容</label>
				  <textarea name="content" class="form-control" rows="5" placeholder="输入内容 ...">${ notice.content }</textarea>
				</div>
				
			</div>
			<div class="box-footer">
				<a href="noticeList" class="btn btn-default">公告列表</a>
				<button type="submit" class="btn btn-info pull-right">修改公告</button>
		    </div>
		  </form>
		
		</div>
  	  </div>
  	  
  	  <div class="col-md-1"></div>
	  
	</div>
	
  </section>
  
<script type="text/javascript">
$(document).ready(function() {
    /**
     * 表单校验
     * */
    $('#updateNoticeForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {                        /*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {                               /*验证*/
                title: {                         /*键名username和input name值对应*/
                    message: 'The username is not valid',
                    validators: {
                        notEmpty: {                 /*非空提示*/
                            message: '标题不能为空'
                        },
                        stringLength: {            /*长度提示*/
                            min: 2,
                            max: 30,
                            message: '标题长度必须在2到30之间'
                        }

                    }
                },
                content: {
                    message:'公告内容不正确',
                    validators: {
                        notEmpty: {
                            message: '公告内容不能为空'
                        }
                    }
                }
            }
        });
});
</script>
</body>
</html>