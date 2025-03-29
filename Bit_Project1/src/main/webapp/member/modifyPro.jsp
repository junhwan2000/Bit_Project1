<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<script type="text/javascript" src="<%=project%>script_member.js"></script>

<h2> <%=page_modify %></h2>
<%
	int result = (int) request.getAttribute("result");
	if ( result == 0 ) {
		%>
		<script type="text/javascript">
			alert(error_modify);
		</script>
		<meta http-equiv="refresh" content="0,url=logonmain.do">
		<%
	} else {
		response.sendRedirect("logonmain.do");
	}
%>
