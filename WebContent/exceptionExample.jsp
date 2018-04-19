<%@ page contentType="text/html; charset=UTF-8" errorPage="exceptionExample2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <%
    String message = null;
  
    out.println(10/0);
  %>
</body>
</html>