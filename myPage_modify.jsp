<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="mypageForm.jsp"/>
  <div border="1" name="div_page" 
  style="position:absolute; transform: translate(280px,0px); width:500px; height:300px;">
  <jsp:include page="modifyForm.jsp"/>
  </div>
</body>
</html>