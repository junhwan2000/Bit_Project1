<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=project%>style_board.css">
<script type="text/javascript" src="<%=project%>script_board.js"></script>

<h2><%=page_modify %></h2>
<%
	int num = (int) request.getAttribute("num");
	String pageNum = (String) request.getAttribute("pageNum");
%>
<form name="passwdform" method="post" action="boardmodifyview.do">
	<input type="hidden" name="num" value="<%=num %>">
	<input type="hidden" name="pageNum" value="<%=pageNum %>">
	<table>
		<tr>
			<th colspan="2" class="input"><%=msg_passwd%></th>
		</tr>
		<tr>
			<th class="input"><%=str_passwd %></th>
			<td><input class="label" type="password" name="passwd" maxlength="20" autofocus></td>
		</tr>
		<tr>
			<th class="input" colspan="2">
				<input class="inputbutton" type="submit" value="<%=btn_mod %>">
				<input class="inputbutton" type="button" value="<%=btn_mod_cancel%>"
					onclick="location='boardlist.do?pageNum=<%=pageNum%>'">
			</th>
		</tr>
	</table>
	
</form>