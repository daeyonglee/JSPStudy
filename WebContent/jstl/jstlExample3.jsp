<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
<c:catch var="asd">
	<%
		String name = null;
	
		name.length();
	%>
</c:catch>
${asd}

</body>
</html>