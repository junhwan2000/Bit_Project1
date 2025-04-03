	package board;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

// DTO
@Setter
@Getter
public class BoardDataBean {
	private int num;				// 글번호
	private String writer;			// 작성자
	private String subject;			// 글제목
	private String passwd;			// 비밀번호
	private Timestamp reg_date;		// 작성일
	private int readcount;			// 조회수
	private int ref;				// 그룹화아이디
	private int re_step;			// 글순서
	private int re_level;			// 글레벨
	private String content;			// 글내용
	private String ip;				// IP
}









