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
	      &nbsp;&nbsp;
		      <form class="d-flex" role="search">
		        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
		        <button class="btn btn-outline-success" type="submit">Search</button>
		      </form>
	    </div>
	    &nbsp;&nbsp;
	    <div>
	    	<form>
	    	<%
			if( session.getAttribute( "memId" ) == null ) {
				// 로그인 안 된 메인
				%>
				<button type="button" class="btn btn-outline-dark" onclick="location='../db/login.jsp'">로그인</button>
	    		<button type="button" class="btn btn-outline-dark" onclick="location='../db/signUpForm.jsp'">회원가입</button>
	    		&nbsp;
				<%
			} else {
				// 로그인 된 메인
				%>
				<button type="button" class="btn btn-outline-dark" onclick="location='logout.jsp'">로그아웃</button>
				<button type="button" class="btn btn-outline-dark" onclick="location='mypageForm.jsp'">마이페이지</button>
				&nbsp;
				<%
			}
			%>
	    	</form>
	    </div>
	  </div>
	</nav>
	
	<div class="container">
		<div class="div1"> </div>
		<div class="div2"> 추천게임 </div>
		<img src="../css/images/teamFruit.jpg" alt="img" class="image" >
		<div class="div3"> 
			<h1 class="home"> 실시간 순위 </h1> 
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-award" viewBox="0 0 16 16">
  				<path d="M9.669.864 8 0 6.331.864l-1.858.282-.842 1.68-1.337 1.32L2.6 6l-.306 1.854 1.337 1.32.842 1.68 1.858.282L8 12l1.669-.864 1.858-.282.842-1.68 1.337-1.32L13.4 6l.306-1.854-1.337-1.32-.842-1.68zm1.196 1.193.684 1.365 1.086 1.072L12.387 6l.248 1.506-1.086 1.072-.684 1.365-1.51.229L8 10.874l-1.355-.702-1.51-.229-.684-1.365-1.086-1.072L3.614 6l-.25-1.506 1.087-1.072.684-1.365 1.51-.229L8 1.126l1.356.702z"/>
  				<path d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1z"/>
			</svg>
			<img src="../css/issmages/teamFruit.jpg" alt="img" class="image" >
		</div>	
		<div class="div4" name="loginSession">
			<p class="d-inline-flex gap-1">
			  <button type="button" class="btn btn-primary" data-bs-toggle="button" onclick="location='../db/login.jsp'">
			  	로그인
				  	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
					  <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0z"/>
					  <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"/>
					</svg>
				</button>
			</p>
		</div>
		<div class="div5">
			<tr>
				<td> 소식 </td>
			</tr>
		</div>
		<div class="div6">
			<tr>
				<td> 1:1게시판 </td>
			</tr>
		</div>
		<div class="div7">
		</div>
		
	</div>