package member;

import java.util.Date;

public class Member {

	private Long id; //long 기본 타입이 아니라 Long인걸 확인하자. wraper클래스를 이용할 것이라는 뜻.
	private String email;
	private String password;
	private String name;
	private Date registerDate;
	
	//생성자 작성 
	public Member(String email, String password, String name, Date registerDate) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.registerDate = registerDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public String getName() {
		return name;
	}

	public Date getRegisterDate() {
		return registerDate;
	}
	
	public void changePassword(String oldPassword, String newPassword) throws IdPasswordNotMatchingException {
		
		if(!this.password.equals(oldPassword)) {
			throw new IdPasswordNotMatchingException();
		}
		this.password = newPassword;
	
	}
	
	
}
