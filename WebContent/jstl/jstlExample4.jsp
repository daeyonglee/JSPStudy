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

<c:if test="${score ge 60}">
	넌 성공했다.
</c:if>
<c:if test="${empty param.page}">
	<c:set var="page" value="1" />
</c:if>
${page}
</body>
</html>