package dto;

import java.sql.Timestamp;
import lombok.Getter;
import lombok.Setter;

//DTO
@Setter
@Getter
public class BoardDto {
	private int num;			// 글번호
	private String writer;		// 작성자
	private String subject;		// 글제목
	private String passwd;  	// 비밀번호
	private Timestamp reg_date; // 작성날짜
	private int readcount;		// 조회수
	private int ref;			// 그룹화아이디
	private String content;		// 글내용
	private String ip;			// 아이피
}
