package member;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class MemberDao {

	private static long nextId = 0;
	private Map<String, Member> map = new HashMap<String, Member>();
	
	public Member selectByEmail (String email) {
		return map.get(email);
	}
	
	public void insert(Member member) {
		member.setId(++nextId); //전위형 증산자가 붙었기 때문에 nextId는 먼저 1 증가해서 첫 번째 값으로 1이 들어간다.
		map.put(member.getEmail(), member);
	}

	public void update(Member member) {
		map.put(member.getEmail(), member);
	}
	
	public Collection<Member> selectAll() {
		return map.values();
		
	}
}
