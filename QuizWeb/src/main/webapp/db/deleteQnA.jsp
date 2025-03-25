<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException"%>


<%
   request.setCharacterEncoding("utf-8");
%>
 
<%
    String id[] = request.getParameterValues("id");
    
    Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
		try {
			// 드라이버 로딩
			Class.forName( "oracle.jdbc.driver.OracleDriver" );
		
			// DB 연결
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbid = "bit";
			String dbpasswd = "bit";
			con = DriverManager.getConnection( url, dbid, dbpasswd );
			
			// Statement 생성
			stmt = con.createStatement();
			
			// Query 전송
			// executeQuery()				select
			// executeUpdate()				insert update delete
			String sql = "null";
			
			sql = "delete from QnA where id='"+id[0]+"'";
		
			rs = stmt.executeQuery( sql );
		
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