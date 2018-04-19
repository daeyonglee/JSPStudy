<%@ page contentType="text/html; charset=UTF-8"%>
<%
  // 쿠키 읽기
  Cookie[] cookies = request.getCookies();
  if (cookies != null) {
    for (Cookie cookie : cookies) {
      if (cookie.getName().equalsIgnoreCase("id")) {
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);
        response.sendRedirect(application.getContextPath()+"/index.jsp");
        break;
      }
    }
  }
%>