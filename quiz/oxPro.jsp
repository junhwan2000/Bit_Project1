<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>

<script>
    var quizData = [];

    <% 
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");

        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbid = "quiz";
        String dbpasswd = "quiz";
        con = DriverManager.getConnection(url, dbid, dbpasswd);
        stmt = con.createStatement();

        String sql = "SELECT * FROM qna";  
        rs = stmt.executeQuery(sql);

        while(rs.next()) { 
            String question = rs.getString("question");
            String answer = rs.getString("answer");
    %>
        quizData.push({question: "<%= question %>", answer: "<%= answer %>"}); 
    <% 
        }
    } catch(SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    }
    %>
</script>

<script>
window.addEventListener("DOMContentLoaded", () => {
    let count = 0; 				// 푼 문제수 체크하는거
    let num = 0;   				// 맞춘 문제수
    let time = 10;  			// 시간
    let interval;  				// 타이머 
    let gameOver = false; 		// 이게 게임 끝났는지 확인하는 변수 true면 게임오버 false면 게임중
    const tspan = document.querySelector("#timeout");	// 마지막문제를 풀어서 게임이 끝나는거랑 
    const qdiv = document.querySelector(".question");	// 마지막문제를 시간초과해서 게임 끝나는거 구현하려고 변수 밖으로 뺌
    
    function showQuestion(index) {		// 문제보여주는거
        if (index < quizData.length) {
            qdiv.innerText = quizData[index].question;
        } else {
            alert("퀴즈 종료! 맞힌 개수: " + num);
            qdiv.innerText = "문제가 끝났습니다.";
            clearInterval(interval);
            gameOver = true;
        }
    }

    function startTimer() {
        clearInterval(interval);
        time = 10;
        tspan.innerText = time;

        interval = setInterval(() => {
            tspan.innerText = time--;
            if (time < 0) {
                clearInterval(interval);
                count++;
                alert("시간초과!");
                if (count < quizData.length) {
                    showQuestion(count);
                    startTimer();
                } else {
                    alert("퀴즈 종료! 맞힌 개수 : " + num);
                    tspan.innerText = 0;					// 마지막 문제 안풀고 시간 초과시
                    qdiv.innerText = "퀴즈가 종료되었습니다.";   
                    gameOver = true;
                }
            }
        }, 1000);	
    }

    function resetGame() {		// 겜 다시할때
        count = 0;
        num = 0;
        gameOver = false;
        showQuestion(0);
        startTimer();
    }

    function checkAnswer(userInput) {		// 정답체크

        if (quizData[count].answer === userInput) {
            alert("정답!");
            num++;
        } else {
            alert("땡!");
        }
        count++;
        if (count < quizData.length) {
            showQuestion(count);
            startTimer();
        } else {
            alert("퀴즈 종료! 맞힌 개수: " + num);	// 마지막 문제를 풀었을시
            tspan.innerText = 0;
            qdiv.innerText = "퀴즈가 종료되었습니다.";	
            clearInterval(interval);
            gameOver = true;
        }
    }
    
    document.querySelector(".btn_O").addEventListener("click", () => checkAnswer("O"));
    document.querySelector(".btn_X").addEventListener("click", () => checkAnswer("X"));

    document.getElementById("restartBtn").addEventListener("click", 
    		() => {
        if (gameOver) {	// 게임끝났을때 다시하기 누르면 
            if (confirm("게임이 종료되었습니다. 다시 시작하시겠습니까?")) {
                resetGame();
            }
        } else {	// 게임도중에 다시하기 누르면 이건 나중에 빼도 될듯함
            if (confirm("게임 도중입니다. 다시 시작하시겠습니까?")) {
                resetGame();
            }
        }
    });

    document.getElementById("exitBtn").addEventListener("click", // 나가는 거 컨펌
    		() => {
        if (confirm("정말로 나가시겠습니까?")) {
            window.location.href = "https://www.google.com";	// 아직 연결은 안했는데 메인으로 갈예정
        }
    });

    showQuestion(0);
    startTimer();
});
</script>
