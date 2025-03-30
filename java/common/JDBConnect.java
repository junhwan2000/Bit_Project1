package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	// 기본 생성자
	public JDBConnect() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "quiz";
			String passwd = "quiz";
			con = DriverManager.getConnection(url, id, passwd);
			
			System.out.println( "연결 성공(기본 생성자)" );
		}
		catch ( Exception e ) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (con != null) con.close();
			
			System.out.println( "자원 해제" );
		}
		catch ( Exception e ) {
			e.printStackTrace();
		}
	}
	
	// 두번째 생성자
	public JDBConnect( String driver, String url, String id, String passwd ) {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, id, passwd);
			
			System.out.println( "연결 성공(인수 생성자)" );
		} catch ( Exception e ) {
			e.printStackTrace();
		}
	}
}
