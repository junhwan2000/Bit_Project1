<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
  <title>Rank</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
</head>
<body>
 
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
			
			sql = "select nickname, rank_score, record_time from ranks r, users u "+
					"where r.game_id='"+game_id+"' and r.user_id=u.user_id "+ 
					  "order by rank_score desc";
		
			rs = stmt.executeQuery( sql );
			%>
  <table class="table">
    <thead>
      <tr>
        <th colspan="3">OX게임</th>
      </tr>
    </thead>
    <tbody>
      <tr class="table-dark">
        <th>닉네임</th>
        <th>점수</th>
        <th>랭킹 기록 시간</th>
      </tr>      
      <%
			String css[]={"table-danger","table-primary","table-warning","table-active","table-light"};
            int i=0;
			while(rs.next()){
			
			if(i<5){ %>
			   <tr class=<%=css[i]%>>
			   				<%i++;
			   }
			   else {%>
				   <tr class=<%=css[4]%>>
				   <%;} %>
			      <td><%=rs.getString( "nickname" )%></td>
			      <td><%=rs.getString( "rank_score" )%></td>
			      <td><%=rs.getString( "record_time" )%></td>
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
      
     
    </tbody>
  </table>
<!-- </div>-->

</body>
</html>