<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.SQLException"%>

<h2> JDBC - problem-answer insert</h2>

<%
   request.setCharacterEncoding("utf-8");
%>
<%
   String id[] = request.getParameterValues("id_QnA");
   String questions[] = request.getParameterValues("Q");
   String answers[]= new String[questions.length];
   
   for(int i=0; i<questions.length;i++){
	   String temp[] = request.getParameterValues("answer"+(i+1));
	   answers[i] = temp[0];
	   out.println(answers[i]);
   }
%>
alert(<%=questions.length%>);

<%
   Connection con = null;
   Statement stmt = null;
   
   try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbid = "bit";
        String dbpasswd = "bit";
        con = DriverManager.getConnection(url, dbid, dbpasswd);
        stmt = con.createStatement();
      
        for(int i=0; i< questions.length; i++){
           String sql = "merge into QnA q using dual d on(q.id='"+(i+1)+"') "
        		           +"when matched then "
        		           +"update set q.problem='"+questions[i]+"', q.answer='"+answers[i]+"' "
        		           +"when not matched then "
        		           +"insert (q.id, q.problem, q.answer) "
        		           +"values ("+(i+1)+", '"+questions[i]+"', '"+answers[i]+"')";
           int result = stmt.executeUpdate(sql);
   
           if(result == 0){
	       %>
	        insert에 실패하였습니다. <br>
	       <%}
       }
   }catch(SQLException e){
	   e.printStackTrace();
   }finally{
	   try{
		   if(stmt != null) stmt.close();
		   if(con != null) con.close();
	   }catch(SQLException e){
		   e.printStackTrace();
	   }
   }
   
%>