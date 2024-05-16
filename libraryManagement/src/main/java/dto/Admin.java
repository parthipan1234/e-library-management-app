package dto;

public class Admin {
      
	private String adminUserNAme;
	private String password;
	
	
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Admin(String adminUserNAme, String password) {
		super();
		this.adminUserNAme = adminUserNAme;
		this.password = password;
	}
	public String getAdminUserNAme() {
		return adminUserNAme;
	}
	public void setAdminUserNAme(String adminUserNAme) {
		this.adminUserNAme = adminUserNAme;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
