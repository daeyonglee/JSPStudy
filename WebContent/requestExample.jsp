<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
요청방식 : <%=request.getMethod() %><br>
아이디 : <%=request.getParameter("id") %><br>

<%
  String message = "하이헬로우";
  request.setAttribute("message", message);
  application.getRequestDispatcher("/requestExample2.jsp").forward(request, response);
%>
</body>
</html>