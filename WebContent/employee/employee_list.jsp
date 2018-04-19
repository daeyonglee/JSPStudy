<%@page import="kr.or.kosta.servlet.emp.domain.Employee"%>
<%@page import="kr.or.kosta.servlet.dep.domain.Department"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.kosta.servlet.emp.dao.JdbcEmployeeDao"%>
<%@page import="kr.or.kosta.servlet.emp.dao.EmployeeDao"%>
<%@page import="kr.or.kosta.servlet.user.domain.User"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.kosta.servlet.user.dao.UserDao"%>
<%@page import="kr.or.kosta.servlet.user.dao.JdbcUserDao"%>
<%@page import="kr.or.kosta.servlet.common.dao.DaoFactory"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
  // DB 접속
  EmployeeDao dao = (EmployeeDao)DaoFactory.getInstance().getDao(JdbcEmployeeDao.class);
  List<Map<String, Object>> list = dao.listAll();
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
      <h2>사원 목록</h2>
      <hr>
      <table>
        <tr>
          <th>사원번호</th>
          <th>이름</th>
          <th>입사일자</th>
          <th>급여</th>
          <th>부서명</th>
          <th>부서장</th>
        </tr>
        <%
          if (!list.isEmpty()) {
            for(Map<String, Object> map : list) {
          	  Employee emp = (Employee) map.get("emp");
    			    Department dep = (Department) map.get("dep");
    			    String departmentLeader = (String) map.get("departmentLeader");
        %>
          <tr>
            <td><%=emp.getEmployeeId() %></td>
            <td><%=emp.getLastName() %></td>
            <td><%=emp.getHireDate() %></td>
            <td><%=emp.getSalary() %></td>
            <td><%=dep.getDepartmentName() %></td>
        <%
            if (departmentLeader == null) {
        %>
            <td>없음</td>
        <%      
            } else {
        %> 
            <td><%=departmentLeader %></td>
        <%      
            }
        %>
          </tr>
        <%
            }
          } else {
        %> 
          <tr>
            <td colspan="6">등록된 사원이 없습니다</td>
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

