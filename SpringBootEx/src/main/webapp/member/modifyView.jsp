<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<link type="text/css" rel="stylesheet" href="${project}style_member.css">
<script type="text/javascript" src="${project}script_member.js"></script>  

<h2> ${page_modify} </h2>

<c:if test="${result eq 1}">
	<form name="modifyform" method="post" action="logonmodifypro">
		<input type="hidden" name="id" value="${memberDto.id}">
		<table>
			<tr>				
				<th colspan="2"> ${msg_modify} </th>
			</tr>
			<tr>
				<th> ${str_id} </th>
				<td> &nbsp;${memberDto.id} </td>
			</tr>
			<tr>
				<th rowspan="2"> ${str_passwd} </th>
				<td> 
					<input class="input" type="password" name="passwd" maxlength="20" autofocus
						value="${memberDto.passwd}"> 
				</td>					
			</tr>
			<tr>
				<td>
					<input class="input" type="password" name="repasswd" maxlength="20" autofocus
						value="${memberDto.passwd}"> 
				</td>
			</tr>
			<tr>
				<th> ${str_name} </th>
				<td> &nbsp;${memberDto.name} </td>
			</tr>
			<tr>
				<th> ${str_tel} </th>
				<td>
					<c:if test="${memberDto.tel == null or memberDto.tel == ''}">
						<input class="input" type="text" name="tel1" maxlength="3" 
							style="width:30px;">
						- <input class="input" type="text" name="tel2" maxlength="4"
							style="width:38px;">
						- <input class="input" type="text" name="tel3" maxlength="4"
							style="width:38px;">
					</c:if>
					<c:set var="t" value="${fn:split( memberDto.tel, '-')}"/>
					<c:if test="${memberDto.tel != null and memberDto.tel != ''}">
						<input class="input" type="text" name="tel1" maxlength="3" 
							style="width:30px;" value="${t[0]}">
						- <input class="input" type="text" name="tel2" maxlength="4"
							style="width:38px;" value="${t[1]}">
						- <input class="input" type="text" name="tel3" maxlength="4"
							style="width:38px;" value="${t[2]}">
					</c:if>										
				</td>
			</tr>
			<tr>
				<th> ${str_email} </th>
				<td>
					<c:if test="${memberDto.email == null or memberDto.email == ''}">
						<input class="input" type="text" name="email1" maxlength="20" style="width:80;">
						@ <input class="input" type="text" name="email2" maxlength="10" style="width:80;">
					</c:if>
					<c:if test="${memberDto.email != null and memberDto.email != ''}">
						<c:set var="e" value="${fn:split( memberDto.email, '@')}"/>					
						<input class="input" type="text" name="email1" maxlength="20" style="width:80;"
							value="${e[0]}">
						@ <input class="input" type="text" name="email2" maxlength="10" style="width:80;"
							value="${e[1]}">
					</c:if>
				</td>
			</tr>
			<tr>
				<th> ${str_reg_date} </th>
				<td>
					&nbsp;<fmt:formatDate type="both" value="${memberDto.reg_date}" 
						pattern="yyyy-MM-dd HH:mm"/>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="submit" value="${btn_mod}">
					<input class="inputbutton" type="reset" value="${btn_cancle}">
					<input class="inputbutton" type="button" value="${btn_mod_cancle}"
						onclick="location='logonmain'">
				</th>
			</tr>
		</table>			
	</form>
</c:if>
<c:if test="${result eq -1}">
	<script type="text/javascript">		
		erroralert( error_passwd );
	</script>
</c:if>
















