<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.BoardDto"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=project%>style_board.css">
<script type="text/javascript" src="<%=project%>script_board.js"></script>

<%
	int num = (int) request.getAttribute("num");
	String pageNum = (String) request.getAttribute("pageNum");
	int number = (int) request.getAttribute("number");
	BoardDto boardDto = (BoardDto) request.getAttribute("boardDto");
%>

<h2><%=page_content %></h2>

<br>

<table style="width:700px">
	<tr>
		<th class="input" style="width:20%"><%=str_num %></th>
		<td class="label" style="text-align: center; width:20%;"><%=number %></td>
		<th class="input" style="width:20%"><%=str_readcount %></th>
		<td class="label" style="text-align: center"><%=boardDto.getReadcount() %></td>
	</tr>
	<tr>
		<th class="input"><%=str_writer %></th>
		<td class="label" style="text-align: center;"><%=boardDto.getWriter() %></td>
		<th class="input"><%=str_reg_date %></th>
		<td class="label" style="text-align: center;">
			<%
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			%>
			<%=sdf.format(boardDto.getReg_date()) %>
		</td>
	</tr>
	<tr>
		<th class="input"><%=str_subject %></th>
		<td class="label" colspan="3" style="text-align: left"><%=boardDto.getSubject() %></td>
	</tr>
	<tr>
		<th class="input"><%=str_content %></th>
		<td class="label" colspan="3" style="text-align: left"><pre><%=boardDto.getContent() %></pre></td>
	</tr>
	<tr>
		<th class="input" colspan="4">
			<input class="inputbutton" type="button" value="<%=btn_modify %>"
				onclick="location='boardmodifyform.do?num=<%=num%>&pageNum=<%=pageNum%>'">
			<input class="inputbutton" type="button" value="<%=btn_delete %>"
				onclick="location='boarddeleteform.do?num=<%=num%>&pageNum=<%=pageNum%>'">
				<input class="inputbutton" type="button" value="<%=btn_list %>"
				onclick="location='boardlist.do?pageNum=<%=pageNum%>'">
		</th>
	</tr>
</table>

