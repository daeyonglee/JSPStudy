<%@ page contentType="text/html; charset=utf-8"  %>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.StringTokenizer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- HTML 주석입니다. -->
<%
  Calendar today = Calendar.getInstance();
  String now = String.format("%1$tF %1$tT", today);
  StringTokenizer st;
%>
현재 시간 : <%=now %><br>

<%!
  int count;

  public String getMessage() {
    return "오늘 수업은 여기까지입니다."; 
  }
%>

<%
  count++;
%>

당신은 <%= count %>번째 방문자입니다.<br>
<%= getMessage() %><br>

session의 메시지 : <%=session.getAttribute("message") %><br>
session.removeAttribute() <%session.removeAttribute("message"); %><br>
session.getAttribute(): <%=session.getAttribute("message") %><br>
</body>
</html>