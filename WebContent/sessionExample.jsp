<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <% 
    session.setAttribute("message", new String("야임마")); 
    response.sendRedirect("index.jsp");
  
  %>
</body>
</html>