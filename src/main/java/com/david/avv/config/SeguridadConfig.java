package com.david.avv.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@ComponentScan(basePackages="com.david.avv")
public class SeguridadConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
		
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/asociado/**").hasAnyRole("SECRETARIO","ADMIN","VOCAL")
		.antMatchers("/administracion/**").hasAnyRole("SECRETARIO","ADMIN")
		.antMatchers("/secretario/**").hasRole("SECRETARIO")
		.and().formLogin().loginPage("/formlogin").loginProcessingUrl("/authenticateTheUser")
		.defaultSuccessUrl("/talleres").permitAll()
		.and().logout().logoutSuccessUrl("/").permitAll()
		.and().exceptionHandling().accessDeniedPage("/prohibido");
	}

}
