<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 당신은 누구인가여? </title>
</head>
<body>
	<h2> 패턴으로 회원인증하기  </h2>
	<p>
		<strong> ${ authMessage } </strong>
		<br/>
		<a href="<%=request.getContextPath()%>/servlet/MemberAuth.do?id=suwon&pass=000">관리자 인증</a>
		&nbsp;&nbsp;
		<a href="<%=request.getContextPath()%>/servlet/MemberAuth.do?id=aaa&pass=111">회원 인증</a>
		&nbsp;&nbsp;
	</p>
</body>
</html>