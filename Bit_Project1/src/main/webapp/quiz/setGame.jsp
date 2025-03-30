<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
    <%@ include file="../setting.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="<%=project%>setGame.css">

<h2> OX 퀴즈 문제 설정 페이지 </h2>
<script type="text/javascript">

</script>

<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	int length=0;
	try {
		// 드라이버 로딩
		Class.forName( "oracle.jdbc.driver.OracleDriver" );
	
		// DB 연결
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbid = "quiz";
		String dbpasswd = "quiz";
		con = DriverManager.getConnection( url, dbid, dbpasswd );
		
		// Statement 생성
		stmt = con.createStatement();
		
		// Query 전송
		// executeQuery()				select
		// executeUpdate()				insert update delete
		String sql = "null";
		
		sql = "select * from Quizzes order by quiz_id";
	
		rs = stmt.executeQuery( sql );
		
		%>
		<br><br>
		        <form name="form_Questions" action="modifyQnA.jsp" method="POST">
				<div class="button-container">
			    <input type="button" value="문항 추가" id="button_Add">
			    <input type="button" value="설정 완료" onclick="modifyQnA()">
				</div>
		       
		<table border="1" name="table_list" >
			<tr>
				<th> 문제 번호 </th>
				<th> 문제 </th>
				<th> 정답 </th>
				<th> 점수 </th>
				<th> 삭제 </th>
			</tr>
			<%
			while( rs.next() ) {
				//length++;
				%>		
					
				<tr name ="tr_QnA<%=length%>">
					<td name="id_QnA<%=length%>" align="center"><%=length+1%></td>
					<td><input type="text" value="<%=rs.getString( "question" )%>" name="Q" required="true" placeholder="문제를 입력하세요."></td>
					<td>
					<%
					  String check_O;
					  String check_X;
					  
					  if(rs.getString("answer").equals("O")){
				
						     check_O = "checked";
	          		         check_X = "";
	          		  }
					  else{
						     check_O = "";     
						     check_X = "checked";
					  }	
					%>
					
					   <input type="radio" value="O" name="answer<%=length%>" <%=check_O%>> O&nbsp;
					   <input type="radio" value="X" name="answer<%=length%>" <%=check_X%>> X&nbsp;
		   
					</td>
					<td>
				        <input type="number"  min="10" max="300" step="10" value="<%=rs.getString( "score" )%>" name="S">
					</td>
					<td>
				        <input type="button" value="삭제" name="btn_delete" id="<%=length%>" onclick="delete_btn(this.id)">
					</td>
			    </tr>
			
				<%
				length++;
			}

			%>			
		</table>
		</form>
		
		
		
		<%
	} catch( SQLException e ) {
		e.printStackTrace();
	} finally {
		try{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(con != null) con.close();
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
	}
%>
<script type="text/javascript">
var last_num = <%=length%>

function setQid(id){
	let new_id = parseInt(id);
	let prev_id = new_id + 1;
	
	while(document.querySelector("td[name='id_QnA"+prev_id+"']") !=null){
		document.querySelector("td[name='id_QnA"+prev_id+"']").innerText = new_id+1;
		document.querySelector("td[name='id_QnA"+prev_id+"']").setAttribute("name","id_QnA"+new_id);
		document.querySelector("tr[name='tr_QnA"+prev_id+"']").setAttribute("name","tr_QnA"+new_id);
		document.querySelector("input[name='answer"+prev_id+"']").setAttribute("name","answer"+new_id);
		document.querySelector("input[name='answer"+prev_id+"']").setAttribute("name","answer"+new_id);
		document.querySelector("input[id='"+prev_id+"']").setAttribute("id",new_id);

		prev_id++;
		new_id++;
	}	
	last_num--;
}

function delete_btn(id){
    let tr_QnA = document.querySelector("tr[name='tr_QnA"+id+"']");

    // Ajax로 DB 삭제
  //  fetch("deleteQnA.jsp?qid=" + id)
  //      .then(response => response.text())
  //      .then(data => {
  //          console.log("삭제 완료");
  //      }).catch(err => {
   //         console.log("삭제 실패", err);
   //     });

    // 화면에서도 삭제
    tr_QnA.remove();
    setQid(id);
}

 window.addEventListener(
          "DOMContentLoaded", (event)=>{
                	
             let btn_Add = document.getElementById("button_Add");
             btn_Add.addEventListener(
                  "click", (event)=>{
                           
                   let table_QnA = document.querySelector("table[name='table_list']");
                            
                            
                   var new_id = last_num;
                   last_num++;
                  
                   let tr_QnA = document.createElement("tr");
                   tr_QnA.setAttribute("name","tr_QnA"+new_id);
                    
                    let td_num = document.createElement("td");
                    td_num.setAttribute("name","id_QnA"+new_id);
                    td_num.setAttribute("align","center");
                    
                    
                    td_num.innerText = new_id+1;                            
                    
                    let td_Q = document.createElement("td");
                    let text_Q = document.createElement("input");
                    text_Q.setAttribute("name","Q");
                    text_Q.setAttribute("type","text");
                    text_Q.setAttribute("required","true");
                    text_Q.setAttribute("placeholder","문제를 입력하세요.");
                    td_Q.append(text_Q);
                    
                    let td_A = document.createElement("td");
                    td_A.innerHTML += "<input type='radio' value='O' name='answer"+new_id+"' checked> O&nbsp;";
                    td_A.innerHTML += "<input type='radio' value='X' name='answer"+new_id+"'> X&nbsp;";
                    
                    
			       // <input type="number"  min="10" max="300" step="10" value="10" name="S">

                    let td_S = document.createElement("td");
                    let text_S = document.createElement("input");
                    text_S.setAttribute("name","S");
                    text_S.setAttribute("type","number");
                    text_S.setAttribute("value","10");
                    text_S.setAttribute("min","10");
                    text_S.setAttribute("max","300");
                    text_S.setAttribute("step","10");
                    td_S.append(text_S);
                    
                    let td_button = document.createElement("td");
                    let btn_delete = document.createElement("input");
                    btn_delete.setAttribute("name", "btn_delete");
                    btn_delete.setAttribute("type","button");
                    btn_delete.setAttribute("value","삭제");
                    btn_delete.setAttribute("id",new_id);
                    btn_delete.setAttribute("onclick","delete_btn(this.id)");
                    td_button.appendChild(btn_delete);
                    	
                    tr_QnA.appendChild(td_num);
                    tr_QnA.appendChild(td_Q);
                    tr_QnA.appendChild(td_A);
                    tr_QnA.appendChild(td_S);
                    tr_QnA.append(td_button);
                    table_QnA.appendChild(tr_QnA);
                    
                   
                        });
                });
            
            function modifyQnA() {
            	if(last_num==0){
                	alert("문제를 하나 이상 입력해주세요.");
                    return; 
             }
            	    let formData = new URLSearchParams();
                let questions = document.querySelectorAll('input[name="Q"]');
                let scores = document.querySelectorAll('input[name="S"]');

                for(let i = 0; i < questions.length; i++) {
                    let qid = i;			// 인덱스라서 
                    let question = questions[i].value.trim();   
                    let answerInput = document.querySelector('input[name="answer' + qid + '"]:checked');
                    let score = scores[i].value;
                    // 문제 여러개 추가할때 중간을 비워두고 추가하니까 값이 이상하게 들어가서 
                    // 문제를 빈칸없이 작성해야 들어가게 했슴
                    // 삭제를 누르고 설정을 완료해야 삭제가 되게 변경했슴.
                    if (! question) {	
                        alert((i + 1) + "번 문제의 내용이 비어있습니다. 모든 문제를 입력해주세요.");
                        questions[i].focus();
                        return; 
                    }
                    

                    formData.append("qid_QnA", qid);
                    formData.append("Q", question);
                   formData.append("S", score);
                    formData.append("answer" + qid, answerInput.value);
                }
				// 여기도 삭제처럼 ajax로 보냄 
                fetch("modifyQnA.jsp", {
                    method: "POST",
                    headers: { "Content-Type": "application/x-www-form-urlencoded" },
                    body: formData.toString()
                })
                .then(res => res.text())
                .then(result => {
                    alert("설정 완료");
                    console.log(result);
                })
                .catch(err => {
                    alert("전송 실패");
                    console.error(err);
                });
            }


        </script>


