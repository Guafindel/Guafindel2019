package model;

public class Message {

	//이 클래스는 작성한 Table과 맵핑되는 클래스로 여기서 작성한 변수들과 
	//데이터베이스에 저장된 변수들이 연동된다는 뜻이다.
	private int id;
	private String guestName;
	private String password;
	private String message;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGuestName() {
		return guestName;
	}
	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	//비밀번호 체크해야될 때 사용할 메소드
	public boolean hasPassword() {
		//패스워드가 널이 아닐 때 패스워드가 공백이 아닐 때
		return password != null && !password.isEmpty(); 
	}
	
	public boolean matchPassword(String pwd) {
		//게시물에 입력받은 패스워드와 저장된 비밀번호를 비교하는 코드
		return password != null && password.contentEquals(pwd);
	}
}
