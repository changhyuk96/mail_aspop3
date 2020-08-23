<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
	html, body {
		height: 100%;
		width: 100%;
		margin: 0;
	}
	
	#main {
		height: 100%;
		width: 100%;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	
	#frm {
		margin: auto;
		max-width: 50%;
	}
	
	#button {
		text-align: center;
	}
</style>
</head>

<body>
	<script>
		function userInfoSubmit(){
			
			if(!$('#frm #userId').val()){		
				alert('아이디를 입력하세요.');
			}
			else if(!$('#frm #userPwd').val()){
				alert('패스워드를 입력하세요.')
			}
			else
				$('#frm').submit();
		}
	</script>

	<div id="main">
		<form id="frm" action=<c:url value="/login" /> method=post>
		
			<h4 style="text-align:center;">
				# 아이디, 비밀번호 입력
			</h4><br/>
			<p>
				<label>아이디</label>
				<input type=text class="form-control" id=userId name=userId style="width: 250px;"><br/>
				</p>
			<p>
				<label>비밀번호</label>
				<input type=password class="form-control" id=userPwd name=userPwd style="width: 250px;"><br/>
			</p>
			<p  style="text-align:center;">
				<button type="button" class="btn btn-secondary" onclick="userInfoSubmit();">메일 확인</button>
			</p>
		</form>
	</div>
</body>
</html>
