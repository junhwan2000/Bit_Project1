<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<link rel="stylesheet" type="text/css" href="${project}style_board.css">
<script type="text/javascript" src="${project}script_board.js"></script>
<h2> ${page_delete} </h2>
<br>

<form name="passwdform" method="post" action="boarddelete">
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<table>
		<tr>
			<th colspan="2"> ${msg_passwd} </th>
		</tr>
		<tr>
			<th> ${str_passwd} </th>
			<td> 
				<input class="input" type="password" name="passwd" maxlength="20" autofocus> 
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="${btn_del}">
				<input class="inputbutton" type="button" value="${btn_del_cancle}"
					onclick="location='boardlist?pageNum=${pageNum}'">
			</th>
		</tr>
	</table>
</form>





