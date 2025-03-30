<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script type="text/javascript" src="<%=project%>script_member.js"></script>

<h2> <%=page_delete %></h2>
<%
	int resultCheck = (int) request.getAttribute("resultCheck");
	
%>
<%	
	if (resultCheck == 1) {
		// 비밀번호가 같다.
		int result = (int) request.getAttribute("result");
		if (result == 0){
			// 탈퇴 실패	
			%>
			<script type="text/javascript">
				alert(error_delete);
			</script>
			<meta http-equiv="fresh" content="0; url=loginmain.do">
			<%
		} else {
			// 탈퇴 성공
		}
			response.sendRedirect("logonmain.do");
		} else {
		// 비밀번호가 다르다.
		%>
		<script type="text/javascript">
			erroralert(error_passwd);
		</script>
		<%
	}
	
%>
