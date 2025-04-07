<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=project%>signupstyle.css">
<script type="text/javascript" src="<%=project%>script_member.js"></script>   
<form method="post" class="form" name="inputform" method="post" action="logoninputpro.do">
	<input type="hidden" name="confirm" value="0">
	<table>
		<tr>
			<th colspan="2">
				<%=page_input%>
			</th>
		</tr>
		<tr>
			<td  style="display: flex; align-items: center; gap: 5px;"> 
				<input class="input" type="text" placeholder=<%=str_user_id %> name="user_id" maxlength="15" autofocus >
				<input class="inputbutton" type="button" value="<%=btn_confirm %>" style="width: 30%;">
			</td>
		</tr>
		<tr>
			<td> <input class="input" placeholder=<%=str_passwd %> type="password" name="passwd" maxlength="20"> </td>
		</tr>
		<tr>
			<td> <input class="input" placeholder=<%=str_repasswd %> type="password" name="repasswd" maxlength="20"></td>
		</tr>
		<tr>
			<td> <input class="input" placeholder=<%=str_nickname %>  type="text" name="nickname" maxlength="20"> </td>
		</tr>
		<tr>
			<td>
				<input class="input" placeholder=<%=str_email %> type="text" name="email1" maxlength="20"
					style ="width:100px">
				@ 
				<select name="email2" >
				<option value="1"> 직접입력</option>
				<option value="daum.net"> daum.net </option>
				<option value="naver.com"> naver.com </option>
				<option value="gmail.com"> gmail.com </option>
				<option value="nate.com"> nate.com <option>
				</select>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton" type="submit" value="<%=btn_input %>">
				<input class="inputbutton" type="button" value="<%=btn_main %>"
					onclick="location='logonmain.do'">
				
			</th>
		</tr>
	</table>
</form>