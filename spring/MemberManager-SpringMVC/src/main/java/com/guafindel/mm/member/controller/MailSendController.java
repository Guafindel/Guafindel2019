package com.guafindel.mm.member.controller;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MailSendController {
	
	@Autowired
	MailSender sender;
	
	@Autowired
	JavaMailSender javaMailSender;

	@RequestMapping("/mail/send")
	@ResponseBody
	public String sendEmail() {
		
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setTo("fgggre@naver.com");
		message.setSubject("안녕하세요.");
		message.setText("Java Mail을 보내는 건 처음이네.");
		message.setFrom("Guafindel@gmail.com");
		
		SimpleMailMessage m = new SimpleMailMessage(message);
		
		sender.send(message);
		
		return "send Ok";
	}
	
	@RequestMapping("/mail/send2")
	@ResponseBody
	public String sendJavaMailSender() {
		
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try {
			//메일 제목
			message.setSubject("Guifindel, 반갑습니다.", "UTF-8");
			String htmlContent = "<h1 style=\"color:blue\">반갑습니다.</h1><br>"
					+ "<a href=\"http://guafindel.tistory.com\">블로그</a>";
			//내용 설정
			message.setText(htmlContent, "UTF-8", "html");
			message.addRecipient(RecipientType.TO, new InternetAddress("fgggre@naver.com", "소종원 님", "UTF-8"));
			
			javaMailSender.send(message);
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "send Ok";
	}
	
	@RequestMapping("/mail/helpersend")
	@ResponseBody
	public String sendFileAttach() {
		
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			//제목
			messageHelper.setSubject("회원분들께 안내 메일 보내드립니다.");
		
			//내용 html
			String htmlContent = "<strong>안녕하세요</strong>, 반갑습니다.";
			
			//내용 설정
			messageHelper.setText(htmlContent, true);
			
			//To 설정
			messageHelper.setTo(new InternetAddress("fgggre@naver.com", "소종원 님", "UTF-8"));
			
			//발송인 설정
			messageHelper.setFrom("Guifindel@gmail.com");
			
			//첨부할 파일 객체 생성
			DataSource dataSource = new FileDataSource("C:\\Users\\guafi\\문서\\i13678135893.gif");
			
			messageHelper.addAttachment(MimeUtility.encodeText("i13678135893.gif", "UTF-8", "B"), dataSource);
			
			javaMailSender.send(message);
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "send Ok";
	}
}
