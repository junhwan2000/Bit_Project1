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
	String user_id = request.getParameter( "user_id" );
	String passwd = request.getParameter( "passwd" );
	String nickname = request.getParameter( "nickname" );
	String email = request.getParameter( "email" );
%>
<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName( "oracle.jdbc.driver.OracleDriver" );		// 얘는 두번 할 필요 없는데 server 껐다 켰을 때 얘부터 실행할 수 있으니 한번 더 적어줌.
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbid = "quiz";
		String dbpasswd = "quiz";
		con = DriverManager.getConnection( url, dbid, dbpasswd );
		%>
		DB 연결 성공 <br>
		<%
		String sql = "select * from Users where user_id = '"+user_id+"' and passwd = '"+passwd+"'";
		stmt = con.createStatement();
		rs = stmt.executeQuery( sql );
		if ( rs.next() ) {
			%>
			<script> alert( "로그인 성공" ); </script>
			<%
		} else {
			%>
			<script type="text/javascript"> 
				alert( "회원정보가 없습니다." ); 
				history.back();
			</script>
			<%
		}
	} catch ( SQLException e ) {
		e.printStackTrace();
		%>
		로그인에 실패했습니다. <br>
		잠시 후 다시 시도해주세요. <br>
		<meta http-equiv="refresh" content="3;url=login.jsp">
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