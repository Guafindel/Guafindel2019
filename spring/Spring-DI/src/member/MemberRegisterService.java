package member;

import java.util.Date;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


public class MemberRegisterService {

	//@Resource(name = "memberDao")
	@Autowired
	private Dao memberDao;
	
	/*
	 * public MemberRegisterService(MemberDao memberDao) { this.memberDao =
	 * memberDao; }
	 */
	
	/*
	 * public void setMemberDao(MemberDao memberDao) { this.memberDao = memberDao;
	 * 
	 * }
	 */
	
	public void regist(RegisterRequest request) throws AlreadyExistingMemberException {
		System.out.println(memberDao);
		
		Member member = memberDao.selectByEmail(request.getEmail());
		
		if(member != null) { //null이 아니라면 같은 이메일이 등록되 있다는 뜻
			throw new AlreadyExistingMemberException();
		}
		
		Member newMember = new Member(request.getEmail(), request.getPassword(), request.getName(), new Date());
	
		memberDao.insert(newMember);
	}
	
}
