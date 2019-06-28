package member;

public class WonMember {

	private String id;
	private String pw;
	private String name;
	private String birth;
	private String sex;
	private String age;
	private String email;
	private String pnum;

	public WonMember() {}	
	
	public WonMember(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public WonMember(String id, String pw, String name, String birth, String sex, String age, String email,
			String pnum) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.sex = sex;
		this.age = age;
		this.email = email;
		this.pnum = pnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	@Override
	public String toString() {
		return "WonMember [id=" + id + ", pw=" + pw + ", name=" + name + ", birth=" + birth + ", sex=" + sex + ", age="
				+ age + ", email=" + email + ", pnum=" + pnum + "]";
	}
	
	

}

