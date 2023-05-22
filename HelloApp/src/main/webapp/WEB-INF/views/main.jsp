<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id = "now" class="java.util.Date"/>
	<p>Main Page</p>
	<p>Expression Language</p>
	${3>2}
	${"Hello" }
	${10 - 5 }
	${myname != null}
	${myname != null ? '<p>있음</p>' : '<p>없음</p>'}
	<fmt:formatDate var="year" value="${now}" pattern="yyyy"/>
	<p>올해는 : ${year }년입니다</p>
	<p>작년은 : ${year-1 }년입니다</p>
	<a href="emailForm.do">이메일 보내기</a>
	
</body>
</html>