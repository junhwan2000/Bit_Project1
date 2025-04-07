<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=project%>style_board.css">
<script type="text/javascript" src="<%=project%>script_board.js"></script>
<%
	int count = (int) request.getAttribute("count");
	int number = (int) request.getAttribute("number");
	String pageNum = (String) request.getAttribute("pageNum");
	int currentPage = (int) request.getAttribute("currentPage");
	int pageCount = (int) request.getAttribute("pageCount");
	int startPage = (int) request.getAttribute("startPage");
	int endPage = (int) request.getAttribute("endPage");
	int pageBlock = (int) request.getAttribute("pageBlock");

%>
<h2><%=page_list %> (<%=str_count %> : <%=count %>)</h2>
<br>
<table>
	<tr>
		<td class="input" style="text-align:right;" colspan="6">
			<a href="boardwriteform.do">
				<%=str_write %>
			</a>
		</td>
	</tr>
	<tr>
		<th class="input" style="width:7%"><%=str_num %></th>
		<th class="input" style="width:40%"><%=str_subject %></th>
		<th class="input" style="width:7%"><%=str_readcount %></th>
		<th class="input" style="width:10%"><%=str_writer %></th>
		<th class="input" style="width:15%"><%=str_reg_date %></th>
		<th class="input" style="width:13%"><%=str_ip %></th>
	</tr>
	<%
	if (count == 0) {
		// 글이 없는 경우
		%>
		<tr>
			<td class="input" colspan="6" style="text-align: center;">
				<%=msg_list_x %>
			</td>
		</tr>
		<%
	} else {
		// 글이 있는 경우 
		List<BoardDto> dtos = (List<BoardDto>) request.getAttribute("dtos");
		
		for (BoardDto dto : dtos) {
			%>
			<tr>
				<td class="label" style="text-align:center">
					<%=number-- %>
				</td>
				<td class="label" style="text-align:left;">
				
					<a style="color:#87CEFA;" href="boardcontent.do?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&number=<%=number+1%>">
					<%=dto.getSubject() %>
					</a>
				</td>
				<td class="label" style="text-align:center">
					<%=dto.getReadcount() %>
				</td>
				<td class="label" style="text-align:center">
					<%=dto.getWriter() %>
				</td>
				<td class="label" style="text-align:center">
					<%
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					%>
					<%=sdf.format(dto.getReg_date()) %>
				</td>
				<td class="label" style="text-align:center">
					<%=dto.getIp() %>
				</td>
			</tr>

			<%
		}
	}
	%>
</table>
<br>
<center>
	<%
	if(count > 0) {
		if (startPage > pageBlock) {
			%>
			<a style="color:#87CEFA" href="boardlist.do">[◀◀]</a>
			<a style="color:#87CEFA" href="boardlist.do?pageNum=<%=startPage - pageBlock%>">[◀]</a>
			<%
		}
		for(int i=startPage; i<=endPage; i++) {
			if (i==currentPage) {
				%>
				<b>[<%=i %>]</b>
				<%	
			} else {
				%>
				<a href="boardlist.do?pageNum=<%=i%>" style="color:#87CEFA">[<%=i %>]</a>
				<%
			}
		}
		
		if (pageCount > endPage) {
			%>
			<a style="color:#87CEFA" href="boardlist.do?pageNum=<%=startPage + pageBlock%>">[▶]</a>
			<a style="color:#87CEFA" href="boardlist.do?pageNum=<%=pageCount%>">[▶▶]</a>
			<%
		}
	}
	%>
</center>