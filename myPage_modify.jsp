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
  <div border="1" name="div_page" style="width:500px; height:300px; position: absolute; top:10%; left:50%; border-style:solid">
  <jsp:include page="modifyForm.jsp"/>
  </div>
</body>
</html>