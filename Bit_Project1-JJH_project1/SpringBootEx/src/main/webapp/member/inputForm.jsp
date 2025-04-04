<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<link type="text/css" rel="stylesheet" href="${project}inputform.css">
<script type="text/javascript" src="${project}script_member.js"></script>    


<form class="form" method="post" name ="inputform" action="logoninput">
	<h2 class="form_title">${page_input}</h2>
	<input type="text" placeholder="ID" class="input" name="user_id" /> 
	<input type="password" placeholder="Password" class="input"name="passwd" /> 
	<input type="password" placeholder="Repeat Password" class="input" name="repasswd" /> 
	<input type="text" placeholder="Nickname" class="input" name="nickname" />
	<input type="text" placeholder="Email" class="input" name="email" /> 
 	<input class="inputbutton" type="submit" value="Sign up" name="sub_btn"> 
	<input class="inputbutton" type="button" value="Sign in" onclick="location='logonlogin'">
</form>










