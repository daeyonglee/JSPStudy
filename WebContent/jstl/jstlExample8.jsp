<%@page import="kr.or.kosta.servlet.user.domain.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
<c:url value="/el/elExample.jsp" var="some">
	<c:param name="id" value="daegry" />
	<c:param name="email" value="dleo200@naver.com" />
</c:url>
<a href="/JSPStudy/el/elExample.jsp?id=${'daegry'}">이동</a>
<a href="${some}">이동2</a>
</body>
</html>