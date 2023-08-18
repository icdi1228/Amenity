package com.amenity.email.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class EmailService {
	@Autowired
	private JavaMailSenderImpl sendemail;
	private int authNumber; 
	
	/// 인증번호 난수로 만들기
	public void makeRandomNumber() {
		Random rand = new Random();
		int randNum = rand.nextInt(888888) + 111111; // 000000 ~ 999999 
		System.out.println("인증번호 : " + randNum);
		authNumber = randNum;
	}
	
	//이메일 보낼 양식! 
	public String sendEmail(String email) {
		makeRandomNumber();
		String setFrom = "qjarbrin@naver.com"; 
		String toMail = email;
		String title =   "회원 가입 인증 이메일 입니다."; 
		String content = "인증 번호는 " + 	 
		                 "<br><br>" + 
					      authNumber + "입니다." + 
					     "<br>" + 
					     "해당 인증번호를 인증번호" + 
					     "확인란에 작성 하세요.";
		sendEmail(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}

	//이메일 전송 메소드
	public void sendEmail(String setFrom, String toMail, String title, String content) { 
		MimeMessage message = sendemail.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true); // true 전달 작성하지 않으면 단순 텍스트로 전달.
			sendemail.send(message);
		} 
		catch (MessagingException e) {
				e.printStackTrace();
			}
		}
	
	
	
	
	
	
	
}
