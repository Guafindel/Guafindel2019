package config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.Scope;

import member.ChangePasswordService2;
import member.MemberDao;
import member.MemberRegisterService2;

@Configuration
@Import(AppCtx1.class) //xml의 import와 같이 클래스 파일 설정을 이와같이 불러올 수 있다.
public class AppCtx2 {
	public AppCtx2() {}
	
	@Autowired
	MemberDao dao;

	
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
