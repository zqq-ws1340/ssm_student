<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="description" content="particles.js is a lightweight JavaScript library for creating particles.">
    <meta name="author" content="Vincent Garreau" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

	<title>学生成绩管理</title>
	<!-- 引入css样式文件 -->

    <link rel="stylesheet" media="screen" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/reset.css"/>

	<!-- Bootstrap Core CSS -->
	<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
	<!-- MetisMenu CSS -->
	<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
	<!-- DataTables CSS -->
	<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
	<!-- Custom CSS -->
	<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
	<!-- Custom Fonts -->
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="particles-js">
<div id="wrapper">
  <!-- 导航栏部分 -->
  <nav class="navbar navbar-default navbar-static-top" role="navigation"
		 style="margin-bottom: 0">
	<div class="navbar-header">
		<a class="navbar-brand" href="<%=basePath%>customer/list.action">学生成绩管理系统</a>
	</div>
	<!-- 导航栏右侧图标部分 -->
	<ul class="nav navbar-top-links navbar-right">
		<!-- 消息通知 end -->
		<!-- 用户信息和系统设置 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#"><i class="fa fa-user fa-fw"></i>
				               用户：${USER_SESSION.user_name}
				    </a>
				</li>
				<li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
				<li class="divider"></li>
				<li>
					<a href="${pageContext.request.contextPath }/logout.action">
					<i class="fa fa-sign-out fa-fw"></i>退出登录
					</a>
				</li>
			</ul> 
		</li>
		<!-- 用户信息和系统设置结束 -->
	</ul>
	<!-- 左侧显示列表部分 start-->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li>
				    <a href="${pageContext.request.contextPath }/student/list.action" class="active">
				      <i class="fa fa-edit fa-fw"></i> 学生管理
				    </a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 左侧显示列表部分 end--> 
  </nav>
    <!-- 客户列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">学生管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get" 
				      action="${pageContext.request.contextPath }/student/list.action">
					<div class="form-group">
						<label for="customerName">学生姓名</label>
						<input type="text" class="form-control" id="customerName" 
						                   value="${studName }" name="studName" />
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
                    <div style="float: right"><a href="#" class="btn btn-primary" data-toggle="modal"
                            data-target="#newCustomerDialog" onclick="clearCustomer()">新建</a></div>

				</form>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">学生信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>学号</th>
								<th>姓名</th>
								<th>课程名称</th>
								<th>平时成绩</th>
								<th>期末成绩</th>
								<th>总评成绩</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody style="text-align: center">
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td>${row.id}</td>
									<td>${row.stundent_no}</td>
									<td>${row.student_name}</td>
									<td>${row.course_name}</td>
									<td>${row.ordinary_scores}</td>
									<td>${row.end_scores}</td>
								    <td>${row.total_scores}</td>
									<td>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick= "editCustomer(${row.id})">修改</a>
										<a href="#" class="btn btn-danger btn-xs" onclick="deleteStudent(${row.id})">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<itheima:page url="${pageContext.request.contextPath }/student/list.action" />
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<!-- 客户列表查询部分  end-->
</div>
<!-- 创建客户模态框 -->
<div class="modal fade" id="newCustomerDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建学生信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_customer_form">
						<div class="form-group">
							<label for="new_customerName" class="col-sm-2 control-label">
								ID
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_customerName" placeholder="ID" name="id" />
							</div>
					</div>
					<div class="form-group">
						<label for="new_customerFrom" class="col-sm-2 control-label">
							学号
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_customerFrom" placeholder="学号" name="stundent_no" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_custIndustry" class="col-sm-2 control-label">
							课程编号
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_custIndustry" placeholder="课程编号" name="course_no" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_custLevel" class="col-sm-2 control-label">
							平时成绩
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_custLevel" placeholder="平时成绩" name="ordinary_scores" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_linkMan" class="col-sm-2 control-label">
							期末成绩
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_linkMan" placeholder="期末成绩" name="end_scores" />
						</div>
					</div>
					<div class="form-group">
						<label for="new_phone" class="col-sm-2 control-label">
							总评成绩
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_phone" placeholder="总评成绩" name="total_scores" />
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createCustomer()">创建客户</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改客户模态框 -->
<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改学生信息</h4>
            </div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_customer_form">
                    <div class="form-group">
                        <label for="edit_stu_id" class="col-sm-2 control-label">ID</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_stu_id" placeholder="ID" name="id" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_studentxh" class="col-sm-2 control-label">学号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_studentxh" placeholder="学号" name="stundent_no" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_coursebh" class="col-sm-2 control-label">课程编号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_coursebh" placeholder="课程编号" name="course_no" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_ordinary_scores" class="col-sm-2 control-label">平时成绩</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_ordinary_scores" placeholder="平时成绩" name="ordinary_scores" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_end_scores" class="col-sm-2 control-label">期末成绩</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_end_scores" placeholder="期末成绩" name="end_scores" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_total_scores" class="col-sm-2 control-label">总评成绩</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_total_scores" placeholder="总评成绩" name="total_scores" />
                        </div>
                    </div>
                </form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateCustomer()">保存修改</button>
			</div>
		</div>
	</div>
</div>
<!-- 引入js文件 -->

<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">
//清空新建客户窗口中的数据
	function clearCustomer() {
	    $("#new_customerName").val("");
	    $("#new_customerFrom").val("")
	    $("#new_custIndustry").val("")
	    $("#new_custLevel").val("")
	    $("#new_linkMan").val("");
	    $("#new_phone").val("");
	    $("#new_mobile").val("");
	    $("#new_zipcode").val("");
	    $("#new_address").val("");
	}
	// 创建客户
	function createCustomer() {
	$.post("<%=basePath%>student/create.action",
	$("#new_customer_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("客户创建成功！");
	            window.location.reload();
	        }else{
	            alert("客户创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的客户信息
	function editCustomer(ids) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>student/getStudentById.action",
	        data:{"id":ids},
	        success:function(data) {
	            $("#edit_stu_id").val(data.id);
	            $("#edit_studentxh").val(data.stundent_no);
	            $("#edit_coursebh").val(data.course_no);
	            $("#edit_ordinary_scores").val(data.ordinary_scores);
	            $("#edit_end_scores").val(data.end_scores);
	            $("#edit_total_scores").val(data.total_scores);
	        }
	    });
	}
    // 执行修改客户操作
	function updateCustomer() {
		$.post("<%=basePath%>/student/update.action",$("#edit_customer_form").serialize(),function(data){
			if(data =="OK"){
				alert("学生信息更新成功！");
				window.location.reload();
			}else{
				alert("学生信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除客户
	function deleteStudent(id) {
	    if(confirm('确实要删除该学生信息吗?')) {
	$.post("<%=basePath%>student/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("学生信息删除成功！");
	                window.location.reload();
	            }else{
	                alert("学生信息删除客户失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>