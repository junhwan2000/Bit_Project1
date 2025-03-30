<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=project%>style_board.css">
<script type="text/javascript" src="<%=project%>script_board.js"></script>


<h2><%=page_write %></h2>
<br>
<%
	int num = (int) request.getAttribute("num");
	int ref = (int) request.getAttribute("ref");
%>
<form name="writeform" method="post" action="boardwritepro.do">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="ref" value="<%=ref%>">
	<table>
		<tr>
			<th class="input" style="text-align: right;" colspan="2">
				<a href="boardlist.do"><%=str_list %></a>
			</th>
		</tr>
		<tr>
			<th class="label"><%=str_subject %></th>
			<td class="input">
				<input type="text" name="subject" maxlength="100">
			</td>
		</tr>
		<tr>
			<th class="label"><%=str_writer %></th>
			<td class="input">
				<input type="text" name="writer" maxlength="30" autofocus>
			</td>
		</tr>
		<tr>
			<th class="label"><%=str_content %></th>
			<td class="input">
				<textarea name="content" rows="10" cols="40"></textarea>
			</td>
		</tr>
		<tr>
			<th class="label"><%=str_passwd %></th>
			<td class="input">
				<input type="password" name="passwd" maxlength="30">
			</td>
		</tr>
		<tr>
			<th class="label" colspan="2">
				<input class="inputbutton" type="submit" value="<%=btn_write %>">
				<input class="inputbutton" type="reset" value="<%=btn_cancel %>">
				<input class="inputbutton" type="button" value="<%=btn_list %>"
					onclick="location='boardlist.do'">
			</th>
		</tr>
	</table>
</form>