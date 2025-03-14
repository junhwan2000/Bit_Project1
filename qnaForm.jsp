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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>퀴즈 게임</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: row;
            height: 100vh;
            margin: 0;
        }
        .sidebar {
            width: 150px;
            background: #ddd;
            padding: 20px;
            text-align: center;
        }
        .sidebar button {
            display: block;
            width: 100%;
            margin: 10px 0;
            padding: 10px;
            background: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
        }
        .quiz-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .question {
            font-size: 24px;
            margin-bottom: 20px;
            border: 2px solid black;
            padding: 20px;
            background: white;
            width: 50%;
            text-align: center;
        }
        .options {
            display: flex;
            gap: 50px;
        }
        .option {
            width: 150px;
            height: 150px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 50px;
            border: 2px solid black;
            background: white;
            cursor: pointer;
        }
        .timer {
            position: absolute;
            top: 20px;
            right: 50px;
            font-size:18px;
            border: 2px solid black;
            padding: 10px;
            background: white;
            width: 30%
        }
        .chatbox {
            position: absolute;
            bottom: 0;
            width: 100%;
            background: #fff;
            padding: 10px;
            border-top: 2px solid black;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <button>문제 1</button>
        <button>문제 2</button>
        <button>문제 3</button>
        <button>문제 4</button>
    </div>
    <div class="quiz-container">
    
        <div class="timer"> 
        Timer: <span id="timeout"></span>
        </div>
       <div class="question">
       	<%
		    Connection con = null;
		    Statement stmt = null;
		    ResultSet rs = null;
       		try{
       			Class.forName("oracle.jdbc.driver.OracleDriver");
       		// DB 연결
       	        String url = "jdbc:oracle:thin:@localhost:1521:xe";
       	        String dbid = "bit";
       	        String dbpasswd = "bit";
       	        con = DriverManager.getConnection(url, dbid, dbpasswd);
       	     	stmt = con.createStatement();
	       	     String sql = "SELECT question FROM qna WHERE qid = 1"; // qid가 1인 문제 가져오기
	             rs = stmt.executeQuery(sql);
	             if (rs.next()) {
	                 out.print(rs.getString("question"));
	             } else {
	                 out.print("문제가 없습니다.");
	             }
       		}catch(SQLException e){
       			e.printStackTrace();
       		}finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
       
       %>
       </div>
        <div class="options">
            <div class="option" onclick="checkAnswer(true)">O</div>
            <div class="option" onclick="checkAnswer(false)">X</div>
        </div>
        <p id="result"></p>
    </div>
    <div class="chatbox">
        <p>Guest 1</p>
        <p>Guest 2</p>
    </div>
    <script>
    let time = 10; // 타이머 시작 (10초)
    let inter= setInterval(
    		() => { 
    			if(time>=0)
    				document.getElementById("timeout").innerText=time--;
    			else
    				{
    				alert("끝났습니다 다음문제"); 
    				clearInterval(inter);
    				}
    		},
    		1000	
    		);
        function checkAnswer(isCorrect) {
            const result = document.getElementById('result');
            if (isCorrect) {
                result.textContent = "정답입니다!";
                result.style.color = "green";
            } else {
                result.textContent = "틀렸습니다. 다시 시도해보세요!";
                result.style.color = "red";
            }
        }
    </script>
</body>
</html>

