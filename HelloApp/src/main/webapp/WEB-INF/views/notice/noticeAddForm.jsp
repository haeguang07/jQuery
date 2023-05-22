<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h3>공지사항 등록페이지입니다</h3>
<form action="noticeAdd.do" method="post" enctype="multipart/form-data">
	<table class="table">
		<tr>
			<th>제목</th>
			<td><input type="text" name="title">
			<td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="subject" rows="3" cols="25"></textarea>
			<td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="writer" value="${name}" readonly>
			<td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td><input type="file" name="attach">
			<td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">등록</button>
				<button type="reset">취소</button></td>
		</tr>
	</table>
</form>
