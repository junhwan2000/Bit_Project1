<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <html>
	<head> 
		<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="../css/loginstyle.css">

	</head>
	<body>
		 <div align="center">
			<!-- 로고 위치 -->
		 </div>
		 
		 <br>
		 
		 <div>
		 	<form method="post" action="memberCheck.jsp">
				 	<table>
				 		<tr>
				 			<th> 회원 아이디 </th>
				 		</tr>
						<tr align="center">
							<td> <input type="text" name="user_id" autofocus
								placeholder="ID" class="input"> </td>
						</tr>
						<tr align="center">
				 			<td> <input type="text" name="passwd" placeholder="Password" class="input"> </td>
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
			 			<input class="inputbutton" type="submit" value="로그인">
			 			</td>
			 		</tr>
			 	</p>
			 	
			 	<p>
			 		<tr align="center">
			 			<td> 아이디 찾기 </td>
			 			<td> 비밀번호 찾기 </td>
			 		</tr>
			 	</p>
			 	</table>
		 	</form>
		 	
		 	<form method="post" action="signUpForm.jsp">
			 	<div align="center">
			 		<tr align="center">
			 			<td td colspan="2"> 과일 Quiz에 처음 참가하시나요? </td>
			 		</tr>
			 		<tr align="center">
			 			<td colspan="2"> 
			 			<input class="inputbutton" type="button" value="회원가입" onclick="location='signUpForm.jsp';">
			 			</td>
			 		</tr>
			 	</div>
		 	</form>
		 </div> 
	</body>
 </html>