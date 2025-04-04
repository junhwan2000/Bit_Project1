// WWD Wild Web Developer
let msg_user_id = "아이디를 입력하세요";
let msg_passwd = "비밀번호를 입력하세요";
let msg_repasswd = "비밀번호가 일치해야 합니다";
let msg_nickname = "이름을 입력하세요";
let msg_email = "이메일을 입력하세요";
let msg_confirm_user_id = "중복된 아이디 입니다.";
let msg_confirm_nickname = "중복된 닉네임 입니다.";
let msg_confirm_email = "중복된 이메일 입니다.";

let error_input = "회원가입에 실패했습니다.\n잠시 후 다시 시도하세요";
let error_user_id = "입력하신 아이디가 없습니다.\n다시 확인하세요.";
let error_passwd = "입력하신 비밀번호가 다릅니다.\n다시 확인하세요.";
let error_delete = "회원탈퇴에 실패했습니다.\n잠시 후 다시 시도하세요";
let error_modify = "회원정보수정에 실패했습니다.\n잠시 후 다시 시도하세요";

let erroralert = ( msg ) => {
	alert( msg );
	history.back();
}
	
let loginCheck = ( event ) => {
	let user_id = document.querySelector( "input[name='userId']" );
	let passwd = document.querySelector( "input[name='passwd']" );
	if( ! user_id.value ) {
		alert( msg_user_id );
		event.preventDefault();
		user_id.focus();
	} else if( ! passwd.value ) {
		alert( msg_passwd );
		event.preventDefault();
		passwd.focus();
	}	
}
window.addEventListener(
	"DOMContentLoaded",
	() => {
		// 메인 페이지 
		let mainform = document.querySelector( "form[name='mainform']" );
		if( mainform ) {
			mainform.addEventListener(
				"submit",
				loginCheck
			);
		}
		
		// 가입 페이지				
		let inputform = document.querySelector( "form[name='inputform']" );
		if( inputform ) {
			inputform.addEventListener(
				"submit",
				( event ) => {										
					loginCheck( event );
					let user_id = document.querySelector( "input[name='userId']" );
					let passwd = document.querySelector( "input[name='passwd']" );
					let repasswd = document.querySelector( "input[name='repasswd']" );
					let nickname = document.querySelector( "input[name='nickname']" );	
					let email = document.querySelector( "input[name='email']" );
					if( user_id.value && passwd.value ) {						
						if( passwd.value != repasswd.value ) {
							alert( msg_repasswd );
							event.preventDefault();	
							passwd.focus();
						} else if( ! nickname.value ) {
							alert( msg_nickname );
							event.preventDefault();
							nickname.focus();
						} else if (! email.value) {	
							alert( msg_email )
							event.preventDefault();
							email.focus();
						} else {
							let confirm = document.querySelector( "input[name='confirm']" );						
							if( confirm.value == "0" ) {
								alert( msg_confirm );
								event.preventDefault();
							}								
						}	 
										
					} // 아이디 / 비밀번호가 있으면 
				} // submit 이벤트 핸들러
			);
			
			// 중복 확인 페이지
			let confirm = document.querySelector( "input[value='중복확인']" );			
			confirm.addEventListener(
				"click",
				( event ) => {
					let userId = document.querySelector( "input[name='id']" );
					if( ! userId.value ) {
						alert( msg_id );
						userId.focus();
					} else {
						let url = "logonconfirmid?id=" + userId.value;	
						open( url, "confirm", "scrollbar=no, satusbar=no, titlebar=no, menubar=no, width=400px, height=250px" );
					}						
				}			
			);			
		} // inputform 이 있으면 
		
		// 중복 확인 페이지	
		let confirmform = document.querySelector( "form[name='confirmform']" );
		if( confirmform ) {
			confirmform.addEventListener(
				"submit",
				( event ) => {
					let userId = document.querySelector( "input[name='id']" );
					if( ! userId.value ) {
						alert( msg_id );
						event.preventDefault();
						userId.focus();
					}
				}
			);	
		} // confirmform 이 있으면  
			
		// 로그인
		let loginform = document.querySelector( "form[name='loginform']" );
		if( loginform ) {
			loginform.addEventListener(
				"submit",
				loginCheck	
			);
		}
		
		// 회원탈퇴
		let passwdform = document.querySelector( "form[name='passwdform']" );
		if( passwdform ) {
			passwdform.addEventListener(
				"submit",
				( event ) => {
					let passwd = document.querySelector( "input[name='passwd']" );
					if( ! passwd.value ) {
						alert( msg_passwd );
						event.preventDefault();
						passwd.focus();
					}	
				}			
			);
		}
		
		// 회원 정보 수정
		let modifyform = document.querySelector( "form[name='modifyform']" );
		if( modifyform ) {
			modifyform.addEventListener(
				"submit",
				( event ) => {
					let passwd = document.querySelector( "input[name='passwd']" );
					let repasswd = document.querySelector( "input[name='repasswd']" );
					if( ! passwd.value ) {
						alert( msg_passwd );
						event.preventDefault();
						passwd.focus();
					} else if( passwd.value != repasswd.value ) {
						alert( msg_repasswd );
						event.preventDefault();
						passwd.focus();
					} else {
						// 아이디 비밀번호가 입력된 경우
						let tel1 = document.querySelector( "input[name='tel1']" );
						let tel2 = document.querySelector( "input[name='tel2']" );
						let tel3 = document.querySelector( "input[name='tel3']" );
						if( tel1.value || tel2.value || tel3.value ) {
							if( tel1.value.length < 3 
								|| tel2.value.length < 3 
								|| tel3.value.length < 4 ) {
									alert( msg_tel );
									event.preventDefault();
									tel1.focus();
								}	
						}
						
						let email1 = document.querySelector( "input[name='email1']" );
						let email2 = document.querySelector( "input[name='email2']" );
						if( email1.value || email2.value ) {
							if( ! email1.value || ! email2.value 
								|| email1.value.indexOf( "@" ) != -1 
								|| email2.value.indexOf( "@" ) != -1
							) {
								alert( msg_email );
								event.preventDefault();
								email1.focus();
							}	
						}							
					}						
				}							
			);	
		}
		
	
	}	
);

let setuserId = ( userId ) => {
	opener.document.inputform.id.value = userId;
	opener.document.inputform.confirm.value = "1";
	window.close();			
}	





