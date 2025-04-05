<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<link type="text/css" rel="stylesheet" href="${project}loginstyle.css">
<script type="text/javascript" src="${project}script_member.js"></script>    

	 <div align="center">
			<!-- 로고 위치 -->
		 </div>
		 
<h2> ${page_login} </h2>

	<form name="loginform" method="post" action="logon/login">
		<table>
			<tr>
				<td> <input class="input" type="text" name="userId" 
				placeholder="ID" maxlength="15" autofocus> </td>
			</tr>
			<tr>
				<td> <input class="input" type="password" name="passwd" 
				placeholder="Password" maxlength="20"> </td>
			</tr>
		</table> 
	 <div>
	 	<table>
			<tr>	
				<td><input type="checkbox" class="memory"> 아이디 저장</td>
		 	</tr>
		</table>
	</div>
		 	<p>
		 		<tr align="center">
		 			<td> 
		 				<input class="inputbutton" type="submit" value="${btn_login}">
		 			</td>
		 		</tr>
		 	</p>
	 		
		 	<p>
		 		<tr align="center">
		 			<td> 아이디 찾기 </td>
		 			<td> 비밀번호 찾기 </td>
		 		</tr>
		 	</p>
		 	<tr align="center">
		 		<td td colspan="2"> 과일 Quiz에 처음 참가하시나요? </td>
		 	</tr>
		 	<p>
	 			<tr align="center">
		 			<td> 
		 				<input class="inputbutton" type="button" value="${btn_input}"
		 				onclick="location='logon/signup'">
		 			</td>
	 		</tr>
		 	</p>
		 		<p>
	 			<tr align="center">
		 			<td> 
		 				<input class="inputbutton" type="button" value="${btn_main}"
		 				onclick="location='logon/main'">
		 			</td>
	 		</tr>
		 	</p>
		</table>
	</form>

	