package kr.or.kosta.servlet.emp.dao;

import java.util.List;
import java.util.Map;

import kr.or.kosta.servlet.dep.domain.Department;
import kr.or.kosta.servlet.emp.domain.Employee;
import kr.or.kosta.servlet.user.domain.User;

public interface EmployeeDao {
	
	
	/** 사원 등록 
	 * @throws Exception */
	public void create(Employee emp) throws RuntimeException;
	
	/** 사원번호, 이름, 입사일자, 급여, 부서명, 부서장 전체 조회 */
	public List<Map<String, Object>> listAll() throws RuntimeException;
	
	/** 사원번호 현재 시퀀스 값 조회 */
	public int selOfEmpSeq() throws RuntimeException;
	
	/** 부서명 목록 전체 조회 */
	public List<Department> selAllOfDepartment() throws RuntimeException;
	
	/** 사원의 이름, 매니저아이디 전체 조회 */
	public List<Employee> selAllOfEmployee() throws RuntimeException;
}

