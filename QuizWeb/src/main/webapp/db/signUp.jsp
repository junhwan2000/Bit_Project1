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
	String user_id = request.getParameter("user_id");
	String passwd = request.getParameter("passwd");
	String repasswd = request.getParameter("repasswd");
	String nickname = request.getParameter("nickname");
	String email = request.getParameter("email");
	String created_at = request.getParameter("created_at");
	String deleted_at = request.getParameter("deleted_at");
%>
<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbid = "quiz";
		String dbpasswd = "quiz";
		DriverManager.getConnection(url,dbid,dbpasswd);
		con = DriverManager.getConnection(url, dbid, dbpasswd);
		stmt = con.createStatement();
		 	
		String checkIdSql = "SELECT COUNT(*) FROM Users WHERE user_id='" + user_id + "'";
		String checkNickNameSql = "SELECT COUNT(*) FROM Users WHERE nickname='" + nickname + "'";
		String checkEmailSql = "SELECT COUNT(*) FROM Users WHERE email='" + email + "'";
		int idCount = 0;
		int nickNameCount=0;
		int emailCount=0;
		
		rs = stmt.executeQuery(checkIdSql);
		if (rs.next()) {
			idCount = rs.getInt(1);
		}
		
		rs = stmt.executeQuery(checkNickNameSql);
		if (rs.next()) {
			nickNameCount = rs.getInt(1);
		}
		
		rs = stmt.executeQuery(checkEmailSql);
		if (rs.next()) {
			emailCount = rs.getInt(1);
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
		} else if (emailCount > 0) {
			%>
			<script>
				alert('이미 사용 중인 이메일입니다.');
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
			  String sql = "INSERT INTO Users (user_id, passwd, nickname, email, created_at) VALUES ('"
                 + user_id + "', '" + passwd + "', '" + nickname + "', '" + email + "', SYSDATE)";
        int result = stmt.executeUpdate(sql);		// 리턴값 몇 행을 작업했는지 개수로 알려줌
		%>
		<script>
				alert('회원가입이 완료되었습니다.');
				location.href = "login.jsp";
		</script>
		<%
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