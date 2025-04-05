<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<script type="text/javascript" src="${project}script_member.js"></script>

<h2> ${page_main} </h2>

<c:if test="${memId == null}">
<form name="mainform" method="post" action="logon/login">
	<table>
		<tr>
			<th align="center"> 
				${msg_main}
			</th>
		</tr>
		<tr>
			<td>
				<input class="inputbutton" type="button" value="${btn_input}"
					onclick="location='logon/login'">
			</td>
		</tr>
	</table>
</form>
</c:if>
<c:if test="${memId != null}">
	<table>
		<tr>
			<td align="center">
				<span>${memId}</span>${msg_main_login}
			</td>
		</tr>
		<tr>
			<td>
				<input class="inputbutton" type="button" value="${btn_logout}"
					onclick="location='lgoon/logout'">
			</td>
		</tr>
	</table>
</c:if>