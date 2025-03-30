<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<script type="text/javascript" src="<%=project%>script_board.js"></script>

<h2><%=page_delete %></h2>
<%
	int num = (int) request.getAttribute("num");
	String pageNum = (String) request.getAttribute("pageNum");
	int resultCheck = (int) request.getAttribute("resultCheck");
%>
<%
	if (resultCheck == -1) {
		// 비밀번호가 다르다
		%>
		<script type="text/javascript">
			alert(error_passwd);
			history.back()
		</script>
		<%
	} else {
		// 비밀번호가 같다
		int result = (int) request.getAttribute("result");
		 if (result == 0) {
			// 삭제 실패
			%>
			<script type="text/javascript">
				alert(error_delete);
			</script>
			<meta http-equiv="refresh" content="0; url=boardlist.do?pageNum=<%=pageNum%>">
			<%
		} else {
			// 삭제 성공
			response.sendRedirect("boardlist.do?pageNum" + pageNum);
		}
	}
%>