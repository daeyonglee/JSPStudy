package kr.or.kosta.servlet.dep.domain;

public class Department {
	
	private int departmentId;		// 부서번호
	private String departmentName;	// 부서명
	private int manageId;			// 매니저아이디
	private int locationId;			// 위치아이디
	
	public Department() {}
	
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public int getManageId() {
		return manageId;
	}
	public void setManageId(int manageId) {
		this.manageId = manageId;
	}
	public int getLocationId() {
		return locationId;
	}
	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}
	
	@Override
	public String toString() {
		return "Department [departmentId=" + departmentId + ", departmentName=" + departmentName + ", manageId="
				+ manageId + ", locationId=" + locationId + "]";
	}
}
