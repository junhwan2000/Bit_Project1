<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<html>
<head>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link type="text/css" rel="stylesheet" href="${project}mypage.css">
  
</head>

<body>
<div class="container-flex">
  <!-- Sidebar -->
  <div class="sidebar">
    <a href="logonmain" class="fs-4">메인페이지</a>
    
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li><a href="logonmodify" class="nav-link" onclick="loadPage(event, 'logonmodify')">회원정보수정</a></li>
      <li><a href="logondelete" class="nav-link" onclick="loadPage(event, 'logondelete')">회원탈퇴</a></li>
      <li><a href="logonrank" class="nav-link" onclick="loadPage(event, 'logonrank')">랭킹조회</a></li>
      <li><a href="logoninquiry" class="nav-link" onclick="loadPage(event, 'qnawrite')">1:1문의</a></li>
    </ul>
  </div>

  <div class="main-content" id="main-content">
    <h2>환영합니다!</h2>
    <p>왼쪽 메뉴를 선택해주세요.</p>
  </div>
</div>

<script>
  function loadPage(event, pageUrl) {
    event.preventDefault(); // a 태그의 기본 이동 막기
    $('#main-content').load(pageUrl); // AJAX로 오른쪽 영역에 로드
  }
</script>
</body>
</html>
