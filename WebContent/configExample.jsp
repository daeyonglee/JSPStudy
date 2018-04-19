<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
테스트입니다.<br>
${initParam.aaa}<br>
<%=config.getInitParameter("test") %><br> 
<%=page %><br>
<%=this %>
</body>
</html>