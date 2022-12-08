package com.sharehouse.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig{

	@Autowired
	private BoardUserDetailsService boardUserDetailsService;
		


	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity security) throws Exception {
	
		
		
		security.authorizeRequests().antMatchers("/baesoeun/").permitAll();
		security.authorizeRequests().antMatchers("/baesoeun/member/**").authenticated();
		security.authorizeRequests().antMatchers("/baesoeun/admin/**").hasAnyRole("ADMIN");
   
		security.csrf().disable();
		security.formLogin().loginPage("/baesoeun/login").defaultSuccessUrl("/baesoeun/loginSuccess", true);
		security.exceptionHandling().accessDeniedPage("/baesoeun/accessDenied"); //403 오류 처리
		security.logout().invalidateHttpSession(true).logoutSuccessUrl("/baesoeun/login"); //로그아웃 성공 시 로그인 페이지로 이동
		
		security.userDetailsService(boardUserDetailsService); // 주입받은 객체 넘겨줌 //db정보와 비교하면서 처리->로그인되면 로그인 페이지로 이동시켜줌
		return security.build();

		
	
	}
	
	// 비밀번호 암호화 처리
	@Bean
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
//	
//	@Autowired
//	public void authenticate(AuthenticationManagerBuilder auth) throws Exception{
//		auth.inMemoryAuthentication()
//		.withUser("manager")
//		.password("{noop}manager123")
//		.roles("MANAGER");
//		
//		auth.inMemoryAuthentication()
//		.withUser("admin")
//		.password("{noop}admin123")
//		.roles("ADMIN","MANAGER");
//		
//	}
}