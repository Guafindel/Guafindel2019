package member;

public class RegisterRequest {

	private String email;
	private String password;
	private String confirmPassword; //비밀번호 재확인용 변수
	private String name;
	
	//Getter Setter
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	//비밀번호 재확인용 메소드 작성
	public boolean isPasswordEqualToConfirmPassword() {
		
		return password.equals(confirmPassword);
	}
	
}
