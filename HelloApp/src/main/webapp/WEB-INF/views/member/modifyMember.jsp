<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<h3>회원정보 수정 페이지(modifyMember.jsp)</h3>
<form action="modifyMember.do" method="post">
	<table>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" value="${memberInfo.email}"
				readonly="readonly"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${memberInfo.name}</td>
		</tr>
		<tr>
			<th>비밀번호 변경</th>
			<td><input type="password" value="${memberInfo.password}" name="pass"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" value="${memberInfo.phone}"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address"
				value="${memberInfo.address}"></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td>${memberInfo.createDate}</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">수정</button>

			</td>
		</tr>
	</table>

</form>