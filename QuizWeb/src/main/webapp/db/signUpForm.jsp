<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/signupstyle.css">
<script type="text/javascript" src="script_member.js"></script>    


<form method="post" class="form" action="signUp.jsp">
	<h2 class="form_title">Sign Up</h2>
	<input type="text" placeholder="ID" class="input" name="user_id" /> 
	<input type="password" placeholder="Password" class="input"name="passwd" /> 
	<input type="password" placeholder="Repeat Password" class="input" name="repasswd" /> 
	<input type="text" placeholder="Nickname" class="input" name="nickname" />
	<input type="text" placeholder="Email" class="input" name="email" /> 
 	<input class="inputbutton" type="submit" value="Sign up" name="sub_btn"> 
	<input class="inputbutton" type="button" value="Sign in" onclick="location='login.jsp';">
</form>
