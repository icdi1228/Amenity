
package com.amenity.user.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.amenity.cart.service.CartService;
import com.amenity.cart.vo.CartVO;
import com.amenity.coupon.service.CouponService;
import com.amenity.coupon.vo.CouponVO;
import com.amenity.email.service.EmailService;
import com.amenity.goods.service.GoodsService;
import com.amenity.goods.vo.GoodsVO;
import com.amenity.res.service.ResService;
import com.amenity.res.vo.ResVO;
import com.amenity.user.service.UserService;
import com.amenity.user.vo.UserVO;


@Controller("userController")
public class UserControllerImpl {
	@Autowired(required=true)
	private UserService userService;

	@Autowired(required=true)
	private EmailService emailService;
	
	@Autowired(required=true)
	private CouponService couponService;
	
	
	@Autowired(required=true)
	private GoodsService goodsService;
	
	@Autowired(required=true)
	private CartService cartService;
	
	@Autowired(required=true)
	private ResService resService;

	@Autowired(required=true)
	UserVO userVO;
	
	@Autowired(required=true)
	CartVO cartVO;
	
	@Autowired(required=true)
	CouponVO couponVO;
	
	@Autowired(required=true)
	ResVO resVO;
	
	@Autowired(required=true)
	GoodsVO goodsVO;
	
	
	
	private static final String COUPON_IMAGE_REPO = "C:\\amenity\\coupon_admin\\coupon_image";
	
	@RequestMapping(value = { "/user/notice.do"}, method = RequestMethod.GET)
	private ModelAndView notice(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = { "/user/myQuestion.do"}, method = RequestMethod.GET)
	private ModelAndView myQuestion(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = { "/user/myInfo.do"}, method = RequestMethod.GET)
	private ModelAndView myInfo(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	//사용자 결제페이지
	@RequestMapping(value = { "/user/payment.do"}, method = RequestMethod.GET)
	private ModelAndView payment(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("payList") != null) {
		List<CartVO> payList = (List) session.getAttribute("payList");
		
		mav.addObject("payList",payList);
		}
		else {
		GoodsVO goodsVO = (GoodsVO) session.getAttribute("goodsVO");
		Map<String, Object> payMap = (HashMap<String,Object>) session.getAttribute("payMap");
		mav.addObject("goodsVO",goodsVO);
		mav.addObject("payMap",payMap);
		}
		
		
		mav.setViewName(viewName);
		return mav;
	}
	
	
	// 사용자 예약내역 출력 
	@RequestMapping(value = { "/user/myres.do"}, method = RequestMethod.GET)
	private ModelAndView myres(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();		
		userVO = (UserVO) session.getAttribute("userVO");
		List<ResVO> resF = resService.myRes(userVO.getU_id());
		mav.addObject("resF",resF);
		mav.setViewName(viewName);
		return mav;
	}
	
	
	///////pay1///	사용자 상품페이지에서 바로결제(단일결제)
	@RequestMapping(value="/user/pay1.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity pay1(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		Map<String, Object> payMap = new HashMap<String, Object>();

		Enumeration enu = request.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			payMap.put(name, value);
			System.out.println("pay name : " + name + " pay value : " + value);
		}
		
		int g_no = Integer.parseInt((String) payMap.get("g_no"));
		goodsVO = goodsService.selectGoodsByNo(g_no);
		HttpSession session = request.getSession();
		session.setAttribute("goodsVO", goodsVO);
		session.setAttribute("payMap", payMap);
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			
			message = "<script>";
			message += " alert('결제창으로 이동합니다.');";
			message += "location.href='"+request.getContextPath()+"/user/payment.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			message = "<script>";
			message += " alert('결제창으로 이동하는데 실패했습니다.');";
			message += "location.href='"+request.getContextPath()+"/main/main.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
	
	
	
	
/* 이창현 수정예정 사용자 결제 */
	//사용자 장바구니에서 결제 (여러개가능)
	@RequestMapping(value = { "/user/pay.do"}, method = RequestMethod.POST)
	private void pay(@RequestBody(required = false) List<Integer> cartList , HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);


		List<CartVO> payList = new ArrayList<>();
			
		if(cartList != null) {
		for(int i=0;i<cartList.size();i++) {
			int c_id = cartList.get(i); 
			payList.add(cartService.selectedCart(c_id));
			
			}
		HttpSession session = request.getSession();
		session.setAttribute("payList", payList);
		}
		
	}
	////////////////////////////////////////////////////////////////////////
	////////////////// 		사용자 예약완료 로직					///////////////
	/////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="/user/payDone.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity payDone(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		List<ResVO> resList = new ArrayList<ResVO>();
		Enumeration enu = request.getParameterNames();
		HttpSession session = request.getSession();
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			resMap.put(name, value);
		}
		
		//
		userVO = (UserVO) session.getAttribute("userVO");
		String u_id = userVO.getU_id();
		String u_name = userVO.getName();
		//
		List<CartVO> payList = (ArrayList) session.getAttribute("payList");
		
		// 여러건 결제한 경우 payList가 널이아님 
		if(payList != null) {
			for(int i=0;i<payList.size();i++) { 		
				int resNO = resService.makeResNumber(); // 예약번호 랜덤발급
				cartVO = payList.get(i);				// payList에 들어있는 장바구니 객체 하나씩 꺼내오기
				resMap.put("g_no", cartVO.getG_no());				//	
				resMap.put("company", cartVO.getCompany());			//
				resMap.put("price", cartVO.getPrice());				//	resMap에 키,값 넣어주기
				resMap.put("checkIn", cartVO.getCheckIn());			//
				resMap.put("checkOut", cartVO.getCheckOut());		//	
				resMap.put("resNO", resNO);
				resMap.put("u_id", u_id);
				resMap.put("name", u_name);
				
				resService.insertRes(resMap);						// 예약 테이블에 값 삽입
				resService.sendEmail_Res(userVO,resNO);				// 예약완료 이메일 발송
				
				resList.add(i, resService.compleRes(resNO)); 		// 예약VO형의 리스트에 객체 담기
				cartService.deleteCart(cartVO.getC_id());			// 예약완료시 카트 내부 삭제
						
			}
			session.setAttribute("resList", resList);  				// 세션으로 예약 List 넣기
			//세션에서 카트에서 받아온 세션 삭제
			session.removeAttribute("payList");
		}
		// 단일 결제 (payList가 널인경우)
		else if(payList == null) {
			int resNO = resService.makeResNumber();

			
			resMap.put("resNO", resNO);
			resMap.put("u_id", u_id);
			resMap.put("name", u_name);

			resService.insertRes(resMap);
			
			
			ResVO resVO = resService.compleRes(resNO);
			session.setAttribute("resVO", resVO);


		  	resService.sendEmail_Res(userVO,resNO);
		}

	  	
		String message;
		//
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			
			message = "<script>";
			message += " alert('성공.');";
			message += "location.href='"+request.getContextPath()+"/user/payComplete.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			message = "<script>";
			message += " alert('실패.');";
			message += "location.href='"+request.getContextPath()+"/main/main.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
	
	
	//사용자 결제완료 페이지
	  @RequestMapping(value = { "/user/payComplete.do"}, method = RequestMethod.GET)
	  private ModelAndView payComplete(HttpServletRequest request, HttpServletResponse response) {
		  	String viewName = (String)request.getAttribute("viewName");
		  	System.out.println(viewName);
		  	ModelAndView mav = new ModelAndView();
		  	HttpSession session = request.getSession();		
			resVO = (ResVO) session.getAttribute("resVO");
		  	
		  	
		  	mav.setViewName(viewName);
		  	mav.addObject("resVO",resVO);
	  	  	return mav; 
		  	}
	 
	
	
	@RequestMapping(value = { "/user/updateInfo.do"}, method = RequestMethod.GET)
	private ModelAndView updateInfo(HttpServletRequest request, HttpServletResponse response) {

		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	

	@ResponseBody
	@RequestMapping(value = { "/user/sendEmail.do"}, method = RequestMethod.GET)
	private String sendMail(@RequestParam("email") String email,HttpServletRequest request, HttpServletResponse response) {

		System.out.println("이메일발송");
		System.out.println("인증번호 : " + email);
		
		return emailService.sendEmail(email);
	}
	
	
	
	

	@RequestMapping(value = { "/user/u_couponbox.do"}, method = RequestMethod.GET)
	private ModelAndView u_couponbox(@RequestParam("u_id") String u_id , HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		
		List<CouponVO> mycoupon = couponService.findMyCoupon(u_id);
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("mycoupon", mycoupon);
		
		mav.setViewName(viewName);
		return mav;
	}
	
	
	
	
	
	
	
	
	////////////////////////////////////////////////////
	///////   이메일로 아이디 찾기 		////////////////////
	////////////////////////////////////////////////////
	
	@RequestMapping(value="/user/selectUfindIdByEmail.do")
	public ModelAndView selectUfindIdByEmail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		System.out.println("name: " + name);
		System.out.println("email: " + email);
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		UserVO result = userService.selectUfindIdByEmail(name, email);	
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("result", result);
		return mav;
	}
	
	
		//////////////////////////////////////////////////////////////////////////////////////////

		/////                      		사용자 카트 조회									///////////

		//////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="/user/cart.do")	
	public ModelAndView cart(@RequestParam("u_id") String u_id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		List<CartVO> cartList = cartService.listUserCart(u_id);
		
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("cartList",cartList);
		
		return mav;
	}




	
	//////////////////////////////////////////////////////////////////////////////////////////
	/////                           사용자 카트 삭제	      		 				   ///////////
	//////////////////////////////////////////////////////////////////////////////////////////

	@RequestMapping(value="/user/delCart.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity delCart(@RequestBody List<Integer> cartList,HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		
		//장바구니 삭제
		for(int i=0;i<cartList.size();i++) {
			cartService.deleteCart(cartList.get(i));
			System.out.println("cartList값 : " + cartList.get(i));
		}
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			
			message = "<script>";
			message += " alert('선택한 상품을 장바구니에서 삭제했습니다!');";
			message += "location.reload();";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			message = "<script>";
			message += " alert('삭제에 실패했습니다.');";
			message += "location.href='"+request.getContextPath()+"/main/main.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
		
	}
	
		
	
	
	//////////////////////////////////////////////////////////////////////////////////////////
	/////                           사용자 카트 삽입	      		 				   ///////////

	//////////////////////////////////////////////////////////////////////////////////////////

	@RequestMapping(value="/user/InCart.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity InCart(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		Map<String, Object> cartMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			cartMap.put(name, value);
			System.out.println("cart name : " + name + " cart value : " + value);
		}		
		
		//u_id
		HttpSession session = request.getSession();	
		userVO = (UserVO) session.getAttribute("userVO");
		String u_id = userVO.getU_id();
		
		cartMap.put("u_id", u_id);
		
		String message;
		cartService.insertCart(cartMap);
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			
			message = "<script>";
			message += " alert('상품을 장바구니에 담았습니다.');";
			message += "location.href='"+request.getContextPath()+"/user/cart.do?u_id="+u_id+"';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			message = "<script>";
			message += " alert('상품을 장바구니에 담는데 실패했습니다.');";
			message += "location.href='"+request.getContextPath()+"/main/main.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}
					


	
	
	////////////////////////////////////////////////////
	
	@RequestMapping(value = { "/user/event.do"}, method = RequestMethod.GET)
	private ModelAndView event(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("html/text; charset=utf-8");
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		try {
			request.setCharacterEncoding("utf-8");
			List<CouponVO> coupons = couponService.viewCoupon();
			mav.addObject("coupons",coupons);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		mav.setViewName(viewName);
		return mav;
	}
	
	
	
	@RequestMapping("/user/couponDownload.do")
	public void couponDownload(@RequestParam("imageName") String imageName, @RequestParam("couponCode") String couponCode, HttpServletResponse response) throws Exception {
	    String downFile = COUPON_IMAGE_REPO + "\\" + couponCode + "\\" + imageName;
	    File file = new File(downFile);

	    if (file.exists() && file.isFile()) {
	        response.setContentType("image/jpeg");
	        FileInputStream fis = new FileInputStream(file);
	        BufferedInputStream inStream = new BufferedInputStream(fis);
	        ServletOutputStream outStream = response.getOutputStream();

	        byte[] buffer = new byte[1024];
	        int bytesRead = 0;
	        while ((bytesRead = inStream.read(buffer)) != -1) {
	            outStream.write(buffer, 0, bytesRead);
	        }
	        outStream.flush();
	        outStream.close();
	        inStream.close();
	    }
	}
	
	@RequestMapping("/user/couponReceive.do")
	public ResponseEntity<String> couponReceive(@RequestParam("u_id") String u_id, @RequestParam("couponCode") String couponCode, @RequestParam("expiryDate") String expiryDate, @RequestParam("discountType") String discountType, @RequestParam("discountValue") int discountValue, @RequestParam("imagename") String imagename) throws Exception {
	    Map<String, Object> articleMap = new HashMap<String, Object>();
	    articleMap.put("u_id", u_id);
	    articleMap.put("couponCode", couponCode);
	    articleMap.put("expiryDate", expiryDate);
	    articleMap.put("discountType", discountType);
	    articleMap.put("discountValue", discountValue);
	    articleMap.put("imagename", imagename);
	    couponService.receiveCoupon(articleMap);
	    
	    return new ResponseEntity<String>("Received", HttpStatus.OK);
	}
	
	/////
	@RequestMapping(value = { "/user/u_newPwd.do"}, method = RequestMethod.GET)
	private ModelAndView b_newPwd(@RequestParam("u_id") String u_id,HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("u_id", u_id);
		return mav;
	}
	
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////
	

	/////                     사용자 비밀번호 찾기									///////////

	
	//////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="/user/userFindPwd.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity u_FindPwd(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		Map<String, Object> userMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			userMap.put(name, value);
		}
		
		boolean check = userService.checkUser(userMap); 
		System.out.println("�씪移섏뿬遺� : " + check);
		String u_id = (String) userMap.get("u_id"); 
		
		System.out.println("u_id : " + u_id);
		
		String message;
		
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		if(check) {
			
			message = "<script>";
			message += " alert('비밀번호 찾기 완료 !');";
			message += "location.href='"+multipartRequest.getContextPath()+"/user/u_newPwd.do?u_id="+u_id+"';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}else {
			message = "<script>";
			message += " alert('실패!');";
			message += "location.href='"+multipartRequest.getContextPath()+"/main/ufind_pwd.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		}
		
		return resEnt;
	}
	
	

	@RequestMapping(value="/user/u_updatePwd.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity u_updatePwd(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		Map<String, Object> userMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			userMap.put(name, value);
		}
		
		System.out.println("u_id: " + userMap.get("u_id"));
		
		String message;
		userService.changeU_pwd(userMap);
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			
			message = "<script>";
			message += " alert('변경완료.');";
			message += "location.href='"+multipartRequest.getContextPath()+"/main/main.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			message = "<script>";
			message += " alert('실패.');";
			message += "location.href='"+multipartRequest.getContextPath()+"/user/userFindPwd.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
	

	//////////////////////////////////////////////////////////////////////////////////////////

	/////             			사용자 개인정보 수정										///////////

	//////////////////////////////////////////////////////////////////////////////////////////


		@RequestMapping(value="/user/updateInfo.do", method=RequestMethod.POST)
		@ResponseBody
		public ResponseEntity u_updateInfo(HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			request.setCharacterEncoding("utf-8");
			Map<String, Object> userMap = new HashMap<String, Object>();
			Enumeration enu = request.getParameterNames();
			while(enu.hasMoreElements()) {
				String name = (String)enu.nextElement();
				String value = request.getParameter(name);
				userMap.put(name, value);
			}
			userService.updateInfo(userMap);
			
			
			
			String message;
			ResponseEntity resEnt = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
			
			
				HttpSession session = request.getSession();
				session.removeAttribute("userVO");
				
				String u_id = (String) userMap.get("u_id");
				String u_pw = (String) userMap.get("u_pw");
				userVO.setU_id(u_id);
				userVO.setU_pw(u_pw);
				userVO = userService.u_signIn(userVO);
				
				session.setAttribute("userVO", userVO);
				session.setAttribute("isLogOn", true);
				String action=(String)session.getAttribute("action");
				
			
			try {


				message = "<script>";
				message += " alert('성공!');";
				message += "location.href='"+request.getContextPath()+"/user/myInfo.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {					
				message = "<script>";
				message += " alert('실패!');";
				message += "location.href='"+request.getContextPath()+"/user/myInfo.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
			return resEnt;
		}
		
		//카카오 로그인
		@RequestMapping(value="/user/kakaoLoginPro.do", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> kakaoLoginPro(@RequestParam Map<String,Object> paramMap, HttpSession session) throws SQLException, Exception {
			System.out.println("paramMap:" + paramMap);
			Map <String, Object> resultMap = new HashMap<String, Object>();
			
			Map <String, Object> kakaoConnectionCheck = userService.kakaoConnectionCheck(paramMap);
			System.out.println("kakaoConnectionCheck : " + kakaoConnectionCheck);
			
			if(kakaoConnectionCheck == null) {    //일치하는 이메일 없을때
				resultMap.put("JavaData", "register");
			}
			else if(kakaoConnectionCheck.get("api") == null && kakaoConnectionCheck.get("email") != null) { //이메일 가입 되어있고 카카오 연동 안되어 있을시
				System.out.println("kakao 로 로그인");
				userService.setKakaoConnection(paramMap);
				Map<String, Object> loginCheck = userService.userKakaoLoginPro(paramMap);
				
				if(userVO != null && userVO.getAuth() == null) {
					session.setAttribute("userVO", loginCheck);
					session.setAttribute("isLogOn", true);
				}
				resultMap.put("JavaData", "YES");
			}
			else{
				System.out.println("이건가?");
				Map<String, Object> loginCheck = userService.userKakaoLoginPro(paramMap);
				session.setAttribute("userInfo", loginCheck);
				resultMap.put("JavaData", "YES");
			}
			System.out.println("resultMap : " + resultMap);
			return resultMap;		
		}
	
		// 여기도 포함임
		@RequestMapping(value="/user/setSnsInfo.do")
		public String setKakaoInfo(Model model,HttpSession session,@RequestParam Map<String,Object> paramMap) {
			System.out.println("setKakaoInfo");	
			System.out.println("param ==>"+paramMap);
			
			model.addAttribute("id",paramMap.get("id"));
			model.addAttribute("nickname",paramMap.get("nickname"));
			model.addAttribute("email",paramMap.get("email"));
			
			model.addAttribute("flag",paramMap.get("flag"));
			System.out.println("모델 : " + model );
			
			return "user/snsInfo";
		}
		
		
		// 카카오 회원가입 + 로그인
		@RequestMapping(value="/user/SnsRegisterPro.do", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> userSnsRegisterPro(@RequestParam Map<String,Object> paramMap,HttpSession session) throws SQLException, Exception {
			System.out.println("paramMap:" + paramMap);
			Map <String, Object> resultMap = new HashMap<String, Object>();
			String flag = (String) paramMap.get("flag");
			Integer registerCheck = null;
			
			if(flag.equals("kakao")) {
				System.out.println("카카오 회원가입");
				registerCheck = userService.userKakaoRegisterPro(paramMap);
			}
			/*
			else if(flag.equals("google")) {
				registerCheck = userService.userGoogleRegisterPro(paramMap);
			}
			else if(flag.equals("naver")) {
				registerCheck = userService.userNaverRegisterPro(paramMap);
			}
			*/
			
			// 여기서 로그인 기능 구현하면 될듯
			if(registerCheck != null && registerCheck > 0) {
				Map<String, Object> loginCheck = null;
				
				if(flag.equals("kakao")) {
					System.out.println("카카오계정으로 로그인");
					loginCheck = userService.userKakaoLoginPro(paramMap);
					
					if(userVO != null && userVO.getAuth() == null) {
						session.setAttribute("userVO", paramMap);
						session.setAttribute("isLogOn", true);
					}
				}
				/*
				else if(flag.equals("google")) {
					loginCheck = userService.userGoogleLoginPro(paramMap);
				}
				else if(flag.equals("naver")) {
					loginCheck = userService.userNaverLoginPro(paramMap);
				}
				*/ 
				resultMap.put("JavaData", "YES");
			}
			else {
				resultMap.put("JavaData", "NO");
			}
			System.out.println("resultMap : " + resultMap);
			return resultMap;
		}
		
		
		
	
}

