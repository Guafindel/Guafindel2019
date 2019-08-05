package member;

import java.util.Date;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("registerMemberService")
public class MemberRegisterService2 {

	@Autowired
	//@Qualifier("sys")
	private MemberDao memberDao;

	//세터 방식
	/*
	 * public void setMemberDao(Dao memberDao) { this.memberDao = memberDao; }
	 */
	
	/*
	 * 생성자 방식
	 * public MemberRegisterService2(MemberDao memberDao) {
	 * 
	 * this.memberDao = memberDao; }
	 */

	



	public void regist(RegisterRequest request) throws AlreadyExistingMemberException {
		System.out.println(memberDao);

		Member member = memberDao.selectByEmail(request.getEmail());

		if (member != null) { // null이 아니라면 같은 이메일이 등록되 있다는 뜻
			throw new AlreadyExistingMemberException();
		}

		Member newMember = new Member(request.getEmail(), request.getPassword(), request.getName(), new Date());

		memberDao.insert(newMember);
	}

}
