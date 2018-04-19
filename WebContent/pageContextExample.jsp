<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <%
    pageContext.setAttribute("someName", "someValue");
    String value = (String)pageContext.getAttribute("someName");
    
    pageContext.setAttribute("key", "value1", PageContext.REQUEST_SCOPE);
    pageContext.setAttribute("key", "value2", PageContext.APPLICATION_SCOPE);
    
    value = (String)pageContext.findAttribute("key");
    
  %>
  
  <%=value %>
</body>
</html>