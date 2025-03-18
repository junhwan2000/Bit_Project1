<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link type="text/css" rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="<%=project%>script_member.js"></script>

	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Home Sweet Home</title>
	<link rel="stylesheet" 
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
		integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
		crossorigin="anonymous">	
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	</head>

	<body>
	
	<!-- Nav-Bar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#">Fruit Quiz</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="#">홈</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">O/X게임</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">끝말잇기</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">랭킹</a>
	        </li>
	       </ul>
		      <form class="d-flex" role="search">
		        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
		        <button class="btn btn-outline-success" type="submit">Search</button>
		      </form>
	       <ul>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            Dropdown
	          </a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="#">Action</a></li>
	            <li><a class="dropdown-item" href="#">Another action</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="#">Something else here</a></li>
	          </ul>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link disabled" aria-disabled="true">Disabled</a>
	        </li>
	      </ul>
	    </div>
	    <div>
	    	<form>
	    		<button type="button" class="btn btn-outline-dark" onclick="location='login.jsp'">로그인</button>
	    		<button type="button" class="btn btn-outline-dark" onclick="location='signUpForm.jsp'">회원가입</button>
	    	</form>
	    </div>
	    <div>
	    	<form method="post" action="signUpForm.jsp">
	    		<input class="input" type="submit" name="login" value="회원가입">
	    	</form>
	    </div>
	  </div>
	</nav>
	
	<div class="container">
		<div class="div1"></div>
		<div class="div2"> 
			<h1 class="home"> HOME </h1> 
			<img
				src="../images/a.jpg" alt="img" class="image" >
		</div>	
		<div class="div3">
		</div>
		<div class="div4">
		</div>
		<div class="div5">
		</div>
		<%
		if( session.getAttribute( "memId" ) == null ) {
			// 로그인 안 된 메인
			%>
			<form name="mainform" method="post" action="login.jsp">
				<table>
					<tr>
						<th colspan="2">
							<%=msg_main%>
						</th>
					</tr>
					<tr>
						<td> <input class="input" type="submit" name="login"> </td>
					</tr>
	 			</table>
			</form>
			<%
		} else {
			// 로그인 된 메인
			%>
			<table>
				<tr>
					<td align="center">
						<span><%=session.getAttribute( "memId" )%></span><%=msg_main_login%>
					</td>
				</tr>
				<tr>
					<th> 마이페이지 <th>
					<td> <input class="button" type="button" name="singup" onclick="location="> </td>
					
					<!-- 
						<input class="inputbutton" type="button" value="<%=btn_modify%>">
						<input class="inputbutton" type="button" value="<%=btn_delete%>">
						<input class="inputbutton" type="button" value="<%=btn_logout%>">
					-->
					</th>
				</tr>
			</table>
			<%
		}
		%>
		</div>