package logon;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LogonMapper {
	public int insertMember( LogonDataBean dto );
	public int check( String userId );
	public int check( String userId, String passwd );
	public int checkNickname( String nickname );
	public int checkEmail( String email );
	public int deleteMember( String userId );
	public LogonDataBean getMember( String userId );
	public int modifyMember( LogonDataBean memberDto );
}
