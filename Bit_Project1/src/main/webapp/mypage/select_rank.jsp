<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
    Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
		try {
			// 드라이버 로딩
			Class.forName( "oracle.jdbc.driver.OracleDriver" );
		
			// DB 연결
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbid = "quiz";
			String dbpasswd = "quiz";
			con = DriverManager.getConnection( url, dbid, dbpasswd );
			
			// Statement 생성
			stmt = con.createStatement();
			
			// Query 전송
			// executeQuery()				select
			// executeUpdate()				insert update delete
			String sql = "null";
			String game_id = "1111";
			
			sql = "select * from ranks where game_id='"+game_id+"' order by rank_score desc";
		
			rs = stmt.executeQuery( sql );
			%>
			<table border=1>
			<tr>
			   <th>아이디</th>
			   <th>점수</th>
		    </tr>
			<%
			
			while(rs.next()){ %>
			
			   <tr>
			      <td><%=rs.getString( "user_id" )%></td>
			      <td><%=rs.getString( "rank_score" )%></td>
			   </tr>
			
			<%
				
			}
		
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
			
		}%>
</table>
   