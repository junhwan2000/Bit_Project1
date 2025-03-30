<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=project%>style_board.css">
<script type="text/javascript" src="<%=project%>script_board.js"></script>
<h2><%=page_modify %></h2>
<%
	String pageNum = (String) request.getAttribute("pageNum");
	int result = (int) request.getAttribute("result");
%>
<%

	if (result == 0) {
		// 수정 실패
		%>
		<script type="text/javascript">
			alert(error_modify);
		</script>
		<meta http-equiv="refresh" content="0; url=boardlist.do?pageNum=<%=pageNum%>">
		<%
	} else {
		// 수정 성공
		response.sendRedirect("boardlist.do?pageNum=" + pageNum);
	}
%>