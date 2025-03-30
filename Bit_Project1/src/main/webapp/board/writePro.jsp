<%@page import="dao.BoardDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<script type="text/javascript" src="<%=project%>script_board.js"></script>

<h2><%=page_write %></h2>
<%
	int result = (int) request.getAttribute("result");
%>
<%
	if (result ==0 ) {
		// 작성 실패
		%>
		<script type="text/javascript">
			alert(error_write);
		</script>
		<meta http-equiv="refresh" content="0; url=boardlist.do">
		<%
	} else {
		// 작성 성공 
		response.sendRedirect("boardlist.do");
	}
%>