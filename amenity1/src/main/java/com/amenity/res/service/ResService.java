package com.amenity.res.service;

import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.amenity.res.dao.ResDAO;
import com.amenity.res.vo.ResVO;

@Service("resService")
@Transactional(propagation = Propagation.REQUIRED)
public class ResService {
	@Autowired	
	private JavaMailSenderImpl sendemail; 
	
	@Autowired(required=true)
	private ResVO resVO;
	
	@Autowired(required=true)
	private ResDAO resDAO;
	
	private int ranNO;

	
	public List paycomres() throws DataAccessException {
		int resNO = makeResNumber();
		System.out.println("예약 : " + resNO);
			
		
		return resDAO.paycomres(resNO);
	}
	

	//이메일 내용 
	public String sendEmail_Res(String email) {
		makeResNumber();
		String setFrom = "qjarbrin@naver.com"; 
		String toMail = email;
		String title =   " 예약 압도적 감사."; 
		String content = " 예약 번호는는 " + 	 
						 "<br><br>" + 
						 ranNO + " 입니다." + 
						 "<br>" +  
						 " 굿  .";
		sendEmail(setFrom, toMail, title, content);
		return Integer.toString(ranNO);
	}
	
	/// 예약번호 숫자
	public int makeResNumber() {
		Random rand = new Random();
		int randNum = rand.nextInt(888888) + 111111; // 000000 ~ 999999 
		System.out.println("예약번호 : " + randNum);
		ranNO = randNum;
		return ranNO;
	}
	
	
	// 이메일 내용 
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
