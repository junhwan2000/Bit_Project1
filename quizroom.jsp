<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"> <!-- 문자 인코딩 설정 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 화면 크기 조정 -->
    <title>퀴즈 게임</title> <!-- 페이지 제목 -->
    <style>
        body {
            font-family: Arial, sans-serif; /* 폰트 설정 */
            background-color: #f4f4f4; /* 배경 색 설정 */
            display: flex;
            flex-direction: row; /* 화면 배치 방향 설정 */
            height: 100vh; /* 화면 전체 높이 사용 */
            margin: 0; /* 마진 없애기 */
        }
        .sidebar {
            width: 150px; /* 사이드바 너비 */
            background: #ddd; /* 사이드바 배경 색 */
            padding: 20px; /* 사이드바 안쪽 여백 */
            text-align: center; /* 버튼 가운데 정렬 */
        }
        .sidebar button {
            display: block;
            width: 100%; /* 버튼 너비를 사이드바와 같게 */
            margin: 10px 0; /* 버튼 간 간격 */
            padding: 10px; /* 버튼 내 여백 */
            background: #007BFF; /* 버튼 배경 색 */
            color: white; /* 버튼 글자 색 */
            border: none; /* 테두리 제거 */
            cursor: pointer; /* 마우스를 올렸을 때 포인터 모양 */
        }
        .quiz-container {
            flex: 1; /* 남은 공간을 모두 차지 */
            display: flex;
            flex-direction: column; /* 세로 방향으로 배치 */
            align-items: center; /* 가로로 중앙 정렬 */
            justify-content: center; /* 세로로 중앙 정렬 */
        }
        .question {
            font-size: 24px; /* 글자 크기 설정 */
            margin-bottom: 20px; /* 아래 여백 */
            border: 2px solid black; /* 테두리 설정 */
            padding: 20px; /* 내부 여백 */
            background: white; /* 배경색 흰색 */
            width: 50%; /* 너비 50% */
            text-align: center; /* 텍스트 가운데 정렬 */
        }
        .options {
            display: flex;
            gap: 50px; /* 옵션들 간의 간격 */
        }
        .option {
            width: 150px; /* 옵션 크기 설정 */
            height: 150px;
            display: flex;
            align-items: center; /* 중앙 정렬 */
            justify-content: center;
            font-size: 50px; /* 글자 크기 */
            border: 2px solid black; /* 테두리 설정 */
            background: white; /* 배경색 흰색 */
            cursor: pointer; /* 마우스를 올렸을 때 포인터 모양 */
        }
        .timer {
            position: absolute; /* 화면 상단에 고정 */
            top: 20px; /* 상단 여백 */
            right: 50px; /* 오른쪽 여백 */
            font-size: 18px; /* 글자 크기 */
            border: 2px solid black; /* 테두리 */
            padding: 10px; /* 여백 */
            background: white; /* 배경색 흰색 */
            width: 30%; /* 너비 설정 */
        }
        .chatbox {
            position: absolute; /* 화면 하단에 고정 */
            bottom: 0; /* 하단에 고정 */
            width: 100%; /* 전체 너비 */
            background: #fff; /* 배경색 흰색 */
            padding: 10px; /* 여백 */
            border-top: 2px solid black; /* 상단 테두리 */
        }
    </style>
</head>

<body>
    <!-- 사이드바 (문제 선택 버튼들) -->
    <div class="sidebar">
        <button onclick="setQuestion(0)">문제 1</button> <!-- 문제 1 선택 버튼 -->
        <button onclick="setQuestion(1)">문제 2</button> <!-- 문제 2 선택 버튼 -->
        <button onclick="setQuestion(2)">문제 3</button> <!-- 문제 3 선택 버튼 -->
        <button onclick="setQuestion(3)">문제 4</button> <!-- 문제 4 선택 버튼 -->
    </div>

    <!-- 퀴즈 화면 컨테이너 -->
    <div class="quiz-container">
        <!-- 타이머 표시 영역 -->
        <div class="timer"> 
            Timer: <span id="timeout">10</span> <!-- 타이머 초기값 10초 -->
        </div>
        
        <!-- 문제 표시 영역 -->
        <div class="question" id="question"></div>

        <!-- 문제 정답 선택 영역 -->
        <div class="options">
            <div class="option" onclick="checkAnswer(true)">O</div> <!-- O 선택 버튼 -->
            <div class="option" onclick="checkAnswer(false)">X</div> <!-- X 선택 버튼 -->
        </div>
        <p id="result"></p> <!-- 결과 출력 영역 -->
    </div>

    <div class="chatbox">
        <p>Guest 1</p> <!-- 채팅창 (게스트 1) -->
        <p>Guest 2</p> <!-- 채팅창 (게스트 2) -->
    </div>

    <script>
        let time = 10; // 타이머 시작 값 (10초)
        let questionIndex = 0; // 현재 문제 인덱스
        let inter; // 타이머 인터벌 변수

        // JSP에서 가져온 문제 데이터를 저장할 변수
        let quizData = [];

        // JSP에서 문제 데이터를 JSON 형식으로 가져오기
        <%  
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                // 오라클 JDBC 드라이버 로드
                Class.forName("oracle.jdbc.driver.OracleDriver");
                String url = "jdbc:oracle:thin:@localhost:1521:xe"; // DB 연결 URL
                String dbid = "bit"; // DB 아이디
                String dbpasswd = "bit"; // DB 비밀번호
                con = DriverManager.getConnection(url, dbid, dbpasswd); // DB 연결
                stmt = con.createStatement(); // SQL 문장 생성
                
                String sql = "SELECT * FROM qna ORDER BY qid"; // 문제 데이터 가져오기
                rs = stmt.executeQuery(sql); // 쿼리 실행

                // JavaScript로 문제 데이터를 넘기기 위한 출력
                out.print("quizData = [");
                while (rs.next()) {
                    String question = rs.getString("question"); // 문제 내용 가져오기
                    String answer = rs.getString("answer"); // 정답 가져오기

                    // JSON 형식으로 출력하여 JavaScript에서 사용
                    out.print("{ question: '" + question + "', answer: '" + answer + "' },");
                }
                out.print("];");
            } catch(SQLException e) {
                e.printStackTrace(); // 예외 처리
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace(); // 예외 처리
                }
            }
        %>

        // 문제를 화면에 표시하는 함수
        function setQuestion(index) {
            if (index >= quizData.length) { // 문제가 없으면 종료
                alert("더 이상 문제가 없습니다.");
                return;
            }
            questionIndex = index; // 문제 인덱스 설정
            document.getElementById("question").innerText = quizData[questionIndex].question; // 문제 내용 표시
        }

        // 정답 확인 함수
        function checkAnswer(isCorrect) {
            const result = document.getElementById('result');
            if (isCorrect) { // 정답일 경우
                result.textContent = "정답입니다!"; // 정답 메시지 표시
                result.style.color = "green"; // 색상은 녹색
            } else { // 틀렸을 경우
                result.textContent = "틀렸습니다. 다시 시도해보세요!"; // 틀린 메시지 표시
                result.style.color = "red"; // 색상은 빨간색
            }
        }

        // 타이머 함수
        function startTimer() {
            clearInterval(inter); // 기존 타이머 중지
            let time = 10; // 타이머 초기화
            document.getElementById("timeout").innerText = time; // 타이머 초기값 설정
            inter = setInterval(() => { // 타이머 동작 시작
                if (time > 0) {
                    document.getElementById("timeout").innerText = --time; // 타이머 값 감소
                } else {
                    alert("시간 초과! 다음 문제로 이동합니다."); // 시간이 초과되면 알림
                    setQuestion(++questionIndex); // 다음 문제로 이동
                    startTimer(); // 타이머 다시 시작
                }
            }, 1000); // 1초마다 실행
        }

        // 첫 번째 문제 설정 후 타이머 시작
        setQuestion(0); // 첫 번째 문제 설정
        startTimer(); // 타이머 시작
    </script>
</body>
</html>
