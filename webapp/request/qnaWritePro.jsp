<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> 문의사항 처리 페이지 </h2>
<%
    Integer result = (Integer) request.getAttribute("result"); // 서블릿에서 넘긴 result 값 가져오기
    if (result != null && result == 0) {
%>
    <script type="text/javascript">
        alert("입력 오류가 발생했습니다."); // error_write 변수를 서버에서 전달받은 경우 변경 가능
        location.href = "qnawrite.do"; // 페이지 이동
    </script>
<%
    } else if (result != null && result == 1) {
        response.sendRedirect("qnawrite.do"); // 서버에서 직접 리다이렉트
    }
%>