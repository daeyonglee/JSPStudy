<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <% String message = (String)request.getAttribute("message"); %>
  
 전달받은 메시지 : <%=message %>
</body>
</html>