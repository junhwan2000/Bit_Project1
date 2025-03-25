<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<% %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/qnaForm.css" />
    
    <title>퀴즈 게임</title>
</head>
<body>
    <script>
	  var problem = [];
	  var answer=[];
	  let i=0;
	  let time=10;

	  window.addEventListener("DOMContentLoaded", () =>{
		<% Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		int cnt = 0;
		
			try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
			// DB 연결
		       String url = "jdbc:oracle:thin:@localhost:1521:xe";
		       String dbid = "bit";
		       String dbpasswd = "bit";
		       con = DriverManager.getConnection(url, dbid, dbpasswd);
		    	   stmt = con.createStatement();
		    	
			     String sql = "SELECT * FROM "+ qna_db; 
		     rs = stmt.executeQuery(sql);
		     
			     while(rs.next()){%>
			    	      problem[i]="<%=rs.getString("problem")%>";
			    	      answer[i]="<%=rs.getString("answer")%>";
			    	      i++;
			    <% }
			 
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
		}%>
		let count=0;
		let num=0;
		
		function showQuestion(s){
			
			let qdiv = document.querySelector("div[class='question']");
			if(s<problem.length){
			    qdiv.innerText= problem[s];

			}
			else
			qdiv.innerText="문제가 끝났습니다.";

		}
		
		
		function timer(){
			time = 10;
			let tspan = document.querySelector("span[id='timeout']");

			let setinter = setInterval(()=>{
				tspan.innerText = time--;  
				
				if(time<0){
					clearInterval(setinter);
					count++;
					timer();
					showQuestion(setinter);
				}
				if(setinter==5){
					alert("맞은 개수 : " + num);
					clearInterval(setinter);
				}
				
			},1000);
			
			
		}
		let user_O = document.querySelector("div[class='btn_O']");
		
		user_O.addEventListener("click",()=>{
			if(answer[count]=='O'){
				alert("정답!");
				num++;
				time=0;
			}
			else{
				alert("땡!");
				time=0;
				
				}
		});
	
		let user_X = document.querySelector("div[class='btn_X']")
		
		user_X.addEventListener("click",()=>{
			if(answer[count]=='X'){
				alert("정답!");
				num++;
				time=0;
			}
			else{
				alert("땡!");
				time=0;
			}
			
		});
		
		showQuestion(0);
		timer();


	  });  
      </script>

    <div class="quiz-container">
    
        <div class="timer"> 
        Timer: <span id="timeout"></span>
        </div>
       <div class="question">
       </div>
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

