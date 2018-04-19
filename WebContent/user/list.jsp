<%@page import="kr.or.kosta.servlet.user.domain.User"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.kosta.servlet.user.dao.UserDao"%>
<%@page import="kr.or.kosta.servlet.user.dao.JdbcUserDao"%>
<%@page import="kr.or.kosta.servlet.common.dao.DaoFactory"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
  UserDao dao = (UserDao)DaoFactory.getInstance().getDao(JdbcUserDao.class);
  List<User> list = dao.listAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원목록</title>
<link rel="stylesheet" type="text/css" href="../css/common.css" />
</head>
<body>
	<section>
		<jsp:include page="../menus/top.jsp" />
		<jsp:include page="../menus/aside.jsp" />
		<section id="contents">
      <h2>회원 목록</h2>
      <hr>
      <table>
        <tr>
          <th>번호</th>
          <th>아이디</th>
          <th>비밀번호</th>
          <th>이름</th>
          <th>이메일</th>
        </tr>
        <%
          if (!list.isEmpty()) {
            for (int i=0; i<list.size(); i++) {
            User user = list.get(i);
        %>    
        <tr>
          <td><%=i+1 %></td>
          <td><%=user.getId() %></td>
          <td><%=user.getPasswd() %></td>
          <td><%=user.getName() %></td>
          <td><%=user.getEmail() %></td>
        </tr>
        <%   
            }
          } else {
        %>
        <tr>
          <td colspan="5">등록된 사원이 없습니다</td>
        </tr>
        <% 
          }
        %>
      </table>
    </section>
		<jsp:include page="../menus/footer.jsp" />
	</section>
</body>
</html>

