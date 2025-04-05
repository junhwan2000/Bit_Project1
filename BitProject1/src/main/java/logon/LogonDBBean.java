package logon;

import org.springframework.stereotype.Service;
import jakarta.annotation.Resource;

@Service
public class LogonDBBean {
	@Resource
	private LogonMapper logonMapper;
		
	// 회원가입
	public int insertMember( LogonDataBean logonDto ) {
		return logonMapper.insertMember( logonDto );			
	}
	
	// 아이디 중복 확인	
	public int check( String userId ) {		
		return logonMapper.check( userId );
	}
	
	// 닉네임 중복 확인 
		public int checkNickname( String nickname ) {		
			return logonMapper.checkNickname( nickname );
		}
		
	// 이메일	
		public int checkEmail( String email ) {		
			return logonMapper.checkEmail( email );
		}
	
	// 로그인	
	public int check( String userId, String passwd ) {		
		int result = 0;		
		int count = check( userId );
		if( count == 1 ) {
			// 아이디가 있다
			LogonDataBean logonDto = getMember( userId );
			if( passwd.equals( logonDto.getPasswd() ) ) {
				// 비밀번호가 같다
				result = 1;
			} else {
				// 비밀번호가 다르다
				result = -1;
			}
		} else {
			// 아이디가 없다
			result = 0;
		}
		return result;
	}
	
	// 회원탈퇴
	public int deleteMember( String userId ) {		
		return logonMapper.deleteMember( userId );		
	}
	
	// 회원 정보 수정
	public LogonDataBean getMember( String userId ) {		
		return logonMapper.getMember( userId );
	}
	
	public int modifyMember( LogonDataBean logonDto ) {
		return logonMapper.modifyMember( logonDto );		
	}
	
} // class

























