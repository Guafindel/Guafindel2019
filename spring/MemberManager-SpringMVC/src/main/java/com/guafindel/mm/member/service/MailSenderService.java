package com.guafindel.mm.member.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service("mailSenderService")
public class MailSenderService {

	@Autowired
	private JavaMailSender sender;
	
	public int send(String email) {
		
		MimeMessage message = sender.createMimeMessage();
		
		try {
			message.setSubject("회원가입 안내 메일입니다.", "UTF-8");
			
			String htmlContent = "<h1 class=\"display-6\">회원가입 감사드립니다.</h1>";
			
			message.setText(htmlContent, "UTF-8", "html");
			message.setFrom(new InternetAddress("Guifindel@gmail.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress("fgggre@naver.com", "회원님", "UTF-8"));
			sender.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 1;
	}
	
	public void send(String getmId, String code) {
		
		MimeMessage message = sender.createMimeMessage();
		
		try {
			message.setSubject("(Guafindel)회원가입을 감사드립니다.", "UTF-8");
			String htmlMsg = "<h1>회원가입 신청 감사합니다.</h1>";
			
			htmlMsg += "<p>아래 링크를 클릭하셔서 인증을 마무리 해주세요.</p>";
			htmlMsg += "<p><a href=\"http://localhost:8080/mm/member/verify?id="+getmId+"&code="+code+"\">인증</a></p>";
			
			message.setText(htmlMsg, "UTF-8", "html");
			message.setFrom(new InternetAddress("Guifindel@gmail.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(getmId, "회원님", "UTF-8"));
			
			sender.send(message);
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void reSend(String getmId, String code) {
		
		MimeMessage message = sender.createMimeMessage();
		
		try {
			message.setSubject("(Guafindel)이메일 인증 안내드립니다.","UTF-8");
			String htmlMsg = "<h1>재발송 이메일 인증 안내 발송 메일입니다.</h1>";
			
			htmlMsg += "<p>아래 링크를 클릭하셔서 인증을 마무리 해주세요.</p>";
			htmlMsg += "<p><a href=\"http://localhost:8080/mm/member/verify?id="+getmId+"&code="+code+"\">인증</a></p>";
			
			message.setText(htmlMsg, "UTF-8", "html");
			message.setFrom(new InternetAddress("Guifindel@gmail.com"));
			message.addRecipient(RecipientType.TO, new InternetAddress(getmId, "회원님", "UTF-8"));
			
			sender.send(message);
		
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void findPw(String mId) {
		
		MimeMessage message = sender.createMimeMessage();
		
		
	}
}
