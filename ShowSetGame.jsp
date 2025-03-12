<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h2> 문제 데이터가 넘어왔나용? </h2>

<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   String questions[] = request.getParameterValues("Q");
   String answers[] = request.getParameterValues("A");

   out.println(questions.length);
%>
<table border='1'>
<tr>
  <th>문제</th>
  <th>정답</th>
</tr>

<%
  for(int i=0; i<questions.length; i++){
	  %>
	  <tr>
	     <td><%=questions[i]%></td>
	     <td><%=answers[i]%></td>
	  </tr>
  <%}
%>
</table>

