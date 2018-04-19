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
	//String message = "안녕하세요.<구구구><br>";
	//request.setAttribute("message", message);
%>
<c:set value="안녕하세요.<구구구><br>" var="message" scope="request"></c:set>
<%=request.getAttribute("message") %><br>
${message}<br>
<c:out value="${message}" default="message가 없다."></c:out>
<hr>
<jsp:useBean id="user" class="kr.or.kosta.servlet.user.domain.User" scope="request" />

<!-- var 속성을 활용할 때만 scope 영역 줄 수 있다. -->
<%-- <c:set var="id" value="daegry" target="${user}" property="id" scope="request" />
<c:set var="name" value="이대용" target="${user}" property="name" scope="request" /> --%>
<c:set value="daegry" target="${user}" property="id" />
<c:set value="이대용" target="${user}" property="name" />

user.id: ${user.id}<br>
user.name: ${user.name}<br>

id: ${id}<br>
name: ${name}<br>

<hr>


</body>
</html>