package logon;
import java.sql.Timestamp;
import lombok.Getter;
import lombok.Setter;
// DTO		Data Transfer Object 		Java Bean
@Getter
@Setter
public class LogonDataBean {
	private String userId;
	private String passwd;
	private String nickname;
	private String email;
	private Timestamp createdAt;
}






