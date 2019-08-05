package member;

import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("changePasswordService")
public class ChangePasswordService2 {

	@Autowired
	//@Qualifier("sys")
	private Dao memberDao;
	

	//세터 방식
	/*
	 * public void setMemberDao(Dao memberDao) { this.memberDao = memberDao; }
	 */

	
	/*
	 * 생성자 방식
	 * public ChangePasswordService2(Dao memberDao) {
	 * 
	 * this.memberDao = memberDao; }
	 */




	public void changePassword(String email, String oldPassword, String newPassword) throws MemberNotFoundException, IdPasswordNotMatchingException {
		
		Member member = memberDao.selectByEmail(email);
		
		if(member == null) {
			
			throw new MemberNotFoundException();
			
		}
		member.changePassword(oldPassword, newPassword);
		
		memberDao.update(member);
	}
	
	
	
	
}
