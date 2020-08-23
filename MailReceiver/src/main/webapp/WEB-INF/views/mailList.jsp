<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<style>
body{
	height:100%;
	width:80%;
	margin:30px;
}
 a:href { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: underline;}

</style>
</head>

<body>
	<script>
		function mailDetail(cnt){

			document.detailForm.count.value= cnt;
			document.detailForm.submit();

		}
		
	</script>
	
	<div id="container">
		<table class=table style="text-align:center;">
			<thead class=thead-dark>
				<tr style="font-weight: bold">
					<td>보낸이</td>
					<td>받는이</td>
					<td>제목</td>
					<td>받은 날짜</td>
					<td>크기</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${mailList}" var="mail" varStatus="status">
					<tr>
						<td>${mail.from}</td>
						<td>${mail.recipient}</td>
						<td><a href=# onclick="mailDetail(${status.index});">${mail.subject}</a></td>
						<td>${mail.sentDate}</td>
						<td>${mail.size}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<form action="<c:url value="/mailDetail" />" method="post" name="detailForm">
		<input type=hidden id=count name=count>
	</form>
</body>
</html>
