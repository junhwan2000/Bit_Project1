package board;

import java.util.List;
import java.util.Map;

public interface BoardMapper {
	public int getCount();
	public int maxNum();
	public void addReply( BoardDataBean boardDto );
	public int insertArticle( BoardDataBean boardDto );
	public List<BoardDataBean> getArticles( Map<String, Integer> map );
	public BoardDataBean getArticle( int num );
	public void addCount( int num );
	// public int check( int num, String passwd );
	public int modifyArticle( BoardDataBean boardDto );
	public int checkReply( BoardDataBean boardDto );
	public void deleteReply( BoardDataBean boardDto );
	public int deleteArticle( int num );
}






