package dto;

public class UserSignUp {
private int userId;
	public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}
public byte[] getImage() {
	return image;
}
public void setImage(byte[] image) {
	this.image = image;
}
	private String userName;
private String userEmail;
private String  userPassword;
private String userDepartment;
private byte[] image;

public UserSignUp() {
	super();
	// TODO Auto-generated constructor stub
}
public UserSignUp(String userName, String userEmail, String userPassword, String userDepartment,byte[]image) {
	super();
	this.userName = userName;
	this.userEmail = userEmail;
	this.userPassword = userPassword;
	this.userDepartment = userDepartment;
    this.image=image;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getUserEmail() {
	return userEmail;
}
public void setUserEmail(String userEmail) {
	this.userEmail = userEmail;
}
public String getUserPassword() {
	return userPassword;
}
public void setUserPassword(String userPassword) {
	this.userPassword = userPassword;
}
public String getUserDepartment() {
	return userDepartment;
}
public void setUserDepartment(String userDepartment) {
	this.userDepartment = userDepartment;
}





}
