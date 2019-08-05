package member;

public class BoardDao implements Dao {

	@Override
	public Member selectByEmail(String email) {
		System.out.println("boardDao : selectByEmail()");
		return null;
	}

	@Override
	public void update(Member member) {
		System.out.println("boardDao : update()");
		
	}

	@Override
	public void insert(Member member) {
		// TODO Auto-generated method stub
		
	}

}
