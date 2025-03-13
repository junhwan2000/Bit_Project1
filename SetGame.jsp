<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<h2> JDBC - select - 처리 페이지 </h2>

<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	int length=0;
	try {
		// 드라이버 로딩
		Class.forName( "oracle.jdbc.driver.OracleDriver" );
		%>
			드라이버 로딩 성공 <br>
		<%
		
		// DB 연결
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbid = "bit";
		String dbpasswd = "bit";
		con = DriverManager.getConnection( url, dbid, dbpasswd );
		%>
			DB 연결 성공 <br>
		<%
		// Statement 생성
		stmt = con.createStatement();
		
		// Query 전송
		// executeQuery()				select
		// executeUpdate()				insert update delete
		String sql = "null";
		
		sql = "select * from QnA";
	
		rs = stmt.executeQuery( sql );
		// rs.next();					한 행을 가져온 후 성공했는지 실패했는지 Boolean 값을 리턴
		%>
		<br><br>
		        <form name="form_Questions" action="../db/insertQnA.jsp" method="post">
		        <input type="button" value="문항 추가" id="button_Add">
		<table border="1" name="test">
			<tr>
				<th> 문제 번호 </th>
				<th> 문제 </th>
				<th> 정답 </th>
			</tr>
			<%
			while( rs.next() ) {
				length++;
				%>		
					
				<tr>
					<td name="id_QnA"><%=rs.getString( "id" )%></td>
					<td><input type="text" value="<%=rs.getString( "problem" )%>" name="Q" required="true" placeholder="문제를 입력하세요."></td>
					<td><input type="text" value="<%=rs.getString( "answer" )%>" name="A" required="true" placeholder="정답을 입력하세요."></td>				
			    </tr>
				<%
			}

			%>			
		</table>
			<input type="submit" value="설정 완료">
		</form>
		
		
		
		<%
	} catch( SQLException e ) {
		e.printStackTrace();
	} finally {
		try{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(con != null) con.close();
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	}
%>
<script type="text/javascript">
let len=<%=length %>;
            window.addEventListener(
                "DOMContentLoaded", (event)=>{
                	
                    let btn_Add = document.getElementById("button_Add");
                    btn_Add.addEventListener(
                        "click", (event)=>{
                            let table_QnA = document.querySelector("table[name='test']");
                           
                            let tr_QnA = document.createElement("tr");
                            
                            let td_num = document.createElement("td");
                            td_num.setAttribute("name","id_QnA");
                            
                            len++;
                            td_num.innerText = len;                            
                            
                            let td_Q = document.createElement("td");
                            let text_Q = document.createElement("input");
                            text_Q.setAttribute("name","Q");
                            text_Q.setAttribute("type","text");
                            text_Q.setAttribute("required","true");
                            text_Q.setAttribute("placeholder","문제를 입력하세요.");
                            td_Q.append(text_Q);
                            
                            let td_A = document.createElement("td");
                            let text_A = document.createElement("input");
                            text_A.setAttribute("name","A");
                            text_A.setAttribute("type","text");
                            text_A.setAttribute("required","true");
                            text_A.setAttribute("placeholder","정답을 입력하세요.");
                            td_A.append(text_A);
                            
                            tr_QnA.appendChild(td_num);
                            tr_QnA.appendChild(td_Q);
                            tr_QnA.appendChild(td_A);
                            
                            table_QnA.appendChild(tr_QnA);
                        });
                });

        </script>


