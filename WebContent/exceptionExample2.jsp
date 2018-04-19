<%@ page contentType="text/html; charset=UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <%
    int status = response.getStatus();
  
    if (status == 500) {
  %>
   내부적으로 문제가 발생했습니다. 에러내용 : <%=exception.getMessage() %>
  <%
    } else if (status == 404) {
  %>
  찾고자 하는 페이지가 존재하지 않습니다.
  <%
    } else {
  %>
  오류가 발생하였으나 이유를 모르겠습니다. <%=exception.getMessage() %>
  <%} %>
</body>
</html>