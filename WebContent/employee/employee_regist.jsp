<%@page import="kr.or.kosta.servlet.dep.domain.Department"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.kosta.servlet.emp.domain.Employee"%>
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
  
  // 사원번호, 사원이름, 매니저아이디 조회
  List<Employee> empList   = dao.selAllOfEmployee();
  List<Department> depList = dao.selAllOfDepartment();
  int empSeqLasNum         = dao.selOfEmpSeq();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>신규사원 등록</title>
<link rel="stylesheet" type="text/css" href="../css/common.css" />
<style>
  #send {
    margin-left: 18px;
  }
</style>
<script type="text/javascript">
	var depSelList = [];
  
  <%
    for (int i=0; i<empList.size(); i++) {
  %>
  	depSelList.push(
  		{
  			'managerId' : '<%=empList.get(i).getManagerId()%>',
  			'lastName' : '<%=empList.get(i).getLastName() %>',
  			'departmentId' : <%=empList.get(i).getDepartmentId() %>
  		}		
  	);
  <%
    }
  %>
</script>
<script type="text/javascript" src="../js/common.js"></script>
</head>
<body>
	<section>
		<jsp:include page="../menus/top.jsp" />
		<jsp:include page="../menus/aside.jsp" />
		<section id="contents">
      <h2>사원 등록</h2>
      <hr>
      <form action="/jsp/empRegist" method="post">
        <input type="hidden" name="department_id">
        <input type="hidden" name="manage_id">
        <table>
          <tr>
            <td>사원번호</td>
            <td colspan="2"><input type="text" name="employee_id" value="<%=empSeqLasNum%>" readonly></td>
          </tr>
          <tr>
            <td>이름</td>
            <td colspan="2"><input type="text" name="last_name"></td>
          </tr>
          <tr>
            <td>성</td>
            <td colspan="2"><input type="text" name="first_name"></td>
          </tr>
          <tr>
            <td>이메일</td>
            <td colspan="2"><input type="email" name="email"></td>
          </tr>
          <tr>
            <td>전화번호</td>
            <td><input type="tel" name="phone_number"></td>
            <td>(예 : 010-4128-3788)</td>
          </tr>
          <tr>
            <td>입사일자</td>
            <td><input type="date" name="hire_date"></td>
            <td>(예 : 2016.09.07)</td>
          </tr>
          <tr>
            <td>부서</td>
            <td colspan="2">
              <select id="selDepNm">
                <option>선택하세요</option>
                <%
                  for (int i=0; i<depList.size(); i++) {
                %>
                  <option value="<%=depList.get(i).getManageId()%>"><%=depList.get(i).getDepartmentName() %></option>
                <%    
                  }
                %>
              </select>
            </td>
          </tr>
          <tr>
            <td>부서장</td>
            <td colspan="2">
              <select id="selDepLdNm">
                <option>선택하세요</option>
              </select>
            </td>
          </tr>
          <tr>
            <td>급여</td>
            <td colspan="2">
              <input type="text" name="salary" pattern="[0-9]">
            </td>
          </tr>
        </table>
      </form>
      <button id="btnSubmit">사원 등록</button>
    </section>
		<jsp:include page="../menus/footer.jsp" />
	</section>
</body>
</html>

