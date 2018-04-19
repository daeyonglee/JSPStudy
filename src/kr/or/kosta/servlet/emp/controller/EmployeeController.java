package kr.or.kosta.servlet.emp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosta.servlet.common.dao.DaoFactory;
import kr.or.kosta.servlet.emp.dao.EmployeeDao;
import kr.or.kosta.servlet.emp.dao.JdbcEmployeeDao;
import kr.or.kosta.servlet.emp.domain.Employee;

/**
 * Servlet implementation class EmployeeController
 */
public class EmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		Employee emp = new Employee();
		emp.setEmployeeId(Integer.parseInt(request.getParameter("employee_id")));
		emp.setLastName(request.getParameter("last_name"));
		emp.setFirstName(request.getParameter("first_name"));
		emp.setEmail(request.getParameter("email"));
		emp.setPhoneNumber(request.getParameter("phone_number"));
		emp.setHireDate(request.getParameter("hire_date").replaceAll("-", "."));
		emp.setManagerId(Integer.parseInt(request.getParameter("manage_id")));
		emp.setSalary(Integer.parseInt(request.getParameter("salary")));
		emp.setDepartmentId(Integer.parseInt(request.getParameter("department_id")));
		
		System.out.println(emp);
		EmployeeDao dao = (EmployeeDao)DaoFactory.getInstance().getDao(JdbcEmployeeDao.class);
		dao.create(emp);
		
		request.getRequestDispatcher("/employee/employee_result.jsp").forward(request, response);;
		
		
	}

}
