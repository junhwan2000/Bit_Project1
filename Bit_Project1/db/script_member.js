window.addEventListener(
        	"DOMContentLoaded", ()=>{
	            let subbtn = document.querySelector("input[name='sub_btn']");
	            	subbtn.addEventListener(
	            		"click", 
						() =>{
	            		  let id = document.querySelector("input[name='id']").value;
	            		  let passwd = document.querySelector("input[name='passwd']").value;
	                      let repasswd = document.querySelector("input[name='repasswd']").value;
		            	  let nickname = document.querySelector("input[name='nickname']").value;
		            	 if (id == ""){
		                    alert("아이디를 입력해주세요.");
							event.preventDefault();
		            	 } else if (passwd == ""){
			                alert("비밀번호를 입력해주세요.");
							event.preventDefault();
		            	 } else if (nickname == ""){
				            alert("닉네임을 입력해주세요.");
							event.preventDefault();
	  	            	 } else if (passwd != repasswd) {
	                      	alert("비밀번호가 다릅니다.");
							event.preventDefault();
		            }
				}
			);
		}		
	);          