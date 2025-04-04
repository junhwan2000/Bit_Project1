package logon;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LogonMapper {
	public int insertMember( LogonDataBean dto );
	public int check( String user_id );
	public int check( String user_id, String passwd );
	public int checkNickname( String nickname );
	public int checkEmail( String email );
	public int deleteMember( String user_id );
	public LogonDataBean getMember( String user_id );
	public int modifyMember( LogonDataBean memberDto );
}
