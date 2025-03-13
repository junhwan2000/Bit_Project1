<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	
	<head>
		<meta charset="UTF-8">
		<title>SIGN UP</title>
		<link rel ="stylesheet" type="text/css" href="../css/signupstyle.css">
	</head>
	<body>
		<div class="">
			<form method = "post" class="form" action="signUp.jsp">
				<h2 class="form_title">Sign Up</h2>
					<input type="text" placeholder="ID" class="input" name = "id"/>
					<br>	
					<input type="password" placeholder="Password" class="input" name = "passwd"/>
					<br>
					<input type="password" placeholder="Repeat Password" class="input" name = "repasswd"/>
					<br>
					<input type="text" placeholder="Nickname" class="input" name = "nickname"/>
					<br>
					<input type="text" placeholder="Tel" class="input" name = "tel"/>
					<br>
					<input class ="inputbutton" type="submit" value = "Sign up" name="sub_btn">
					<input class ="inputbutton" type="button" value = "Sign in" onclick="location='signin.html';">			
			</form>
		</div>
	</body>
</html>