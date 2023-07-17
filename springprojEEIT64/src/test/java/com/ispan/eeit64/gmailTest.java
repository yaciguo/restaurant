package com.ispan.eeit64;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

@SpringBootTest
public class gmailTest {
	
	@Autowired
	JavaMailSender mailSender;
	
	// @Test
	 void sendToGmail() {
	  SimpleMailMessage message = new SimpleMailMessage();  
	  
	  message.setTo("st51022sara@gmail.com");
	  message.setSubject("測試透過 Gmail 去發信");
	  message.setText("org.springframework.mail.SimpleMailMessage 透過 Gmail 發信。");
	  
	//   mailSender.send(message);
	 }
	
}
