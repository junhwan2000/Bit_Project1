<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> 404 에러 페이지 </h2>
<%
	response.setStatus(HttpServletResponse.SC_OK);
%>
URL 경로에러입니다. <br>
URL 폴더명이나 파일을 다시 확인하세요. <br>