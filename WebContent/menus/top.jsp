<%@ page contentType="text/html; charset=UTF-8"%>
<%
  String id = "";
  // 쿠키 읽기
  Cookie[] cookies = request.getCookies();
  if (cookies != null) {
    for (Cookie cookie : cookies) {
      if (cookie.getName().equalsIgnoreCase("id")) {
        id = cookie.getValue();
        break;
      }
    }
  }
%>
<header id="top">TomMenu 영역
    <% if (id == "") { %>
      <form action='<%= application.getContextPath()%>/user/login.jsp' method='post' style='float: right;'>
        <input type='text' name='id' placeholder='ID'>
        <input type='password' name='passwd' placeholder='PASSWORD'>  
        <input type='submit' value='로그인'>   
      </form>
    <% } else { %>
      <span style="float:right;">
        <%=id %>님 반갑습니다..<a href="<%= application.getContextPath()%>/user/logout.jsp">로그아웃</a>
      </span>
    <%} %>
    <ul>
      <li><a href="<%= application.getContextPath()%>/user/list.jsp">회원목록</a></li>
      <li><a href="<%= application.getContextPath()%>/employee/employee_regist.jsp">사원등록</a></li>
      <li><a href="<%= application.getContextPath()%>/employee/employee_list.jsp">사원목록</a></li>
    </ul>
</header>