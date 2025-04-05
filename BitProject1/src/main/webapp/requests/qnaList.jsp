<%@page import="request.QnaDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="request.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
QnaDAO dao = new QnaDAO();

Map<String, Object> param = new HashMap<String, Object>();

int totalCount = dao.selectCount(param);	// 게시물 수 확인
List<QnaDTO> qnaLists = dao.selectList(param); // 게시물 목록 받기
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1:1 문의</title>
</head>
<body>
	<!-- <jsp:include page=""/> -->
	<h2> 문의글 목록 보기 </h2>
	<form method="get">
		<table border="1" width="90%">
			<!-- 컬럼 -->
			<tr>
				<th width="10%"> 번호 </th>
				<th width="50%"> 제목 </th>
				<th width="20%"> 작성자 </th>
				<th width="20%"> 작성일 </th>
			</tr>
			<!-- 목록 내용 -->
		<%
		if(qnaLists.isEmpty()) {
		%>
			<tr>
				<td colspan="5" align="center">
					다행히도 문의할 사항이 없나봐용 ㅎ
				</td> 
			</tr>	
		<%
		} else {
			int virtualNum = 0;
			for(QnaDTO dto : qnaLists) {
				virtualNum = totalCount--;
		%>
			<tr align="center">
				<td><%=virtualNum%></td>
				<td align="left">
					<a> 제목 </a>
				</td>
				<td align="center"><%=dto.getUser_id()%></td>
				<td align="center"><%=dto.getReg_date()%></td>
		<%
		}
	}
	%>
		</table>
	</form>
</body>
</html>