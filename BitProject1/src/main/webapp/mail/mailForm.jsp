<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html>
<head>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <meta charset="UTF-8">
    <title>mail test</title>
</head>
<body>
		이메일을 입력하세요 : <input type="text" name="toEmail">
		<input type="submit" value="전송" name="btn_submit">
		<br>
        <input type="text" name="emailAuth" style="display:none">
        <input type="submit" value="인증" name="btn_auth" style="display:none">
	<script>
		let test=null;
		window.addEventListener("DOMContentLoaded",()=>{
            let btn_submit = document.querySelector("input[name='btn_submit']");
            btn_submit.addEventListener("click",()=>{
				let toEmail = document.querySelector("input[name='toEmail']").value;
				
				if(toEmail != ""){
					fetch('/sendmail', {

					  method: 'POST',

					  body: toEmail,

					})
					//.then(response => response.json())
					 .then(key => console.log(key))
					 .catch(error => console.log('Error:', error));

						let btn_auth= document.querySelector("input[name='btn_auth']");
						btn_auth.setAttribute("style","");
						
					}
				
				   
				else{
					alert("이메일을 입력해주세요.");
				}
			
				});
				//let emailAuth = document.querySelector("input[name='emailAuth']");
				//                emailAuth.setAttribute("style","display:''");
               // let btn_auth = document.querySelector("input[name='btn_auth']");
               // btn_auth.setAttribute("style","display:''");
        });
		
	</script>
</body>
</html>
