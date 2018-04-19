<%@page import="kr.or.kosta.servlet.user.domain.User"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
<h2>EL의 11개 디폴트 객체들</h2>
${pageContext}<br>
요청방식 : ${pageContext.request.method}<br>
요청방식 : ${pageContext.request.requestURI}<br>
요청방식 : ${pageContext["request"].protocol}<br>

<%-- ${pageScope}<br>
${requestScope}<br>
${sessionScope}<br>
${applicationScope}<br> --%>
<%
pageContext.setAttribute("id", "Bangry");
%>
${pageScope.id}<br>
${id}<br>

<%-- ${requestScope}<br> --%>
<%
request.setAttribute("name", "김기정");
%>
${requestScope.name}<br>
<%-- ${sessionScope}<br> --%>
<%-- ${applicationScope}<br> --%>

모든 스코프객체에서 검색 : ${name}<br>

<%=request.getParameter("id") %><br>
${param.id}<br>

${paramValues}<br>
${paramValues.hobby[0]},${paramValues.hobby[1]}<br>

${header}<br>
브라우저 정보 : ${header["user-agent"]}<br>

${headerValues}<br>

${initParam}<br>
${initParam.message}<br>
${cookie}<br>
쿠키이름 : ${cookie.JSESSIONID.name}<br>
쿠키값 : ${cookie.JSESSIONID.value}<br>

<%
// 테스트를 위한 Scope객체에 데이터 저장
String today = String.format("%1$tF %1$tT", Calendar.getInstance());
request.setAttribute("today", today);

session.setAttribute("id", "bangry");

String[] names = {"김기정", "박기정", "최기정"};

application.setAttribute("array", names);

User u = new User();
u.setId("hong");
u.setName("홍길동");
u.setEmail("hong@korea.com");
request.setAttribute("user", u);
%>

${requestScope.today}<br>
${today}<br>

${id}<br>

${array[0]}, ${array[1]}, ${array[2]}<br>
<hr>

<jsp:useBean id="user" class="kr.or.kosta.servlet.user.domain.User" scope="request"></jsp:useBean>
<jsp:getProperty property="id" name="user" />
<jsp:getProperty property="name" name="user" />
<jsp:getProperty property="email" name="user" /><br>

<!-- 권장사항이 아님. -->
${user.setId("kim")}
${user.setName("김정은")}
${user.setEmail("kimjungeun@NorthKorea.com")}

${user.getId()}
${user.getName()}
${user.getEmail()}<br>

${user.id},
${user.name}, 
${user.email}<br>

</body>
</html>