package requests;

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

// DAO
public class RequestDBBean {
	private static RequestDBBean instance = new RequestDBBean();
	public static RequestDBBean getInstance() {
		return instance;
	}
	public Connection getConnection() throws NamingException, SQLException {
		Context initCtx = new InitialContext();	
		Context envCtx = (Context) initCtx.lookup( "java:comp/env" );	// 돌려주는게 object -> 형변환
		DataSource ds = (DataSource) envCtx.lookup( "jdbc/bit" );
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
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if( rs.next() )						// 데이터 꺼내기 전에 한줄 꼭 줘야함.
				count = rs.getInt( 1 );			// 원래는 getInt( conunt(*) ) 이건데, 이러면 매번 복잡하니 인덱스로 받는 함수가 있음
												// 첫번째거 데이터를 가져오겠다. ( 사실 카운트 하나만 나오기 때문에 두번째것도 없음 ) 
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
	public int insertRequest(RequestDataBean RequestDTO) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			/*						ref			re_step			re_level
			1 	제목글				8			0				0
			2	ㄴ 답글				8			1				1				// 부모글의 값을 그대로 가져온 후 1씩 증가  -> 후에 DB에 넣음
			3	  ㄴ 재답글			8			2				2
			
									ref			re_step			re_level
			1 	제목글				8			0				0
			2	ㄴ 답글				8			2				1				
			3	  ㄴ 재답글			8			3				2
			4	ㄴ 답글				8			1				1				// 부모글을 가져오면 8 0 0 이 되어버림 -> '최신답글 올릴거냐? 내릴거냐?'
																				// 내릴거면 숫자를 올리면 되는데, 올릴거면 부모값을 갖고 자기보다 step이 큰 애들을 밀어버림
			
			// 정렬 후				ref			re_step			re_level	
			1 	제목글				8			0				0
			2	ㄴ 답글				8			1				1	
			3	ㄴ 답글				8			2				1				
			4	  ㄴ 재답글			8			3				2	
			 */
			int num = RequestDto.getNum();
			int ref = RequestDto.getRef();
			int re_step = RequestDto.getRe_step();
			int re_level = RequestDto.getRe_level();
			String sql = null;
			
			if( num == 0 ) {
				// 제목글		제목글들 중에서 ref 가 큰걸 위로 올릴거임.(정렬할 때)
				sql = "select max( num ) from board";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if( ! rs.next() ) {
					// 글이 없는 경우
					ref = 1;
				} else {
					// 글이 있는 경우
					ref = rs.getInt( 1 ) + 1;	// 글번호 최대값 + 1
				}
				re_step = 0;
				re_level = 0;
			} else {
				// 답변글
				sql = "update board set re_step = re_step + 1 where ref = ? and re_step > ?";	// ? 이게 내 값
				pstmt = con.prepareStatement(sql);
				pstmt.setInt( 1 , ref );	// ? 채워주기
				pstmt.setInt( 2,  re_step );
				pstmt.executeUpdate();
				
				re_step ++;
				re_level ++;
			}
			sql = "insert into board( num, writer, subject, passwd, reg_date, ref, re_step, re_level, content, ip )"
					+ "values( board_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
			pstmt = con.prepareStatement(sql);
			pstmt.setString( 1, boardDto.getWriter() );
			pstmt.setString( 2,  boardDto.getSubject() );
			pstmt.setString( 3, boardDto.getPasswd() );
			pstmt.setTimestamp( 4, boardDto.getReg_date() );
			pstmt.setInt( 5, ref );	// getDto 하면 절대 안되지 ! 위에 계산한 거 넣어야지.
			pstmt.setInt( 6,  re_step );
			pstmt.setInt( 7,  re_level );
			pstmt.setString( 8, boardDto.getContent() );
			pstmt.setString( 9, boardDto.getIp() );
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
	public List<RequestDataBean> getArticles( int start, int end ) {		// ArrayList 의 부모인 List 로 받는 "느슨한 결합" ( 부모는 자식을 받으니 )
		List<RequestDataBean> dtos = null;	// List 인터페이스라서 객체 생성 X -> 자식으로 받아야 함
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql 
				= 	"select num, writer, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip, r from "
				+		" ( select num, writer, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip, rownum r from "
				+			" ( select * from board order by ref desc, re_step asc ) "
				+ 		" order by ref desc, re_step asc )"
				+ 	" where r >= ? and r <= ?";
			pstmt = con.prepareStatement( sql );
			pstmt.setInt( 1, start );
			pstmt.setInt( 2, end );
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				dtos = new ArrayList<RequestDataBean> ( end-start+1 );
				do {
					RequestDataBean dto = new RequestDataBean();
					dto.setNum( rs.getInt( "num" ) );
					dto.setWriter( rs.getString( "writer" ) );
					dto.setSubject( rs.getString( "subject" ) );
					dto.setPasswd( rs.getString( "passwd" ) );
					dto.setReg_date( rs.getTimestamp( "reg_date" ) );
					dto.setReadcount( rs.getInt( "readcount" ) );
					dto.setRef( rs.getInt( "ref" ) );
					dto.setRe_step( rs.getInt( "re_step" ) );
					dto.setRe_level( rs.getInt( "re_level" ) );
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
	public RequestDataBean getArticle( int num ) {
		RequestDataBean dto = null;
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
				dto = new RequestDataBean();
				dto.setNum( rs.getInt( "num" ) );
				dto.setWriter( rs.getString( "writer" ) );
				dto.setSubject( rs.getString( "subject" ) );
				dto.setPasswd( rs.getString( "passwd" ) );
				dto.setReg_date( rs.getTimestamp( "reg_date" ) );
				dto.setReadcount( rs.getInt( "readcount" ) );
				dto.setRef( rs.getInt( "ref" ) );
				dto.setRe_step( rs.getInt( "re_step" ) );
				dto.setRe_level( rs.getInt( "re_level" ) );
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
			RequestDataBean boardDto = getArticle( num );
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
}	// class
