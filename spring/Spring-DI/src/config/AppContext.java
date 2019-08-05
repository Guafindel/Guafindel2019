package config;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.Scope;

import member.BoardDao;
import member.ChangePasswordService2;
import member.MemberDao;
import member.MemberRegisterService2;

@Configuration
public class AppContext {
	public AppContext() {}

	@Bean(name = "memberDao1")
	@Qualifier("sys")
	//@Scope("prototype")
	public MemberDao getMemberDao() {
		return new MemberDao();
		
	}
	
	@Bean(name = "boardDao")
	public BoardDao getBoardDao() {
		return new BoardDao();
	}
	
	@Bean(name = "registService2")
	public MemberRegisterService2 getMemberRegisterService2() {
		
		//세터 방식
		MemberRegisterService2 service = new MemberRegisterService2();
		//service.setMemberDao(getMemberDao());
	
		return service;
		
		//생성자 방식
		//return new MemberRegisterService2(getMemberDao()); 
	}
	
	@Bean(name = "changePwService2")
	public ChangePasswordService2 getChangePasswordService2() {
		
		//세터 방식
		ChangePasswordService2 service = new ChangePasswordService2();
		//service.setMemberDao(getMemberDao());
		
		return service;
		
		//생성자 방식
		//return new ChangePasswordService2(getMemberDao()); 생성자 방식
	}
}
