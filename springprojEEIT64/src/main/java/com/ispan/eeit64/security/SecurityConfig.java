package com.ispan.eeit64.security;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;

import static org.springframework.security.config.Customizer.withDefaults;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    @Override
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
                .withUser("admin")
                .password(passwordEncoder().encode("123"))
                .roles("ADMIN")
                .and() //再新增使用者
				.withUser("user")
				.password("456")
				.roles("USER");
    }
  
    private boolean isCloseSecurity = false;
	@Override
	protected void configure(HttpSecurity http) throws Exception {
//        if(isCloseSecurity){
//            http
//                .authorizeRequests(requests -> requests
//                        .anyRequest().permitAll()
//                        )
//                .cors(cors -> cors.disable())
//                .csrf(csrf -> csrf.ignoringAntMatchers("/**"))
//                ;
//            return;
//        }
        http
            .authorizeRequests(requests -> requests
                    .antMatchers("/resources/**").permitAll()
                    .antMatchers("/assets/img/**").permitAll()
                    .antMatchers("/js/**").permitAll()
                    .antMatchers("/images/**").permitAll()
                    .antMatchers("/restaurant/images/**").permitAll()
                    .antMatchers("/").permitAll()
                    .antMatchers("/**/*.css").permitAll()
                    .antMatchers("/osLogin").permitAll()
                    .antMatchers("/custIndex/**").permitAll()
//                    .antMatchers("/custIndex/newOrder").permitAll()
//                    .antMatchers("/custIndex/queryBanner").permitAll()
                    .antMatchers("/searchorder").permitAll()
                    .antMatchers("/searchorders").permitAll()
                    .antMatchers("/searchbooking").permitAll()
                    .antMatchers("/reservation").permitAll()
                    .antMatchers("/shoppingcart").permitAll()
                    .antMatchers("/shoppingcartInner5").permitAll()
                    .antMatchers("/question").permitAll()
                    .antMatchers("/booking").permitAll()
                    .antMatchers("/restaurant/newbooking").permitAll()
                    .antMatchers("/newbooking").permitAll()
                    .antMatchers("/bookingcheck").permitAll()
                    .antMatchers("/booktest").permitAll()
                    .antMatchers("/menu").permitAll()
                    .antMatchers("/menuInner5").permitAll()
                    .antMatchers("/dishes2").permitAll()
                    .antMatchers("/restInfo").permitAll()
                    .antMatchers("/ordercheck").permitAll()
                    .antMatchers("/test").permitAll()
                    .anyRequest().authenticated()
                    )
            .cors(cors -> cors.disable())
            .csrf(csrf -> csrf
            		.ignoringAntMatchers("/custIndex")
            		.ignoringAntMatchers("/custIndex/**")
                    .csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse()))
               	// .csrf(csrf -> csrf.disable())
            
            .formLogin(login -> login
                    .loginPage("/osLogin")
//                  .usernameParameter("username")
//                  .passwordParameter("password")
//	                .failureUrl("/restaurant/osLogin")
//	                .defaultSuccessUrl("/activity")
                    .successHandler((request, response, authentication) -> {
                        System.out.println("Login Successful!");
                        response.sendRedirect(request.getContextPath() + "/sideNav");
                    })
                    .failureHandler((request, response, exception) -> {
                        System.out.println("Login Failed!");
                        response.sendRedirect(request.getContextPath() + "/osLogin");
                    })
            	)            
            .logout(logout -> logout
            	    .logoutUrl("/logout")
//                	    .logoutSuccessUrl("/osLogin")
            	    .logoutSuccessHandler((request, response, authentication) -> {
            	        System.out.println("Logout Successful!");
                        response.sendRedirect(request.getContextPath() + "/osLogin");
            	    })
            	    .invalidateHttpSession(true)
            	    .deleteCookies("JSESSIONID")
            	);
	}
}
