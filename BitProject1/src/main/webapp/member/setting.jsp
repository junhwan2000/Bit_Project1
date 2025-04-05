<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String project = "/BitProject1/member/";
	// 경로 지정
	String path = request.getContextPath();
	pageContext.setAttribute( "project", path + "/static/logon/" );

	String page_main = "메 인 페 이 지";
	String page_input = "회 원 가 입";
	String page_confirm = "아이디 중복 확인";
	String page_login = "로 그 인";
	String page_delete = "회 원 탈 퇴";
	String page_modify = "회원 정보 수정";
	
	String msg_main = "비회원이시면 회원가입을 해주세요";
	String msg_main_login = "님 안녕하세요";
	String msg_input = "회원정보를 입력해주세요.";
	String msg_confirm_o = "는 사용할 수 있습니다.";
	String msg_confirm_x = "는 사용할 수 없습니다.";
	String msg_login = "회원가입에 성공했습니다.";
	String msg_passwd = "비밀번호를 다시 확인해주세요.";
	String msg_modify = "수정할 정보를 입력하세요.";
	
	String str_user_id = "아이디";
	String str_passwd = "비밀번호";
	String str_repasswd = "비밀번호재확인";
	String str_nickname="닉네임";
	String str_email = "이메일";
	String str_create_at = "가입일자";
	
	String btn_login = "로그인";
	String btn_main = "메인페이지";
	String btn_ok = "확인";
	String btn_cancel = "취소";
	String btn_input = "회원가입";
	String btn_modify = "정보수정";
	String btn_delete = "회원탈퇴";
	String btn_logout = "로그아웃";
	String btn_confirm = "중복확인";
	String btn_input_cancel = "가입취소";
	String btn_del = "탈퇴";
	String btn_del_cancel = "탈퇴취소";
	
	String btn_mod = "수정";
	String btn_mod_cancel = "수정취소";
	
%>
    
    