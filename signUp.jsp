<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String repasswd = request.getParameter("repasswd");
	String nickname = request.getParameter("nickname");
	String tel = request.getParameter("tel");
	  
%>
<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbid = "bit";
		String dbpasswd = "bit";
		DriverManager.getConnection(url,dbid,dbpasswd);
		con = DriverManager.getConnection(url, dbid, dbpasswd);
		stmt = con.createStatement();
		
		String checkIdSql = "SELECT COUNT(*) FROM member WHERE id='" + id + "'";
		String checkNickNameSql = "SELECT COUNT(*) FROM member WHERE nickname='" + nickname + "'";
		String checkTelSql = "SELECT COUNT(*) FROM member WHERE tel='" + tel + "'";
		int idCount = 0;
		int nickNameCount=0;
		int telCount=0;
		
		rs = stmt.executeQuery(checkIdSql);
		if (rs.next()) {
			idCount = rs.getInt(1);
		}
		
		rs = stmt.executeQuery(checkNickNameSql);
		if (rs.next()) {
			nickNameCount = rs.getInt(1);
		}
		
		rs = stmt.executeQuery(checkTelSql);
		if (rs.next()) {
			telCount = rs.getInt(1);
		}
		
		if (idCount > 0) {
			%>
			<script>
				alert('이미 사용 중인 아이디입니다.');
				history.back();
			</script>
			<%
		} else if (nickNameCount > 0) {
			%>
			<script>
				alert('이미 사용 중인 닉네임입니다.');
				history.back();
			</script>
			<%
		} else if (telCount > 0) {
			%>
			<script>
				alert('이미 사용 중인 전화번호입니다.');
				history.back();
			</script>
			<%
		} else if(!passwd.equals(repasswd)){
			%>
			<script>
				alert('비밀번호가 다릅니다.');
				history.back();
			</script>
			<%
			
		} else {
		String sql = "insert into member values( '"+id+"', '"+passwd+"', '"+nickname+"', '"+tel+"')";
		int result = stmt.executeUpdate(sql);		// 리턴값 몇 행을 작업했는지 개수로 알려줌
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try{
			if (stmt != null ) stmt.close();
			if (con != null ) con.close();
		} catch (SQLException e){
			e.printStackTrace();
		}
	}

%>