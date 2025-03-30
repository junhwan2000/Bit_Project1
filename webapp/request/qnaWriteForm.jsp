<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> 1:1 문의하기 </h2>

<form method="post" action="qnawritepro.do">
	<table>
		<tr>
			<th>작성자</th>
		</tr>
		<tr>
			<th><input type="id" name="user_id"></th>
		</tr>
		<tr>
			<th> 제목 </th>
		</tr>
		<tr>
			<td> <input type="text" name="title"> </td>
		</tr>
		<tr>
			<th>문의내용</th>
		</tr>
		<tr>
			<td><input type="textarea" name="content"></td>
		</tr>
		<tr>
			<td><input type="submit" value="제출"></td>
		</tr>
	</table>
</form>