<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.0.0.min.js" ></script>
<script type="text/javascript">
	function nextpage() {
		$.ajax({
			type : 'GET',
			contentType : 'application/json',
			url : './page/12',
			dataType : 'json',
			success : function(data) {
				if (data) {
					$.each(data.list, function(i, item) {
						$('#info').append(
								"姓名：" + item.name + "，手机：" + item.phone
										+ "，count：" + item.count);
					});
				}
			},
			error : function() {
				alert("error")
			}
		});

	}
</script>
</head>
<body>

	<c:forEach items="${data }" var="people">
${ people.name}:${ people.phone}:${ people.count}</br>
	</c:forEach>
	<span id="info"></span>
	<input type="button" value="next" onclick="nextpage()" />
	
	<form action="" method="post" ></form>
</body>


</html>