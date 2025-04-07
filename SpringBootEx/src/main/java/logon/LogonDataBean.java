package logon;


import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

// DTO		Data Transfer Object 		Java Bean
// VO		setter()가 없다
@Getter
@Setter
public class LogonDataBean {
	private String user_id;
	private String passwd;
	private String nickname;
	private String email;
	private Timestamp created_at;
	private String auth;
}






