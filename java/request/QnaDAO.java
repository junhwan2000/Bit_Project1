package request;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class QnaDAO extends JDBConnect{
	public QnaDAO() {}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM requests";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch (Exception e) {
			System.out.println( "예외 발생" );
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	public List<QnaDTO> selectList(Map<String, Object> map) {
		List<QnaDTO> bbs = new Vector<QnaDTO>();
		
		String query = "SELECT * FROM requests";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				QnaDTO dto = new QnaDTO();
				
				dto.setNum( rs.getString("num"));
				dto.setTitle( rs.getString("title"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setContent( rs.getString( "content" ));
				dto.setReg_date( rs.getTimestamp( "reg_date" ));
				dto.setRef( rs.getInt( "ref"));
				dto.setRe_step( rs.getInt( "re_step" ));
				dto.setRe_level( rs.getInt( "re_level" ));
				
				bbs.add(dto);
				}
			}
			catch (Exception e) {
				System.out.println( "예외 발생" );
				e.printStackTrace();
			}
			
			return bbs;
		}
	
	// 글 작성
	public int insertWrite( QnaDTO dto ) {
		int result=0;
		
		try {
			String query = "insert into requests( "
						+ " num,title,user_id,content) "
						+ " values ( "
						+ " seq_req_num.NEXTVAL, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getUser_id());
			psmt.setString(3, dto.getContent());
			
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println( "예외 발생" );
			e.printStackTrace();
		}
		
		return result;
	}

}
