package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import dto.BoardDto;

// DAO
public class BoardDao {
	private static BoardDao instance = new BoardDao();
	public static BoardDao getInstance() {
		return instance;
	}
	public Connection getConnection() throws NamingException, SQLException {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup( "java:comp/env" );
		DataSource ds = (DataSource) envCtx.lookup( "jdbc/Quiz" );
		return ds.getConnection();
	}
	
	public int getCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			con = getConnection();
			String sql = "select count(*) from board";
			pstmt = con.prepareStatement( sql );
			rs = pstmt.executeQuery();
			if( rs.next() )
				count = rs.getInt( 1 );
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();
			} catch( SQLException e ) {
				e.printStackTrace();
			}
		}
		return count;
	}
	
	// 글쓰기
	public int insertArticle( BoardDto boardDto ) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			
			int num = boardDto.getNum();
			int ref = boardDto.getRef();
			String sql = null;
			if( num == 0 ) {
				// 제목글
				sql = "select max( num ) from board";
				pstmt = con.prepareStatement( sql );
				rs = pstmt.executeQuery();
				if( ! rs.next() ) {
					// 글이 없는 경우
					ref = 1;
				} else {
					// 글이 있는 경우
					ref = rs.getInt( 1 ) + 1;		// 글번호 최대값 + 1
				}				
			} 
			
			sql = "insert into board( num, writer, subject, passwd, reg_date, ref, content, ip ) "
				+ "values( board_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ? )";
			pstmt = con.prepareStatement( sql );
			pstmt.setString( 1, boardDto.getWriter() );
			pstmt.setString( 2, boardDto.getSubject() );
			pstmt.setString( 3, boardDto.getPasswd() );
			pstmt.setTimestamp( 4, boardDto.getReg_date() );
			pstmt.setInt( 5, ref );
			pstmt.setString( 6, boardDto.getContent() );
			pstmt.setString( 7, boardDto.getIp() );
			result = pstmt.executeUpdate();			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();
			} catch( SQLException e ) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// 글목록
	public List<BoardDto> getArticles( int start, int end ) {
		List<BoardDto> dtos = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql 
				= 	"select num, writer, subject, passwd, reg_date, readcount, ref, content, ip, r from "
				+		" ( select num, writer, subject, passwd, reg_date, readcount, ref, content, ip, rownum r from "
				+			" ( select * from board order by ref desc) "
				+ 		" order by ref desc)"
				+ 	" where r >= ? and r <= ?";
			pstmt = con.prepareStatement( sql );
			pstmt.setInt( 1, start );
			pstmt.setInt( 2, end );
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				dtos = new ArrayList<BoardDto> ( end-start+1 );
				do {
					BoardDto dto = new BoardDto();
					dto.setNum( rs.getInt( "num" ) );
					dto.setWriter( rs.getString( "writer" ) );
					dto.setSubject( rs.getString( "subject" ) );
					dto.setPasswd( rs.getString( "passwd" ) );
					dto.setReg_date( rs.getTimestamp( "reg_date" ) );
					dto.setReadcount( rs.getInt( "readcount" ) );
					dto.setRef( rs.getInt( "ref" ) );
					dto.setContent( rs.getString( "content" ) );
					dto.setIp( rs.getString( "ip" ) );
					dtos.add( dto );					
				} while( rs.next() );				
			}				
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();
			} catch( SQLException e ) {
				e.printStackTrace();
			}
		}		
		return dtos;
	}
	
	// 글보기 
	public BoardDto getArticle( int num ) {
		BoardDto dto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql = "select * from board where num=?";
			pstmt = con.prepareStatement( sql );
			pstmt.setInt( 1, num );
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				dto = new BoardDto();
				dto.setNum( rs.getInt( "num" ) );
				dto.setWriter( rs.getString( "writer" ) );
				dto.setSubject( rs.getString( "subject" ) );
				dto.setPasswd( rs.getString( "passwd" ) );
				dto.setReg_date( rs.getTimestamp( "reg_date" ) );
				dto.setReadcount( rs.getInt( "readcount" ) );
				dto.setRef( rs.getInt( "ref" ) );
				dto.setContent( rs.getString( "content" ) );
				dto.setIp( rs.getString( "ip" ) );			
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();
			} catch( SQLException e ) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	public void addCount( int num ) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "update board set readcount = readcount + 1 where num=?";
			pstmt = con.prepareStatement( sql );
			pstmt.setInt( 1, num );
			pstmt.executeUpdate();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {	
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();
			} catch( SQLException e ) {
				e.printStackTrace();
			}
		}
	}
	
	// 글수정
	public int check( int num, String passwd ) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			BoardDto boardDto = getArticle( num );
			if( passwd.equals( boardDto.getPasswd() ) ) {
				// 비밀번호가 같다
				result = 1;
			} else {
				// 비밀번호가 다르다
				result = -1;
			}			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();
			} catch( SQLException e ) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// 글수정 처리
	public int modifyArticle( BoardDto boardDto ) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "update board set subject=?, content=?, passwd=? where num=?";
			pstmt = con.prepareStatement( sql );
			pstmt.setString( 1, boardDto.getSubject() );
			pstmt.setString( 2, boardDto.getContent() );
			pstmt.setString( 3, boardDto.getPasswd() );
			pstmt.setInt( 4, boardDto.getNum() );
			result = pstmt.executeUpdate();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();
			} catch( SQLException e ) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// 글삭제
	public int deleteArticle( int num ) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			BoardDto boardDto = getArticle( num );
			int ref = boardDto.getRef();
		
				String sql = "delete from board where num = ?";
				pstmt = con.prepareStatement( sql );
				pstmt.setInt( 1, num );
				result = pstmt.executeUpdate();				
				
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ) rs.close();
				if( pstmt != null ) pstmt.close();
				if( con != null ) con.close();
			} catch( SQLException e ) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
} // class


