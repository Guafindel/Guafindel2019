package member;

import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


public class ChangePasswordService {

	//private MemberDao memberDao = new MemberDao(); 기존의 방식
	
	//생성자 생성 방식 설정
	/*
	 * private MemberDao memberDao; //새로운 방식
	 * 
	 * public ChangePasswordService(MemberDao dao) {
	 * 
	 * memberDao = dao; }
	 */
	
	//프로퍼티 생성 방식 설정
	//@Resource(name = "memberDao")
	@Autowired	
	private Dao memberDao;
	
	/*
	 * public void setMemberDao(MemberDao memberDao) { this.memberDao = memberDao; }
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
