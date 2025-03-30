<%@page import="dao.BoardDao"%>
<%@page import="dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=project%>style_board.css">
<script type="text/javascript" src="<%=project%>script_board.js"></script>

<h2><%=page_modify %></h2>
<br>
<%
	int num = (int) request.getAttribute("num");
	String pageNum = (String) request.getAttribute("pageNum");
	int result = (int) request.getAttribute("result");
%>
<%
	if(result == -1) {
		// 비밀번호가 다르다
		%>
		<script type="text/javascript">
			alert(error_passwd);
			history.back();
		</script>
		<%
	} else {
		// 비밀번호가 같다
		BoardDto boardDto = (BoardDto) request.getAttribute("boardDto");
		%>
		<form name="modifyform" method="post" action="boardmodifypro.do">
			<input type="hidden" name="num" value="<%=num%>">
			<input type="hidden" name="pageNum" value="<%=pageNum%>">
			<table>
				<tr>
					<th class="input" colspan="2"><%=msg_modify %></th>
				</tr>
				<tr>
					<th class="input"><%=str_writer %></th>
					<td class="label"><%=boardDto.getWriter() %></td>
				</tr>
				<tr>
					<th class="input"><%=str_subject %></th>
					<td class="label">
						<input type="text" name="subject" maxlength="100" autofocus value="<%=boardDto.getSubject()%>">
					</td>
				</tr>
				<tr>
					<th class="input"><%=str_content %></th>
					<td class="label">
						<textarea name="content" rows="10" cols="40"><%=boardDto.getContent() %></textarea>
					</td>
				</tr>
				<tr>
					<th class="input"><%=str_passwd %></th>
					<td class="label">
						<input class="input" type="password" name="passwd" maxlength="20" style="background-color:white;" value="<%=boardDto.getPasswd()%>">
					</td>
				</tr>
				<tr>
					<th colspan="2" class="input">
						<input class="inputbutton" type="submit" value="<%=btn_mod%>">
						<input class="inputbutton" type="reset" value="<%=btn_cancel%>">
						<input class="inputbutton" type="button" value="<%=btn_mod_cancel%>"
							onclick="location='boardlist.do?pageNum=<%=pageNum%>'">
					</th>
				</tr>
			</table>
		</form>
		<%
	}
%>