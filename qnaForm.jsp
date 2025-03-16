<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
		
		function showQuestion(s){
			
			let qdiv = document.querySelector("div[class='question']");
			qdiv.innerText= problem[s];
			
		}
		function timer(){
			time = 10;
			let tspan = document.querySelector("span[id='timeout']");
			
			let setinter = setInterval(()=>{
				tspan.innerText = time--;  
				if(time<0){
					alert(setinter);
					clearInterval(setinter);
					timer();
					showQuestion(setinter);
				}
				if(setinter==5){
					clearInterval(setinter);
				}
				
			},1000);
		}
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
            <div class="option" onclick=>O</div>
            <div class="option" onclick=>X</div>
        </div>
        <p id="result"></p>
    </div>
    <div class="chatbox">
        <p>Guest 1</p>
        <p>Guest 2</p>
    </div>
    
</body>
</html>

