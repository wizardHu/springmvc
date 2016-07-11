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

<link rel="stylesheet" href="./assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="./assets/css/font-awesome.min.css" />
<link rel="stylesheet" href="./assets/css/ace-fonts.css" />
<link rel="stylesheet" href="./assets/css/ace.min.css"
	id="main-ace-style" />
<link rel="stylesheet" href="./assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="./assets/css/bootstrapValidator.css" />
<link rel="stylesheet" href="./assets/css/ace-rtl.min.css" />
<script type="text/javascript" src="./js/jquery-3.0.0.min.js"></script>
<script src="./assets/js/ace-extra.min.js"></script>
<script src="./js/bootstrap.js"></script>
<script src="./js/bootstrapValidator.js"></script>

</head>

<body class="no-skin">

	<%@ include file="navbar.jsp"%>
	<%@ include file="sidebar.jsp"%>

	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<!-- #section:basics/content.breadcrumbs -->
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try {
					ace.settings.check('breadcrumbs', 'fixed')
				} catch (e) {
				}
			</script>
			<!--  -->
			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
				</li>

				<li><a href="#">People</a></li>
				<li class="active">add</li>
			</ul>
			<!-- /.breadcrumb -->

			<!-- #section:basics/content.searchbox   -->
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

		<!-- =================================================================================================== -->
		<div class="page-content">
			<!-- #section:settings.box  -->
			<%@ include file="settingsbox.jsp"%>
			<!-- /section:settings.box -->
			<div class="row">
				<div class="col-xs-12">
					<div class="widget-box widget-color-blue2">
						<div class="widget-header">
							<h4 class="widget-title lighter smaller">新增人数</h4>
						</div>

						<div class="widget-body">
							<div class="widget-main padding-8">
								<form:form action="./addPeople" id="addForm"
									commandName="people" method="post"
									class="form-horizontal bv-form ">
									<div class="modal-body">
										<div class="form-group  ">
											<label class="col-sm-2 control-label no-padding-right"
												for="add_user_name">authority：</label>
											<div class="col-sm-6">
												<form:select path="authority" class="form-control"
													id="form-field-select-1" name="authority">
													<form:options items="${authority}" />
												</form:select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label no-padding-right"
												for="add_user_name">name：</label>
											<div class="col-sm-6">
												<form:input type="text" class="form-control" id="name"
													name="name" path="name" placeholder="name" />

											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label no-padding-right"
												for="add_user_real_name">phone：</label>
											<div class="col-sm-6">
												<form:input type="text" class="form-control" id="phone"
													name="phone" placeholder="phone " path="phone" />
											</div>
										</div>

									</div>
									<div class="form-group ">
										<div class=" col-md-offset-3 col-md-9">
											<button class="btn btn-info" type="submit">
												<i class="ace-icon fa fa-check bigger-110"></i> 保存
											</button>

											&nbsp; &nbsp; &nbsp;
											<button class="btn" type="button" onclick="history.go(-1);">
												<i class="ace-icon fa fa-undo bigger-110"></i> 取消
											</button>
										</div>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>

			</div>


		</div>
		<!-- /.main-content -->
		<!-- =================================================================================================== -->
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

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#addForm')
									.bootstrapValidator(
											{
												message : 'This value is not valid',
												feedbackIcons : {
													valid : 'glyphicon glyphicon-ok',
													invalid : 'glyphicon glyphicon-remove',
													validating : 'glyphicon glyphicon-refresh'
												},
												fields : {
													name : {
														message : 'The username is not valid',
														validators : {
															notEmpty : {
																message : 'The username is required and can\'t be empty'
															},
															stringLength : {
																min : 2,
																max : 30,
																message : 'The username must be more than 6 and less than 30 characters long'
															},
															regexp : {
																regexp : /^[0-9a-zA-Z\u4e00-\u9fa5]*$/,
																message : 'The username can only consist of alphabetical, number, dot and underscore'
															}
														}
													},
													phone : {
														validators : {
															notEmpty : {
																message : 'The country is required and can\'t be empty'
															},
															regexp : {
																regexp : /^1[3584]\d{9}$/,
																message : 'The username can only consist of alphabetical, number, dot and underscore'
															}
														}
													},
													authority : {
														validators : {
															notEmpty : {
																message : 'You have to accept the terms and policies'
															}
														}
													},

												}
											});
						});
	</script>
</body>
</html>
