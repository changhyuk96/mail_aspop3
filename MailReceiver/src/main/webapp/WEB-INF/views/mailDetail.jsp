<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
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
body {
	height: 100%;
	width: 80%;
	margin: 30px;
}

a:href {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}
</style>
</head>

<body>

	<div id="container">
		<table class="table table-striped" style="text-align: center;">

			<tr>
				<td>보낸이</td>
				
				<td>받는이</td>
			</tr>
			<tr>
				<td>${mail.from }</td>
				<td>${mail.recipient }</td>
					
			</tr>
			<tr>
				<td colspan="4">제목</td>
			</tr>
			<tr>
				<td colspan="4">${mail.subject }</td>
			</tr>
			<tr>
				<td colspan="4">내용</td>
			</tr>
			<tr>
				<td colspan="4">${mail.content };</td>
			</tr>

		</table>
	</div>

</body>
</html>
