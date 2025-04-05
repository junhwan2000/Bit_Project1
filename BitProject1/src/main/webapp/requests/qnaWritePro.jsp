<%@page import="requests.QnaDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="requests.QnaDAO"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> 문의사항 처리 페이지 </h2>
<script>
<%
QnaDAO dao = new QnaDAO();
Map<String, Object> param = new HashMap<String, Object>();
%>
</script>
<%
    String title = request.getParameter("title");
	String user_id = request.getParameter("user_id");
	String content = request.getParameter("content");
	
	QnaDTO dto = new QnaDTO();
	dto.setTitle(title);         
	dto.setUser_id(user_id);
	//dto.setUser_id(session.getAttribute("UserId").toString());
	dto.setContent(content);
	
	int iResult = dao.insertWrite(dto);
	dao.close();
	
	if(iResult == 1) {
		response.sendRedirect("qnaList.jsp");
	} else {
		%>
		alert("입력 오류가 발생했습니다."); 
        location.href = "qnawrite.do"; // 페이지 이동
        <%
	}
%>
	<!--  
    <script type="text/javascript">
        alert("입력 오류가 발생했습니다."); // error_write 변수를 서버에서 전달받은 경우 변경 가능
        location.href = "qnawrite.do"; // 페이지 이동
    </script>
    } else if (result != null && result == 1) {
        response.sendRedirect("qnawrite.do"); // 서버에서 직접 리다이렉트
    }
    -->
