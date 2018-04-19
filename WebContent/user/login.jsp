<%@page import="kr.or.kosta.servlet.user.domain.User"%>
<%@page import="kr.or.kosta.servlet.user.dao.JdbcUserDao"%>
<%@page import="kr.or.kosta.servlet.common.dao.DaoFactory"%>
<%@page import="kr.or.kosta.servlet.user.dao.UserDao"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
  String id = request.getParameter("id");
  String passwd = request.getParameter("passwd");
  
  // DB 연결
  UserDao dao = (UserDao)DaoFactory.getInstance().getDao(JdbcUserDao.class);
  User user = dao.isMember(id, passwd);
  
  if (user != null) {
    Cookie cookie = new Cookie("id", user.getId());
    cookie.setPath("/");
    response.addCookie(cookie);
    //response.sendRedirect("../index.jsp");
    response.sendRedirect(application.getContextPath()+"/index.jsp");
  } else {
    response.sendRedirect(application.getContextPath()+"/user/loginForm.jsp"); 
  }
%>

