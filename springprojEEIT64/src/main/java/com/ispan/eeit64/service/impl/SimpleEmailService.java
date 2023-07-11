package com.ispan.eeit64.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SimpleEmailService{
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	  public void sendEmail(String to, String from, String subject, String content) {
	        SimpleMailMessage mail = new SimpleMailMessage();
	        mail.setTo(to);
	        mail.setFrom("diandianeatfood@gmail.com");
	        mail.setSubject(subject);
	        mail.setText(content);
	        javaMailSender.send(mail);
	    }

}
