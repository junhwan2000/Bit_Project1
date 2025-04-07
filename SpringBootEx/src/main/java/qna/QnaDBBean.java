package qna;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaDBBean {
	@Autowired
	private QnaMapper qnaMapper;

	public int getCount() {
		return qnaMapper.getCount();
	}

	// 글쓰기
	public int insertArticle(QnaDataBean qnaDto) {
		int num = qnaDto.getNum();
		int ref = qnaDto.getRef();
		int re_step = qnaDto.getRe_step();
		int re_level = qnaDto.getRe_level();

		if (num == 0) {
			// 새 글 (제목글)
			int maxNum = qnaMapper.maxNum();
			ref = (maxNum == 0) ? 1 : maxNum + 1;
			re_step = 0;
			re_level = 0;
		} else {
			// 답변글
			qnaMapper.addReply(qnaDto);
			re_step++;
			re_level++;
		}

		qnaDto.setRef(ref);
		qnaDto.setRe_step(re_step);
		qnaDto.setRe_level(re_level);
		return qnaMapper.insertArticle(qnaDto);
	}

	public List<QnaDataBean> getArticles(Map<String, Integer> map) {
		return qnaMapper.getArticles(map);
	}

	public QnaDataBean getArticle(int num) {
		return qnaMapper.getArticle(num);
	}

	// 글수정 처리
	public int modifyArticle(QnaDataBean qnaDto, String loginUserId) {
		QnaDataBean origin = getArticle(qnaDto.getNum());

	    if (!origin.getUser_id().equals(loginUserId)) {
	        return -2; // 권한 없음
	    }

	    return qnaMapper.modifyArticle(qnaDto);
	}


	// 글 삭제 ( 자기가 쓴 글 만 가능 )
	public int deleteArticle(int num, String loginUserId) {
		QnaDataBean qnaDto = getArticle(num);

	    // 작성자 검증
	    if (!qnaDto.getUser_id().equals(loginUserId)) {
	        return -2; // 권한 없음
	    }

	    int result = 0;
	    int countReply = qnaMapper.checkReply(qnaDto);

	    if (countReply != 0) {
	        result = -1; // 답글 있음
	    } else {
	        qnaMapper.deleteReply(qnaDto);
	        result = qnaMapper.deleteArticle(num);
	    }

	    return result;
	}

}
