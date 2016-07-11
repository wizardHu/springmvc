<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title>Tables - Ace Admin</title>

<meta name="description" content="Static &amp; Dynamic Tables" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="./assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="./testdatatable/jquery.dataTables.min.css">
<link rel="stylesheet" href="./assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="./assets/css/ace-fonts.css" />
<link rel="stylesheet" href="./assets/css/ace.min.css"
	id="main-ace-style" />
<link rel="stylesheet" href="./assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="./assets/css/ace-rtl.min.css" />
<script src="./assets/js/ace-extra.min.js"></script>
<script type="text/javascript" src="./js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="./js/jquery.dataTables.js"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>
<script type="text/javascript"
	src="./testdatatable/jquery.dataTables.min.js"></script>



<style>
.row:after {
	display: inline;
	height: 100%;
}

.dataTables_paginate {
	text-align: center;
}

table {
	text-align: center;
}

th {
	text-align: center;
}
</style>
</head>

<body class="no-skin">
	<!-- #section:basics/navbar.layout -->
	<%@ include file="navbar.jsp"%>

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<%@ include file="sidebar.jsp"%>
		<div class="main-content">
			<!-- #section:basics/content.breadcrumbs -->
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>

				<!-- 路径导航 -->
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
					</li>

					<li><a href="#">Tables</a></li>
					<li class="active">Simple &amp; Dynamic</li>
				</ul>
				<!-- /.breadcrumb -->

				<!-- #section:basics/content.searchbox 搜索框 -->
				<div class="nav-search" id="nav-search">
					<form class="form-search">
						<span class="input-icon"> <input type="text"
							placeholder="Search .." class="nav-search-input"
							id="nav-search-input" autocomplete="off" /> <i
							class="ace-icon fa fa-search nav-search-icon"></i>
						</span>
					</form>
				</div>
				<!-- /.nav-search -->

				<!-- /section:basics/content.searchbox -->
			</div>

			<!-- /section:basics/content.breadcrumbs -->
			<div class="page-content">
				<!-- #section:settings.box 右边设置按钮 -->
				<%@ include file="settingsbox.jsp"%>
				<!-- /section:settings.box -->
				<div class="page-content-area">
					<div class="page-header">
						<h1>
							Tables <small> <i
								class="ace-icon fa fa-angle-double-right"></i> Static &amp;
								Dynamic Tables
							</small>
						</h1>
					</div>
					<!-- /.page-header -->
					<!-- =============================begin======================================================-->


					<div class="page-header">
						<h1>
							<small> <span class="tools pull-centent"> <a
									href="./skiptojsp/add" class="btn btn-sm btn-success">新建账号</a>
							</span>
							</small>
						</h1>
					</div>
					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
							<div class="row">
								<div class="col-xs-12">
									<table id="sample-table-1"
										class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>id</th>
												<th>name</th>
												<th>phone</th>
											</tr>
										</thead>
									</table>
								</div>
								<!-- /.span -->
							</div>
							<!-- /.row -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.page-content-area -->
				</div>
				<!-- /.page-content -->
			</div>
			<!-- /.main-content -->

			<div class="footer">
				<div class="footer-inner">
					<!-- #section:basics/footer -->
					<div class="footer-content">
						<span class="bigger-120"> <span class="blue bolder">Ace</span>
							Application &copy; 2013-2014
						</span> &nbsp; &nbsp; <span class="action-buttons"> <a href="#">
								<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
						</a> <a href="#"> <i
								class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
						</a> <a href="#"> <i
								class="ace-icon fa fa-rss-square orange bigger-150"></i>
						</a>
						</span>
					</div>

					<!-- /section:basics/footer -->
				</div>
			</div>

			<a href="#" id="btn-scroll-up"
				class="btn-scroll-up btn btn-sm btn-inverse"> <i
				class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div>
		<!-- /.main-container -->

		<!-- basic scripts -->

		<script>
			$(document).ready(function() {
				$('#sample-table-1').DataTable({
					"processing" : true,
					"serverSide" : true,
					"ajax" : "/getall"
				});
			});
		</script>
</body>
</html>
