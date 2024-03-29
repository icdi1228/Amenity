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
	
	//이메일 내용 
	public String sendEmail(String email) {
		makeRandomNumber(); // 메서드 호출
		String setFrom = "qjarbrin@naver.com"; 
		String toMail = email;
		String title =   "인증메일 입니다."; 
		String content = "인증번호는 " + 	 
		                 "<br><br>" + 
					      authNumber + "입니다." + 
					     "<br>" + 
					     "위 인증번호를" + 
					     "작성해주세요.";
		sendEmail(setFrom, toMail, title, content); // 메서드 호출
		return Integer.toString(authNumber);
	}

	
	// 랜덤 숫자
		public void makeRandomNumber() {
			Random rand = new Random();
			int randNum = rand.nextInt(888888) + 111111; // 000000 ~ 999999 
			System.out.println("인증번호 : " + randNum);
			authNumber = randNum;
		}
	
	
	// 이메일 내용 메서드?
	public void sendEmail(String setFrom, String toMail, String title, String content) { 
		MimeMessage message = sendemail.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true); // true 안하면 간단한 text형식으로만 보내짐

			sendemail.send(message);
		} 
		catch (MessagingException e) {
				e.printStackTrace();
			}
		}
	
	
	
	
	
	
	
}
