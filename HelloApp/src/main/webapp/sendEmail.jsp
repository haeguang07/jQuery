<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form action="email.do">
<ul>
<li><label for="email">이메일 입력</label>
<input type="email" name="email" value="${email}"></li>
<li><input type="submit" value="메일전송"></li>
</ul>
</form>
<form action="check.do">
<fieldset>
<legend>인증번호 확인</legend>
<label>인증번호</label><input type="text" name="certification">
<c:if test="${random}!=null">
<input style="display: disable" name="random" value="${random}">
</c:if>

</fieldset>
</form>