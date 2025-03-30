<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<%@ include file="setting.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=project%>style_member.css">
<script type="text/javascript" src="<%=project%>script_member.js"></script>

<h2> <%=page_confirm%></h2>
<%
	int result = (int) request.getAttribute("result");
	String user_id = (String) request.getAttribute("user_id");
%>
<% 
	if (result == 0) {
		// 아이디가 중복이 아니다.
		%>
		<table border="1">
			<tr>	
				<td align="center"> <span> <%=user_id%> </span> <%=msg_confirm_o%> </td> 
			</tr> 
			<tr>
				<th>	
					<input class = "inputbutton" type="button" value="<%=btn_ok%>" 
					onclick="setuser_id('<%=user_id%>')">
				</th>
			</tr>
		</table>
		<%
	} else {
		// 아이디가 중복이다.
		%>
		<form method = "post" name="confirmform" action ="logonconfirmid.do">
			<table border="1">
				<tr>
					<th colspan="2"> <span><%=user_id%></span><%=msg_confirm_x%>
				</tr>
				<tr>
					<th> <%=str_user_id%> </th>
					<td> <input class = "input" name = "user_id" type="text" maxlength="15" autofocus> </td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit" value="<%=btn_ok%>">
						<input class="inputbutton" type="button" value="<%=btn_cancel%>"
							onclick="self.close()">
					</th>
				</tr>
			</table>
		</form>
		<%		
	}

%>