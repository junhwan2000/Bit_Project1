<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> 로그인 후, 회원 확인 </h2>

<%
	request.setCharacterEncoding( "utf-8" );
%>

<%
	String id = request.getParameter( "id" );
	String passwd = request.getParameter( "passwd" );
	String nickname = request.getParameter( "nickname" );
	String tel = request.getParameter( "tel" );
%>
<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName( "oracle.jdbc.driver.OracleDriver" );		// 얘는 두번 할 필요 없는데 server 껐다 켰을 때 얘부터 실행할 수 있으니 한번 더 적어줌.
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbid = "bit";
		String dbpasswd = "bit";
		con = DriverManager.getConnection( url, dbid, dbpasswd );
		%>
		DB 연결 성공 <br>
		<%
		String sql = "SELECT id FROM member WHERE id = '"+id+"' and passwd = '"+passwd+"'";
		if ( sql != null ) {
			%>
			<script> alert( "로그인 성공" ); </script>
			<%
		} else {
			%>
			<script> alert( "회원정보가 없습니다." ); </script>
			<%
		}
	} catch ( SQLException e ) {
		e.printStackTrace();
		%>
		로그인에 실패했습니다. <br>
		<%
	} finally {
		try {
			if( stmt != null ) stmt.close();
			if( con != null ) con.close();
		} catch( SQLException e ) {
			e.printStackTrace();
		}
	}
%>