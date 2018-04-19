<%@page import="kr.or.kosta.servlet.user.domain.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<String> teams = new ArrayList<String>();

	for (int i=0; i<=9; i++){
		teams.add(""+i);
		teams.add("하하하하");
	}
	request.setAttribute("teams", teams);
	
	User user = new User();
	
	List<User> users = new ArrayList<User>();
	users.add(new User("a", "에이", "1111", "aa@aa.aa"));
	users.add(new User("b", "비", "1111", "bb@bb.bb"));
	users.add(new User("c", "씨", "1111", "cc@cc.cc"));
	users.add(new User("d", "디", "1111", "dd@dd.dd"));
	
	request.setAttribute("users", users);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
<c:set var="score" value="75" />
<c:forEach var="i" begin="1" end="10" step="1">
${i} : ${'김기정바보'}<br>
</c:forEach>

<c:forEach var="j" items="${teams}">
${j}<br>
</c:forEach>

<h2>사용자 목록</h2>
<table border="1">
	<c:forEach var="k" items="${users}">
	<tr>
		<td>${k.id}</td>
		<td>${k.name}</td>
		<td>${k.passwd}</td>
		<td>${k.email}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>