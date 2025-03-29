<%@page import="dao.UserDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../setting.jsp"%>
<script type="text/javascript" src="<%=project%>script_member.js"></script>   

    <h2> <%=page_input %></h2>
<%
	int result = (int) request.getAttribute("result");
%>
<%
	if ( result == 0 ){
		// 가입실패
		%>
		<script type="text/javascript">
			erroralert(error_input);
		</script>
		<% 
	} else {
		// 가입성공
		response.sendRedirect("logonmain.do");	
	}
%>
	
