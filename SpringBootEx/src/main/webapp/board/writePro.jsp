<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script type="text/javascript" src="${project}script_board.js"></script>

<h2>${page_write}</h2>

<c:choose>
	<c:when test="${result eq 0}">
		<script type="text/javascript">
			alert(error_write);
		</script>
		<meta http-equiv="refresh" content="0; url=boardlist">
	</c:when>

	<c:when test="${result eq 1}">
		<c:redirect url="boardlist" />
	</c:when>
</c:choose>
