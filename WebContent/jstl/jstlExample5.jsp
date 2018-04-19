<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
<c:set var="score" value="75" />

<c:choose>
	<c:when test="${score ge 90}">
		<h1>수</h1>
	</c:when>
	<c:when test="${score ge 80}">
		<h1>우</h1>
	</c:when>
	<c:when test="${score ge 70}">
		<h1>미</h1>
	</c:when>
	<c:when test="${score ge 60}">
		<h1>양</h1>
	</c:when>
	<c:otherwise>
		<h1>가</h1>
	</c:otherwise>
</c:choose>

</body>
</html>