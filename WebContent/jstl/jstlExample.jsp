<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
<%
	String message = "안녕하세요.<구구구><br>";
	request.setAttribute("message", message);
%>
<%=request.getAttribute("message") %><br>
${message}<br>
<c:out value="${message}" default="message값이 없으므니다.."></c:out>
</body>
</html>