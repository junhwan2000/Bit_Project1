<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" name="show_word" readonly>
<br>
<input type="text" name="user_input">
<br>
<br>
<div name="definition" border="1" style="width:400px; height:600px; border-style:solid">
</div>
<script>

var div_def = document.querySelector("div[name='definition']");
var num=0;
var user_input = document.querySelector("input[name='user_input']");
var view_word = null;
user_input.addEventListener("keydown",(event)=>{
  if(event.key=="Enter"){
     var str = user_input.value;  
     if(num>0){
         if(view_word.charAt(view_word.length-1)!=str.charAt(0))
             alert("틀렸습니다!");
         else{
    	     check(user_input.value);

         }
     }
     else if(user_input.value != null)
	     check(user_input.value);
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
	      def = text.slice(text.indexOf("<definition>")+12, text.indexOf("</definition>"));
	      
	      if(parseInt(total) > 0){
	    	  div_def.textContent = total + "\n" + def;
	    	  view_word = word;
		      showUserInput(word);
	      }
	      else{
	    	      div_def.textContent = word+"는(은) 없는 단어 입니다.\n";
	      }
	      
	      
      })
	  .catch(error => {
	    // 오류 처리
	    alert("오류");
	  });
}

</script>
</body>
</html>