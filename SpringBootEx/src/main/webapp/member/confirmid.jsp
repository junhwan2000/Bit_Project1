<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<link type="text/css" rel="stylesheet" href="${project}style_member.css">
<script type="text/javascript" src="${project}script_member.js"></script>    

<h2> ${page_confirm} </h2>

<c:if test="${result eq 0}">
	<table>
		<tr>
			<td align="center"> <span>${id}</span>${msg_confirm_o} </td>
		</tr>
		<tr>
			<th>
				<input class="inputbutton" type="button" value="${btn_ok}" 
					onclick="setid( '${id}' )">
			</th>
		</tr>
	</table>
</c:if>		
<c:if test="${result eq 1}">
	<form name="confirmform" action="logonconfirmid">
		<table>
			<tr>
				<th colspan="2"> <span>${id}</span>${msg_confirm_x}
			</tr>
			<tr>
				<th> ${str_id} </th>
				<td> <input class="input" name="id" type="text" maxlength="15" autofocus> </td>
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="submit" value="${btn_ok}">
					<input class="inputbutton" type="button" value="${btn_cancle}"
						onclick="self.close()">
				</th>
			</tr>
		</table>
	</form>
</c:if>










