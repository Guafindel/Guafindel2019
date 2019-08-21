package com.guafindel.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MailSendController {
	
	@Autowired
	MailSender sender;

	@ResponseBody
	@RequestMapping("/mail/send")
	public String sendEmail() {
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo("fgggre@naver.com");
		message.setSubject("안녕하세요.");
		message.setText("Java Mail을 보내는 건 처음이네.");
		message.setFrom("Guafindel@gmail.com");
		
		sender.send(message);
		return "send Ok";
	}
}
