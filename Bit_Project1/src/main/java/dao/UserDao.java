package dao;

import java.lang.ref.PhantomReference;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import dto.UserDto;

public class UserDao {
	// Singleton Pattern
		private static UserDao instance = new UserDao();
		public static UserDao getInstance() {
			return instance;
		}
		
		public Connection getConnection() throws NamingException, SQLException{
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc/Quiz");
			return ds.getConnection();
		}
		
		// 회원가입 
		public int insertMember(UserDto dto) {
			int result = 0;
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = getConnection();
				String sql ="insert into users (user_id, passwd, nickname, email, created_at) values(?,?,?,?,SYSDATE)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getUser_id());
				pstmt.setString(2, dto.getPasswd());
				pstmt.setString(3, dto.getNickname());
				pstmt.setString(4, dto.getEmail());
				result = pstmt.executeUpdate();			
				
			} catch (NamingException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
				if (pstmt != null) pstmt.close();
				if (con != null) con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return result;
		}
			// 아이디 중복 확인
		public int check(String user_id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int result = 0; 
			
			try {
				con = getConnection();
				String sql = "select * from users where user_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user_id);
				rs = pstmt.executeQuery();
				if (rs.next()) result = 1;	// 아이디가 있는 경우
				else result = 0;			// 아이디가 없는 경우
			} catch (NamingException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return result;
		}
		// 로그인
		public int check(String user_id, String passwd) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int result = 0;
			try {
				con = getConnection();
				String sql = "select * from users where user_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					// 아이디가 있다.
					if(passwd.equals(rs.getString("passwd"))) {
						// 비밀번호가 같다. 
						result = 1;
					} else {
						// 비밀번호가 다르다.
						result = -1;
					}
				} else {
					// 아이디가 없다.
					result = 0;
				}
				
			} catch (NamingException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if( rs != null) rs.close();
					if( pstmt != null) pstmt.close();
					if( con != null) con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return result;
		}
		// 회원탈퇴
		public int deleteMember(String user_id) {
			Connection con = null;
			PreparedStatement pstmt = null;
			int result = 0;
			try {
				con = getConnection();
				String sql = "delete from users where user_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user_id);
				result = pstmt.executeUpdate();
				
			} catch (NamingException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if (pstmt != null) pstmt.close();
					if (con != null) con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}	
			}
			return result;
			
		}
		// 회원 정보 수정 
		public UserDto getMember(String user_id) {
			UserDto memberDto = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				con = getConnection();
				String sql = "select * from users where user_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, user_id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					// 아이디가 있는 경우
					memberDto = new UserDto();
					memberDto.setUser_id(rs.getString("user_id"));
					memberDto.setPasswd(rs.getString("passwd"));
					memberDto.setNickname(rs.getString("nickname"));
					memberDto.setEmail(rs.getString("email"));
				} else {
					// 아이디가 없는 경우는 없다.
				}
				
			} catch (NamingException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
				} catch (SQLException e) {
					e.printStackTrace();

				}
			}
			
			return memberDto;
		}
		
		public int modifyMember(UserDto memberDto) {
			int result = 0;
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = getConnection();
				String sql = "update users set passwd=?, email=? where user_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,memberDto.getPasswd());
				pstmt.setString(2,memberDto.getEmail());
				pstmt.setString(3,memberDto.getUser_id());
				result = pstmt.executeUpdate();			
				
				
			} catch (NamingException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
				if(pstmt != null) pstmt.close();
				if(con!= null) con.close();	
					
				} catch (SQLException e ) {
					e.printStackTrace();
				}
			}
			return result;
		}
}
