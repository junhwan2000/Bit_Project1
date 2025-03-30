<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<div class="timer">Timer: <span id="timeout"></span> </div>
	<div style="position:absolute; top:25%; left:10%;">
		<input type="text" name="show_word" readonly style="width:500px;height:300px;font-size:100px;text-align:center;">
	</div>
	<div style="position:absolute; top:25%; left:50%;">
		<input type="text" name="user_input" style="width:500px;height:300px;font-size:100px;text-align:center;">
	</div>
	<br>
		<div name="definition" border="1" style="position:absolute; top:60%; left:25%; width:600px; height:200px; font-size:20px; border-style:solid">
	</div>
	<script>
	
		var div_def = document.querySelector("div[name='definition']");
		var num=0;
		var user_input = document.querySelector("input[name='user_input']");
		var view_word = null;
		var check_word = null;
		var pos = null;
		const tspan = document.querySelector("#timeout");
		
		// 타이머 구현
		// 9초간 아무 값이 없을시,
		// setTimer를 사용하여 1000 뒤에 시간이 초과되었습니다 출력
		// 딱 한번 실행되니 이걸 반복
		window.addEventListener( "DOMContentLoaded", () => {
			
			let interval;
			time = 10;
	        tspan.innerText = time;
			
			function startTimer() {
				setTimeout(() => {
					tspan.innerText = time--;
					alert( "Time Out" );
				}, 10000);
			}
			
			function timeAlert() {
				setTimeout(() => {
					alert( "5초가 경과했습니다." );
				}, 5000 )
			}
				
			startTimer();
			timeAlert();
			
			// 끝말잇기
			user_input.addEventListener("keydown",(event)=>{
			  if(event.key=="Enter"){
			     var str = user_input.value.trim();  
			     
			     if( str.length < 2 ) {
			    	 alert( "단어는 두 글자 이상이어야 합니다." );
			    	 return;
			     }
			     
			     if(num>0){ 
			         if(view_word.charAt(view_word.length-1)!=str.charAt(0))
			             alert("틀렸습니다!");
			         else{
			    	     check(user_input.value);
			         }
			     }
			     else if(user_input.value != null)
				     check(user_input.value);
			     
			     user_input.value = "";
			     // clearInterval( interval );
			     startTimer();
				 timeAlert();
			     
			   }
			});
			
			let total = null;
			let def = null;
			function showUserInput(word){
			 var show_word = document.querySelector("input[name='show_word']");
			 
			 show_word.value = word;
			 num++;
			
			}
			function check(word){
				var url = 'https://krdict.korean.go.kr/api/search?key='; /*URL*/
				var queryParams = '3E3D8330155B7C1E8D840B4414F32D93'; /*서비스키*/
				queryParams += '&type_search=search&part=word&q=';
				queryParams += encodeURIComponent(word); /*단어*/
				
				fetch(url+queryParams)
				  .then((data)=>data.text())
				  .then((text)=>{
					  total = text.slice(text.indexOf("<total>")+7,text.indexOf("</total>"));
					  check_word = text.slice(text.indexOf("<word>")+6, text.indexOf("</word>"));
				      def = text.slice(text.indexOf("<definition>")+12, text.indexOf("</definition>"));
				      pos = text.slice(text.indexOf("<pos>")+5, text.indexOf("</pos>"));
				      
				      if(check_word == word && pos=="명사"){
				          if(parseInt(total) > 0){
				    	        // div_def.textContent = total + "\n" + def;
				    	         div_def.textContent = def + "\n";
				    	         view_word = word;
					         showUserInput(word);
				          }
				      }
				      else{
				    	      div_def.textContent = word+"는(은) 없는 단어 입니다.\n";
				      }
				      
				      
			      })
				  .catch(error => {
				    // 오류 처리
				    alert("오류 / 인터넷 연결 확인");
				  });
			} // 끝말잇기 부분 
			
		}); //  타이머 동작 부분
		
	</script>
</body>
</html>