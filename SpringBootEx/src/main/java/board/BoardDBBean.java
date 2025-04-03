package board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

// DAO
@Service
public class BoardDBBean {	
	@Autowired
	private BoardMapper boardMapper;
	
	public int getCount() {		
		return boardMapper.getCount();
	}
	
	// 글쓰기
	public int insertArticle( BoardDataBean boardDto ) {		
		int num = boardDto.getNum();
		int ref = boardDto.getRef();
		int re_step = boardDto.getRe_step();
		int re_level = boardDto.getRe_level();
		if( num == 0 ) {
			// 제목글			
			int maxNum = boardMapper.maxNum();		
			if( maxNum == 0 ) {
				// 글이 없는 경우
				ref = 1;
			} else {
				// 글이 있는 경우
				ref = maxNum + 1;		// 글번호 최대값 + 1
			}				
			re_step = 0;
			re_level = 0;
		} else {
			// 답변글			
			boardMapper.addReply( boardDto );			
			re_step ++;
			re_level ++;
		}		
		boardDto.setRef( ref );
		boardDto.setRe_step( re_step );
		boardDto.setRe_level( re_level );
		return boardMapper.insertArticle( boardDto );
	}

	public List<BoardDataBean> getArticles( Map<String, Integer> map ) {
		return boardMapper.getArticles( map );
	}
	
	// 글보기 
	public BoardDataBean getArticle( int num ) {			
		return boardMapper.getArticle( num );
	}
	
	public void addCount( int num ) {		
		boardMapper.addCount( num );
	}
	
	// 글수정
	public int check( int num, String passwd ) {
		int result = 0;
		BoardDataBean boardDto = getArticle( num );
		if( passwd.equals( boardDto.getPasswd() ) ) {
			// 비밀번호가 같다
			result = 1;
		} else {
			// 비밀번호가 다르다
			result = -1;
		}
		return result;
	}
	
	// 글수정 처리
	public int modifyArticle( BoardDataBean boardDto ) {		
		return boardMapper.modifyArticle( boardDto );
	}
	
	// 글삭제
	public int deleteArticle( int num ) {
		BoardDataBean boardDto = getArticle( num ); 		
		int result = 0;
		// 답글 확인		
		int countReply = boardMapper.checkReply( boardDto );
		if( countReply != 0 ) {
			// 답글이 있는 경우
			result = -1;
		} else {
			// 답글이 없는 경우
			boardMapper.deleteReply( boardDto );
			result = boardMapper.deleteArticle( num );
		}			
		return result;
	}
	
	
} // class














