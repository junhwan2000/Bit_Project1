<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> 회원관리 </h2>
<%
	String user_id = request.getParameter( "user_id" );
	String passwd = request.getParameter( "passwd" );
%>
<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		// 드라이버 로딩
		Class.forName( "oracle.jdbc.driver.OracleDriver" );
		%>
		드라이버 로딩 성공 <br>
		<%
		// DB 연결
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbid = "quiz";
		String dbpasswd = "quiz";
		con = DriverManager.getConnection( url, dbid, dbpasswd );
		%>
		DB 연결 성공 <br>
		<%
		// Statement 생성
		stmt = con.createStatement();
		String sql = null;
		if( user_id == null || user_id.equals( "" ) || passwd == null || passwd.equals( "" ) ) {
			// 출력용
			sql = "select * from Users";
		} else {	
			sql = "select * from Users where user_id='"+user_id+"'";
		}
		rs = stmt.executeQuery( sql );
		%>
		<table border="1">
			<tr>
				<th> 아이디 </th>
				<th> 비밀번호 </th>
				<th> 닉네임 </th>
				<th> 이메일 </th>
			</tr>
			<%
			while( rs.next() ) {	// boolean 값으로 주니 없을 때까지 true 로 자동 실행
				%>
				<tr>
					<td><%=rs.getString( "user_id" )%></td>
					<td><%=rs.getString( "passwd" )%></td>
					<td><%=rs.getString( "nickname" )%></td>
					<td><%=rs.getString( "email" )%></td>
				</tr>
				<%
			}
			%>
		</table>
		<%
	} catch( SQLException e ) {
		e.printStackTrace();
	} finally {
		try {
			if( rs != null ) rs.close();
			if( stmt != null ) stmt.close();
			if( con != null ) con.close();
		} catch( SQLException e ) {
			e.printStackTrace();
		}
	}
%>