// WWD Wild Web Developer
let msg_user_id = "아이디를 입력하세요";
let msg_passwd = "비밀번호를 입력하세요";
let msg_repasswd = "비밀번호가 일치하지 않습니다.";
let msg_nickname = "닉네임을 입력하세요";
let msg_tel = "전화번호 형식에 맞지 않습니다.";
let msg_email = "이메일 형식에 맞지 않습니다.";
let msg_confirm = "중복확인을 해주세요.";

let error_input = "회원가입에 실패했습니다. \n 잠시 후 다시 시도하세요.";
let error_user_id = "입력하신 아이디가 없습니다. \n 다시 확인하세요.";

let error_passwd = "입력하신 비밀번호가 다릅니다. \n 다시 확인하세요.";
let error_delete = "회원탈퇴에 실패했습니다. \n 잠시 후 다시 시도하세요.";
let error_modify = "회원정부 수정에 실패했습니다. \n 잠시 후 다시 시도하세요.";

let erroralert= (msg) =>{
	alert(msg);
	history.back();
}  

let loginCheck = (event) =>{
	let user_id = document.querySelector( "input[name='user_id']" );
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
		if (mainform){
		mainform.addEventListener(
			"submit",
				loginCheck
		);
	}
		// 가입 페이지 
		let inputform = document.querySelector( "form[name='inputform']" );
		if(inputform){
		inputform.addEventListener(
					"submit",
					(event) => {
					
						loginCheck(event);
						let user_id = document.querySelector("input[name='user_id']");
						let passwd = document.querySelector("input[name='passwd']");
						let repasswd = document.querySelector("input[name='repasswd']");
						let nickname = document.querySelector("input[name='nickname']");
						
						if (user_id.value && passwd.value){
							if(passwd.value != repasswd.value){
								alert(msg_repasswd);
								event.preventDefault();
								passwd.focus();
							}	else if (! nickname.value){
								alert(msg_nickname);
								event.preventDefault();			
								nickname.focus();
							}	 else {
							let confirm = document.querySelector("input[name='confirm']");											
								if( confirm.value == "0" ) {
									alert(msg_confirm);
									event.preventDefault();
									
							}	
						}
	
						let email1= document.querySelector("input[name='email1']");
						let email2= document.querySelector("select[name='email2']");
						if( email1.value) {
							if (email2.value == "1"){
								if (email1.value.indexOf("@") == -1){
									alert(msg_email);
									event.preventDefault();
								}
								
							} else {
								if (email1.value.indexOf("@") != -1 ){
									alert(msg_email);
									event.preventDefault();							
								}
							}
							email1.focus();
							
						}	// 이메일을 입력했을때
						
					}	// 아이디 비밀번호가 있으면 
				}	// submit 이벤트 핸들러
			);
			
			// 중복 확인 페이지 
					let confirm = document.querySelector("input[value='중복확인']");
					
					confirm.addEventListener(
						"click",(event) => {
							let user_id = document.querySelector("input[name='user_id']");
							if (! user_id.value) {
								alert(msg_user_id);
								user_id.focus();
							}	else {
								let url = "logonconfirmid.do?user_id=" + user_id.value;
								open(url,"confirm","scrollbar=no, satusbar=no, titlebar=no, menubar = no, width=400px, height=250px");
							}	
							
						}
					);
					
		} // inputform이 있으면
		// 중복 확인 페이지 
	
		let confirmform = document.querySelector("form[name='confirmform']");
		if(confirmform){
			confirmform,addEventListener(
				"submit",
				(event) => {
					let user_id = document.querySelector("input[name='user_id']");
					if (! user_id.value) {
						alert(msg_user_id);
						event.preventDefault();
						user_id.focus();
					}
				}
			);
		}	// confirmform이 있으면
		
		// 로그인 
		let loginform = document.querySelector("form[name='loginform']");
		if (loginform){
		loginform.addEventListener(
			"submit",
			loginCheck
			);
		}
		
		// 회원탈퇴
		let passwdform = document.querySelector("form[name='passwdform']");
		if(passwdform){
		passwdform.addEventListener(
			"submit",
			(event) => {
				let passwd = document.querySelector("input[name='passwd']");
				if(! passwd.value){
					alert(msg_passwd);
					event.preventDefault();
					passwd.focus();
					
					}
				
				}
			
			);
		}
		// 회원정보 수정
		let modifyform = document.querySelector("form[name='modifyform']");
		if (modifyform){
			modifyform.addEventListener(
			"submit",
			(event) => {
				let passwd = document.querySelector("input[name='passwd']");
				let repasswd = document.querySelector("input[name='repasswd']");
				if (! passwd.value){
					alert(msg_passwd); 
					event.preventDefault();
					passwd.focus();
				} else if (passwd.value != repasswd.value){
					alert(msg_repasswd);
					event.preventDefault();
					passwd.focus();
				} 
				
				let email1 = document.querySelector("input[name='email1']");
				let email2 = document.querySelector("input[name='email2']");
				if (email1.value || email2.value){
					if (! email1.value || ! email2.value
						|| email1.value.indexof("@") != -1
						|| email2.value.indexof("@") != -1
					) {
						alert(msg_email);
						event.preventDefault();
						email1.focus();
						
					}
				}
			}
			);
		}
	}	
);


let setuser_id = (user_id) => {
				opener.document.inputform.user_id.value = user_id;
				opener.document.inputform.confirm.value = "1";
				window.close();
			}
