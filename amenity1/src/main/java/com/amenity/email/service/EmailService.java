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
	
	/// 랜덤 숫자
	public void makeRandomNumber() {
		Random rand = new Random();
		int randNum = rand.nextInt(888888) + 111111; // 000000 ~ 999999 
		System.out.println("인증번호 : " + randNum);
		authNumber = randNum;
	}
	
	//이메일 내용 
	public String sendEmail(String email) {
		makeRandomNumber();
		String setFrom = "qjarbrin@naver.com"; 
		String toMail = email;
		String title =   "인증 이메일 입니다."; 
		String content = "인증 번호는" + 	 

		                 "<br><br>" + 
					      authNumber + "입니다" + 
					     "<br>" + 
					     "해당 인증번호를" + 
					     "작성해주세요.";
		sendEmail(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}

	//�̸��� ���� �޼ҵ�
	public void sendEmail(String setFrom, String toMail, String title, String content) { 
		MimeMessage message = sendemail.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true); // true 로안하면 기본 text 형태로 전송함
			sendemail.send(message);
		} 
		catch (MessagingException e) {
				e.printStackTrace();
			}
		}
	
	
	
	
	
	
	
}
