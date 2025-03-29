<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="oxForm.css" />
    <title>퀴즈 게임</title>
</head>
<body>

<jsp:include page="oxPro.jsp" />

<div class="quiz-container">

    <div class="header-buttons">
        <button id="restartBtn">다시하기</button>
        <button id="exitBtn">나가기</button>
    </div>

    <div class="timer">Timer: <span id="timeout"></span></div>
    <div class="question"></div>
    <div class="options">
        <div class="btn_O">O</div>
        <div class="btn_X">X</div>
    </div>
    <p id="result"></p>
</div>

<div class="chatbox">
    <p>Guest 1</p>
    <p>Guest 2</p>
</div>

</body>
</html>
