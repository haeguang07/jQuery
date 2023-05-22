<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  loginForm.do-->
<p>로그인 회면</p>
<form action="login.do" method="post">
    <table class="table">
        <tr>
            <th>이메일</th>
            <td><input type="text" name="email" required></td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td><input type="password" name="pass" required></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">로그인</button>
                <button type="button" onclick="Location.href=''">회원가입</button>
            </td>
        </tr>
    </table>
</form>
