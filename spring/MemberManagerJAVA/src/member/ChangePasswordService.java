package member;

public class ChangePasswordService {

	//private MemberDao memberDao = new MemberDao(); 기존의 방식
	
	private MemberDao memberDao; //새로운 방식
	
	public ChangePasswordService(MemberDao dao) {
		
		memberDao = dao;
	}
	
	public void changePassword(String email, String oldPassword, String newPassword) throws MemberNotFoundException, IdPasswordNotMatchingException {
		
		Member member = memberDao.selectByEmail(email);
		
		if(member == null) {
			
			throw new MemberNotFoundException();
			
		}
		member.changePassword(oldPassword, newPassword);
		
		memberDao.update(member);
	}
	
	
	
	
}
