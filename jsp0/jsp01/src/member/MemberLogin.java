package member;

public class MemberLogin {

	private String id;
	private String name;
	private String pnum;
	private String email;
	private String photo;
	private String address;
	
	public MemberLogin(String id, String name, String pnum, String email, String photo, String address) {
		super();
		this.id = id;
		this.name = name;
		this.pnum = pnum;
		this.email = email;
		this.photo = photo;
		this.address = address;
	}
	
	public MemberLogin() {
		super();
	}

	public String getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	
	public String getPnum() {
		return pnum;
	}

	public String getEmail() {
		return email;
	}
	public String getPhoto() {
		return photo;
	}

	public String getAddress() {
		return address;
	}

	@Override
	public String toString() {
		return "MemberLogin [id=" + id + ", name=" + name + ", pnum=" + pnum + ", email=" + email + ", photo=" + photo
				+ ", address=" + address + "]";
	}
	
	
	
}
