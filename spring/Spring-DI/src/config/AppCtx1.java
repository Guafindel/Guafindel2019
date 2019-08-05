package config;

import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import member.MemberDao;

@Configuration
public class AppCtx1 {
	public AppCtx1() {}

	@Bean
	public MemberDao getMemberDao() {
		return new MemberDao();
		
	}
	
}
