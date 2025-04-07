<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../setting.jsp"%>
<script type="text/javascript" src="<%=project%>script_member.js"></script>    
<h2> <%=page_login%> </h2>
<%
	int result = (int) request.getAttribute("result");

%>    
<%
	if( result == 0 ){
		// 아이디가 없다.
		%>
		<script type="text/javascript">
			erroralert(error_user_id);
		</script>
		<%
	} else if ( result == -1) {
		// 비밀번호가 다르다
		%>
		<script type="text/javascript">
			erroralert(error_passwd);
		</script>
		<%
	} else {
		// 아이디와 비밀번호가 같다.
		response.sendRedirect("logonmain.do");
	}


%>    
    