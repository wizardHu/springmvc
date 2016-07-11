<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<link rel="stylesheet"  href="./assets/css/dataTables.bootstra.css">
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
<script type="text/javascript" src="./js/dataTables.bootstrap.js"></script>


<script type="text/javascript">


	function changepage(page, pageCount) {
		$
				.ajax({
					type : 'GET',
					contentType : 'application/json',
					url : './page/' + page,
					dataType : 'json',
					success : function(data) {
						if (data) {
							$(".conetnt").empty();
							$
									.each(
											data.list,
											function(i, item) {
												$('.conetnt')
														.append(
																"<tr><td>"
																		+ item.id
																		+ "</td><td>"
																		+ item.name
																		+ "</td><td>"
																		+ item.phone
																		+ "</td><td>"
																		+ item.authority
																		+ "</td><td><div class='hidden-sm hidden-xs btn-group'><a onclick='edit("+item.id+","+page+")' class='btn btn-xs btn-info'> <i class='ace-icon fa fa-pencil bigger-120'></i></a> <a onclick='del("+item.id+","+page+")' class='btn btn-xs btn-danger'> <i class='ace-icon fa fa-trash-o bigger-120'></i></a></div></td></tr>");
											});

							if (page != 1) {
								$("#sample-table-2_previous").removeClass(
										"disabled");
								$("#sample-table-2_previous a").attr(
										"href",
										"javascript:changepage(" + (page - 1)
												+ "," + pageCount + ")");
							} else {
								$("#sample-table-2_previous").addClass(
										"disabled");
								$("#sample-table-2_previous a").removeAttr("href");
							}

							if (page != pageCount) {
								$("#sample-table-2_next")
										.removeClass("disabled");
								$("#sample-table-2_next a").attr(
										"href",
										"javascript:changepage(" + (page + 1)
												+ "," + pageCount + ")");
							} else {
								$("#sample-table-2_next").addClass("disabled");
								$("#sample-table-2_next a").removeAttr("href");
							}

							$("[id=pagenum]").remove();

							for (var j = -2; j < 3 && (j + page - 1) < pageCount; j++) {
								if (j == 0) {
									$("#sample-table-2_next")
											.before(
													'<li id="pagenum" class="paginate_button active" aria-controls="sample-table-2" tabindex="0"><a href="javascript:changepage('
															+ (page + j)
															+ ','
															+ pageCount
															+ ')">'
															+ (page + j)
															+ '</a></li>');

								} else if((page+j)>0){

									$("#sample-table-2_next")
											.before(
													'<li id="pagenum" class="paginate_button " aria-controls="sample-table-2" tabindex="0"><a href="javascript:changepage('
															+ (page + j)
															+ ','
															+ pageCount
															+ ')">'
															+ (page + j)
															+ '</a></li>');
								}
							}
						}
					},
					error : function() {
						alert("error")
					}
				});
	} 
	
	function del(id,page){
		 if(confirm("删了就不能回去啦？"))
			    {
			            window.location.href="./del/"+id+"/"+page; 
			     }
	}
	
	function edit(id,page){
		window.location.href="./editBook/"+id+"/"+page; 
	}
</script>


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
	<%@ include file="navbar.jsp" %>

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
				<%@ include file="settingsbox.jsp" %>
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
							<small>
								<span class="tools pull-centent">
	                            	<a href="./skiptojsp/add" class="btn btn-sm btn-success">新建账号</a>
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
												<th>authority</th>
												<th>operate</th>
											</tr>
										</thead>

										<tbody class="conetnt">

											<c:forEach items="${data }" var="people">

												<tr>
													<td>${ people.id}</td>
													<td>${ people.name}</td>
													<td>${ people.phone}</td>
													<td>${ people.authority}</td>
													<td>
														<div class="hidden-sm hidden-xs btn-group">
															<a  onclick="edit(${ people.id},${nowPage })" class="btn btn-xs btn-info"> <i
																class="ace-icon fa fa-pencil bigger-120"></i>
															</a> <a  onclick="del(${ people.id},${ nowPage})"
																class="btn btn-xs btn-danger"> <i
																class="ace-icon fa fa-trash-o bigger-120"></i>
															</a>
														</div>
													</td>
												</tr>
											</c:forEach>

										</tbody>
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
			<div class="dataTables_paginate paging_simple_numbers"
				id="sample-table-2_paginate">
				<ul class="pagination">
					<c:forEach varStatus="status" begin="${ nowPage}"
						end="${ nowPage+5}">
						<c:if test="${ status.first}">
							<c:choose>
								<c:when test="${nowPage > 1}">
									<li class="paginate_button previous "
										aria-controls="sample-table-2" tabindex="0"
										id="sample-table-2_previous"><a
										href="javascript:changepage(${ nowPage-1},${pageCount })">Previous</a></li>
								</c:when>
								<c:otherwise>
									<li class="paginate_button previous  disabled"
										aria-controls="sample-table-2" tabindex="0"
										id="sample-table-2_previous"><a >Previous</a></li>
								</c:otherwise>
							</c:choose>
						</c:if>

						<c:if test="${status.current == nowPage}">
							<li id="pagenum" class="paginate_button active"
								aria-controls="sample-table-2" tabindex="0"><a
								href="javascript:changepage(${nowPage },${pageCount })">${nowPage }</a></li>
						</c:if>

						<c:if test="${ status.current <= pageCount && !status.first}">
							<li id="pagenum" class="paginate_button "
								aria-controls="sample-table-2" tabindex="0"><a
								href="javascript:changepage(${ status.current},${pageCount })">${ status.current}</a></li>
						</c:if>

						<c:if test="${ status.last}">
							<c:choose>
								<c:when test="${ nowPage < pageCount}">
									<li class="paginate_button next "
										aria-controls="sample-table-2" tabindex="0"
										id="sample-table-2_next"><a
										href="javascript:changepage(${ nowPage+1},${pageCount })">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="paginate_button next disabled"
										aria-controls="sample-table-2" tabindex="0"
										id="sample-table-2_next"><a >Next</a></li>
								</c:otherwise>
							</c:choose>
						</c:if>

					</c:forEach>

				</ul>
			</div>
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
</body>
</html>
