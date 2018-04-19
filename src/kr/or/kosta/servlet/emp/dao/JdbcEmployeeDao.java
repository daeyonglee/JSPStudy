package kr.or.kosta.servlet.emp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import kr.or.kosta.servlet.common.dao.DaoFactory;
import kr.or.kosta.servlet.dep.domain.Department;
import kr.or.kosta.servlet.emp.domain.Employee;
import kr.or.kosta.servlet.user.domain.User;

public class JdbcEmployeeDao implements EmployeeDao{
	
	Connection con          = null;
	PreparedStatement pstmt = null;
	ResultSet rs            = null;
	
	private DataSource dataSource = null;
	
	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	/** 사용자 등록 
	 * @throws Exception */
	public void create(Employee emp) throws RuntimeException{
		
		String sql = "INSERT INTO employees"
				+ "               ("
				+ "                 employee_id"
				+ "               , first_name"
				+ "               , last_name"
				+ "               , email"
				+ "               , phone_number"
				+ "               , hire_date"
				+ "               , salary"
				+ "               , manager_id"
				+ "               , department_id"
				+ "               , job_id"
				+ "               ) VALUES ("
				+ "               employees_seq.nextval"
				+ "               , ?"
				+ "               , ?"
				+ "               , ?"
				+ "               , ?"
				+ "               , ?"
				+ "               , ?"
				+ "               , ?"
				+ "               , ?"
				+ "               , 'IT_PROG' )";
		
		try {
			con = dataSource.getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, emp.getFirstName());
			pstmt.setString(2, emp.getLastName());
			pstmt.setString(3, emp.getEmail());
			pstmt.setString(4, emp.getPhoneNumber());
			pstmt.setString(5, emp.getHireDate());
			pstmt.setInt(6, emp.getSalary());
			pstmt.setInt(7, emp.getManagerId());
			pstmt.setInt(8, emp.getDepartmentId());
			pstmt.executeUpdate();
			
			con.commit();
			
			
		} catch (Exception e) {
			try {
				con.rollback();
				throw new RuntimeException("EmployeeDao.create(Employee emp) : " + e.toString());
			} catch (SQLException e1) {}
		} finally {
			close(null, pstmt, con);
		}
	}
	
	/** 사용자 전체 조회 */
	public List<Map<String, Object>> listAll() throws RuntimeException{
		
		String sql = "SELECT e.employee_id as employee_id" + 
				     "     , e.last_name as last_name    " + 
				     "     , TO_CHAR(e.hire_date, 'yyyy.mm.dd') as hire_date" + 
				     "     , e.salary as salary"           + 
				     "     , d.department_name as department_name" + 
				     "     , (SELECT max(last_name) FROM employees WHERE manager_id = d.manager_id GROUP BY manager_id) as department_leader" + 
				     "  FROM employees e" + 
				     "  INNER JOIN departments d" + 
				     "     ON e.department_id = d.department_id" +
				     "  ORDER BY employee_id";
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null;
		Employee emp = null;
		Department dep = null;
		try {
			con   = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			rs    = pstmt.executeQuery();
			while(rs.next()) {
				String departmentLeader = null;
				
				map = new HashMap<String, Object>();
				emp = new Employee();
				dep = new Department();
				emp.setEmployeeId(rs.getInt("employee_id"));
				emp.setLastName(rs.getString("last_name"));
				emp.setHireDate(rs.getString("hire_date"));
				emp.setSalary(rs.getInt("salary"));
				dep.setDepartmentName(rs.getString("department_name"));
				departmentLeader = rs.getString("department_leader");
				map.put("emp", emp);
				map.put("dep", dep);
				map.put("departmentLeader", departmentLeader);
				list.add(map);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		
		return list;
	}
	
	private void close(ResultSet rs, PreparedStatement pstmt, Connection con) {
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (con != null) con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public int selOfEmpSeq() throws RuntimeException {
		String sql = "SELECT last_number" + 
					 "  FROM user_sequences" + 
					 " WHERE sequence_name = \'EMPLOYEES_SEQ\'";
		
		int seq = 0;
		
		try {
			con   = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			rs    = pstmt.executeQuery();
			while(rs.next()) {
				seq = rs.getInt("last_number");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		
		return seq;
	}

	@Override
	public List<Department> selAllOfDepartment() throws RuntimeException {
		String sql = "SELECT department_id  " + 
					 "     , department_name" + 
					 "     , manager_id     " + 
					 "  FROM departments    " + 
					 " ORDER BY department_id";
		List<Department> list = new ArrayList<Department>();
		Department dep = null;
		try {
			con   = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			rs    = pstmt.executeQuery();
			while(rs.next()) {
				dep = new Department();
				dep.setDepartmentId(rs.getInt("department_id"));
				dep.setDepartmentName(rs.getString("department_name"));
				dep.setManageId(rs.getInt("manager_id"));
				list.add(dep);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		
		return list;
	}

	@Override
	public List<Employee> selAllOfEmployee() throws RuntimeException {
		String sql = "SELECT employee_id" + 
				     "     , last_name" + 
					 "     , manager_id" +
				     "     , department_id" +
					 "  FROM employees";
		List<Employee> list = new ArrayList<Employee>();
		Employee emp = null;
		try {
			con   = dataSource.getConnection();
			pstmt = con.prepareStatement(sql);
			rs    = pstmt.executeQuery();
			while(rs.next()) {
				emp = new Employee();
				emp.setEmployeeId(rs.getInt("employee_id"));
				emp.setLastName(rs.getString("last_name"));
				emp.setManagerId(rs.getInt("manager_id"));
				emp.setDepartmentId(rs.getInt("department_id"));
				list.add(emp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
	
	return list;
	}
	
	public static void main(String[] args) {
		
		EmployeeDao dao = (EmployeeDao) DaoFactory.getInstance().getDao(JdbcEmployeeDao.class);
		/*List<Map<String, Object>> list = dao.listAll();
		
		for (Map<String, Object> map : list) {
			Employee emp = (Employee) map.get("emp");
			Department dep = (Department) map.get("dep");
			String departmentLeader = (String) map.get("departmentLeader");
		}*/
		
		/*int seq = dao.selOfEmpSeq();
		System.out.println(seq);*/
		
		/*List<Department> list = dao.selAllOfDepartment();
		for (Department department : list) {
			System.out.println(department);
		}*/
		
		/*List<Employee> empList = dao.selAllOfEmployee();
		for (Employee employee : empList) {
			System.out.println(employee);
		}*/
	}

}

