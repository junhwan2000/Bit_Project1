<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.UserDto"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<link type="text/css" rel="stylesheet" href="<%=project%>style_member.css">
<script type="text/javascript" src="<%=project%>script_member.js"></script>    

<h2> <%=page_modify %></h2>
<%
	int result = (int) request.getAttribute("result");
%>
<% 
	if( result==1 ) {
		// 비밀번호가 같다.
		UserDto memberDto = (UserDto) request.getAttribute("memberDto");
		%>
		<form method ="post"  name="modifyform" action="logonmodifypro.do">
			<input type="hidden" name="user_id" value="<%=memberDto.getUser_id() %>"> 
			<table border="1">
				<tr>
					<th colspan="2"> <%=msg_modify %></th>
				</tr>
				<tr>
					<th> <%=str_user_id %> </th>
					<td> <%=memberDto.getUser_id()%> </td>
				</tr>
				<tr>
					<th rowspan="2"><%=str_passwd %></th>
					<td> 
						<input class="input" type="password" name="passwd" maxlength="20" autofocus
							value = "<%=memberDto.getPasswd()%>">
					</td>
				</tr>
				<tr>
					<td>	
						<input class="input" type="password" name="repasswd" maxlength="20" autofocus
							value = "<%=memberDto.getPasswd()%>">
					</td>
				</tr>
				<tr>
					<th> <%=str_nickname %> </th>
					<td> &nbsp; <%=memberDto.getNickname()%> </td> 
				</tr>
				<tr>
					<th> <%=str_email %> </th>
					<td>
					<%
					String email = memberDto.getEmail();
					if(email == null || email.equals("")){
						%>
						<input class="input" type="text" name="email1" maxlength="20" style="width=80;">
						@<input class="input" type="text" name="email2" maxlength="10" style="width=80;">
						<%
					} else {
						String [] e = email.split("@");
						%>
						<input class="input" type="text" name="email1" maxlength="20" style="width=50;"
							value="<%=e[0]%>">
						@<input class="input" type="text" name="email2" maxlength="10" style="width=30;"
							value="<%=e[1]%>">
						<%
					}
					%>
					</td>
				</tr> 
				<tr>
					<th colspan="2">
						<input class = "inputbutton" type="submit" value ="<%=btn_mod%>">
						<input class = "inputbutton" type="reset" value ="<%=btn_cancel%>">
						<input class = "inputbutton" type="button" value = "<%=btn_mod_cancel %>"
						 onclick="location='logonmain.do'">
						
					</th>
				</tr> 
			</table>
		</form>
		<%
	} else {
		// 비밀번호가 다르다.
		%>
		<script type="text/javascript">
			erroralert(error_passwd);
		</script>
		<%
	}
	
%>    