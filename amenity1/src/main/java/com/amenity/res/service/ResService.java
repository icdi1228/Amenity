package com.amenity.res.service;

import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.amenity.res.dao.ResDAO;
import com.amenity.res.vo.ResVO;
import com.amenity.user.vo.UserVO;

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

	
	
	

	//이메일 내용 
	public void sendEmail_Res(UserVO userVO,int resNO) {				
		String setFrom = "qjarbrin@naver.com"; 
		String toMail = userVO.getEmail();
		String title =   userVO.getName()+" 님 예약안내 메일입니다."; 
		String content = "예약해주셔서 감사합니다.<br>"
				+ userVO.getName()+"님의 예약 번호는는 " + 	 
						 "<br><br><b>" + 
						 resNO + "</b> 입니다." + 
						 "<br>" +  
						 " 마이페이지 나의 예약내역에서 세부사항을 확인하실 수 있습니다."
						 + "<br><b>감사합니다.</b>";
		sendEmail(setFrom, toMail, title, content);
		
	}
	
	//이메일 내용 
		public void sendEmail_Res(Map<String, Object> param,int resNO) {				
			String setFrom = "qjarbrin@naver.com"; 
			String toMail = (String) param.get("email");
			String title =   param.get("name") +" 님 예약안내 메일입니다."; 
			String content = "예약해주셔서 감사합니다.<br>"
					+  param.get("name") + " 님의 예약 번호는 " + 	 
							 "<br><br><b>" + 
							 resNO + "</b> 입니다." + 
							 "<br>" +  
							 " 마이페이지 나의 예약내역에서 세부사항을 확인하실 수 있습니다."
							 + "<br><b>감사합니다.</b>";
			sendEmail(setFrom, toMail, title, content);
			
		}
	
	
	
	/// 예약번호 생성
	public int makeResNumber() {
		Random rand = new Random();
		int randNum = rand.nextInt(888888) + 111111; // 000000 ~ 999999 
		System.out.println("예약번호 : " + randNum);		
		return randNum;
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
	
	public int insertRes(Map<String,Object> resMap) throws DataAccessException{
		return resDAO.insertRes(resMap);
	}
	
	public ResVO compleRes(int resNO) throws DataAccessException{
		return resDAO.compleRes(resNO);
	}
	
	public List<ResVO> myRes(String u_id) throws DataAccessException{
		return resDAO.myRes(u_id);
	}
	
	public List<ResVO> selectAllRes() throws DataAccessException{
		return resDAO.selectAllRes();
	}
	
	public List<Integer> compareRes(@Param("checkin") String checkin,@Param("checkout") String checkout) throws DataAccessException{
		return resDAO.compareRes(checkin, checkout);
	}
	
	
}
