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
<title>addBook</title>

<!-- 引入css文件 -->
<link href="<%= basePath %>resources/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<%= basePath %>resources/bower_components/bootstrap/dist/css/bootstrapValidator.min.css" rel="stylesheet">
<link href="<%= basePath %>resources/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="<%= basePath %>resources/bower_components/select2/dist/css/select2.min.css" rel="stylesheet">
<link href="<%= basePath %>resources/bower_components/Ionicons/css/ionicons.min.css" rel="stylesheet">
<link href="<%= basePath %>resources/dist/css/AdminLTE.min.css" rel="stylesheet">
<link href="<%= basePath %>resources/dist/css/skins/skin-blue.min.css" rel="stylesheet">

<!-- 引入js文件 -->
<script src="<%= basePath %>resources/bower_components/jquery/dist/jquery.min.js"></script>
<script src="<%= basePath %>resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<%= basePath %>resources/bower_components/select2/dist/js/select2.full.min.js"></script>
<script src="<%= basePath %>resources/bower_components/bootstrap/dist/js/bootstrapValidator.min.js"></script>
<script src="<%= basePath %>resources/dist/js/adminlte.min.js"></script>
<!-- Google Font -->
<link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body>

  <section class="content-header">
    <h1 align="center">添加图书</h1>
  </section>

  <section class="content">
  	<div class="row">
  	
  	  <div class="col-md-2"></div>
  	  
  	  <div class="col-md-8">
	  
	   <div class="box box-info">
		<div class="box-header with-border">
		  <h3 class="box-title">填写书籍信息</h3>
		</div>
		
		<form class="form-horizontal" action="addBook" id="addBookForm" method="post" enctype="multipart/form-data">
		  <div class="box-body">
		  
		    <!-- 图书名称 -->
			<div class="form-group">
			  <label class="col-sm-2 control-label">书名</label>
			  <div class="col-sm-9">
				<input type="text" name="name" class="form-control" placeholder="请输入书名....">
			  </div>
			</div>
			
			<!-- 图书作者 -->
			<div class="form-group">
			  <label class="col-sm-2 control-label">作者</label>
			  <div class="col-sm-9">
				<input type="text" name="author" class="form-control" placeholder="请输入作者....">
			  </div>
			</div>
			
			<!-- 出版社 -->
			<div class="form-group">
			  <label class="col-sm-2 control-label">出版社</label>
			  <div class="col-sm-9">
				<input type="text" name="publisher" class="form-control" placeholder="请输入出版社....">
			  </div>
			</div>
			
			<!-- 出版年 -->
			<div class="form-group">
			  <label class="col-sm-2 control-label">出版年</label>
			  <div class="col-sm-9">
				<input type="text" name="pubdate" class="form-control" placeholder="请输入出版年....">
			  </div>
			</div>
			
			<!-- 图书ISBN -->
			<div class="form-group">
			  <label class="col-sm-2 control-label">ISBN</label>
			  <div class="col-sm-9">
				<input type="text" name="isbn" class="form-control" placeholder="请输入ISBN....">
			  </div>
			</div>
			
			<!-- 库存量 -->
			<div class="form-group">
			  <label class="col-sm-2 control-label">库存</label>
			  <div class="col-sm-9">
				<input type="text" name="stock" class="form-control" placeholder="请输入库存....">
			  </div>
			</div>
			
			<!-- 封面图片 -->
			<div class="form-group">
			  <label class="col-sm-2 control-label">封面图片</label>
			  <div class="col-sm-9">
				<input type="file" name="pictureFile">
			  </div>
			</div>
			
			<!-- 内容简介 -->
			<div class="form-group">
			  <label class="col-sm-2 control-label">内容简介</label>
			  <div class="col-sm-9">
				<textarea name="summary" class="form-control" rows="5" placeholder="输入内容摘要 ..."></textarea>
			  </div>
			</div>
			
			<!-- 标签 -->
			<div class="form-group">
			  <label class="col-sm-2 control-label">标签</label>
			  <div class="col-sm-9">
				<select name="tagIds" class="form-control select2 select2-hidden-accessible" multiple data-placeholder="选择标签" style="width: 100%;" tabindex="-1" aria-hidden="true">
				  <c:forEach items="${tags}" var="t" varStatus="st">
					<option value="${t.id}">${t.name}</option>
				  </c:forEach>
				</select>
				
			  </div>
			</div>
			
		  </div>
		  <div class="box-footer">
			<button type="submit" class="btn btn-info pull-right">添加</button>
		  </div>
		</form>
	   </div> 
		
  	  </div>
  	  
  	  <div class="col-md-2"></div>
	  
	</div>
	
  </section>

<script type="text/javascript">

$(function () {
    //Initialize Select2 Elements
    $('.select2').select2();
})

$(document).ready(function() {
    /**
     * 下面是进行插件初始化
     * 你只需传入相应的键值对
     * */
    $('#addBookForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {                        /*输入框不同状态，显示图片的样式*/
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {                               /*验证*/
            	name: {                         /*键名username和input name值对应*/
                    message: '书籍名称不正确',
                    validators: {
                        notEmpty: {                 /*非空提示*/
                            message: '书籍名称不能为空'
                        }
                        
                    }
                },
                author: {                         /*键名username和input name值对应*/
                    message: '输入书籍作者不正确',
                    validators: {
                        notEmpty: {                 /*非空提示*/
                            message: '书籍作者不能为空'
                        }
                        
                    }
                },
                publisher: {                         /*键名username和input name值对应*/
                    message: '输入出版社不正确',
                    validators: {
                        notEmpty: {                 /*非空提示*/
                            message: '出版社不能为空'
                        }
                        
                    }
                },
                pubdate: {
                    message:'输入的出版年不正确',
                    validators: {
                    	notEmpty: {                 /*非空提示*/
                            message: '出版年不能为空'
                        },
                    	date: {
                    		format:'YYYY-MM-DD',
                            message: '出版年格式不正确'
                        }
                    }
                },
                isbn: {
                    message:'输入的ISBN不正确',
                    validators: {
                        notEmpty: {
                            message: 'ISBN不能为空'
                        },
                        digits : {
                            message : '只能输入数字'
                        },
                        stringLength: {            //长度提示
                            min: 13,
                            max: 13,
                            message: 'ISBN由13个数字组成'
                        }
                    }
                },
                stock: {
                    message:'输入的库存量不正确',
                    validators: {
                        notEmpty: {
                            message: '库存量不能为空'
                        },
                        digits : {
                            message : '库存量必须是正整数'
                        },
                        greaterThan: {
                            value : 1,
                            message : '库存量最小输入1'
                        },
                        lessThan: {
                            value : 100,
                            message : '库存量最大输入100'
                        }
                    }
                }
            }
        });
});
</script>

</body>
</html>