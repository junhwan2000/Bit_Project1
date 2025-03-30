package dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class UserDto {
	private String user_id;
	private String passwd;
	private String nickname;
	private String email;
	private Timestamp create_at;
	private Timestamp delete_at;
	private String block_id;
	private String ip;
	private int rank_score;
	private int is_correct; 
}
