<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="user" class="kr.or.kosta.servlet.user.domain.User" scope="request" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<jsp:setProperty property="id" name="user" value="ddd" />
<jsp:setProperty property="name" name="user" value="ccc"/>
<jsp:setProperty property="passwd" name="user" value="eee"/>
<jsp:setProperty property="email" name="user" value="fff"/>

<jsp:getProperty property="id" name="user"/>
<jsp:getProperty property="name" name="user"/>
<jsp:getProperty property="passwd" name="user"/>
<jsp:getProperty property="email" name="user"/>
</body>
</html>