<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
${"EL이 뭐에여"}, ${'EL이 뭐에요'}, ${100}

<%-- EL 연산자 --%>
${10 + 20}<br>
<%=100 + "200" %><br>
<%-- 문자 + 숫자 일 경우 숫자에게 우선순위가 간다. --%>
${100 + "200"}<br>
100을 3으로 나눈 나머지값 : ${100 mod 3 }<br>
${300 == 300 }, ${300 eq 300 }<br>
${100 > 50 ? "크다" : "작다" }<br>

<%
// empty 연산자
String str1 = null;
String str2 = "";
String[] array = new String[10];
List<String> list = new ArrayList<String>();
%>

str1이 빈문자열인가? ${empty str1}<br>
str2가 빈문자열인가? ${empty str2}<br>
배열이 비어 있는가? ${empty array}<br>
리스트가 비어 있는가? ${empty list}<br>


</body>
</html>