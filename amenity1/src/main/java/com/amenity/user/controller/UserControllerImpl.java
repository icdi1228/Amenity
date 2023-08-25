
package com.amenity.user.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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
	
	//나의 예매내역 출력
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
	
	//결제창
	@RequestMapping(value = { "/user/payment.do"}, method = RequestMethod.POST)
	private ModelAndView payment(@RequestParam("g_no") int g_no,HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);		
		ModelAndView mav = new ModelAndView();				
		
		GoodsVO goodsVO = goodsService.selectGoodsByNo(g_no);
		
		
		mav.addObject("goodsVO",goodsVO);		
		mav.setViewName(viewName);
		return mav;
	}
	
	
	// 결제 실행창
	@RequestMapping(value="/user/payDone.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity payDone(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			resMap.put(name, value);
		}
		
		//예약번호 랜덤생성
		int resNO = resService.makeResNumber();
		
		HttpSession session = request.getSession();		
		userVO = (UserVO) session.getAttribute("userVO");
		String u_id = userVO.getU_id();
		String name = userVO.getName();
		
		
		
		
		resMap.put("resNO", resNO);
		resMap.put("u_id", u_id);
		resMap.put("name", name);
		//결제 테이블에 삽입
		resService.insertRes(resMap);
		
		//resVO 형으로 payComplete에 보내줌		
		ResVO resVO = resService.compleRes(resNO);
		session.setAttribute("resVO", resVO);
		
		//사용자 메일로 결제완료메일 발송
	  	resService.sendEmail_Res(userVO,resNO);
		
		
		String message;
		//
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			
			message = "<script>";
			message += " alert('결제를 성공적으로 완료했습니다.');";
			message += "location.href='"+request.getContextPath()+"/user/payComplete.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			message = "<script>";
			message += " alert('결제에 실패했습니다.');";
			message += "location.href='"+request.getContextPath()+"/main/main.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
	
	
	//결제 완료창
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

	
	//이메일 인증
	@ResponseBody
	@RequestMapping(value = { "/user/sendEmail.do"}, method = RequestMethod.GET)
	private String sendMail(@RequestParam("email") String email,HttpServletRequest request, HttpServletResponse response) {

		System.out.println("이메일 요청");
		System.out.println("요청 이메일 주소 : " + email);
		
		return emailService.sendEmail(email);
	}
	
	
	
	
	//쿠폰함
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
	/////// 사용자 이메일로 아이디찾기    ////////////////////
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

		/////                      사용자 카트 페이지  										///////////

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
	/////                           사용자 카트 담기	      		 				   ///////////
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
		}		
		
		//u_id 따로보내주기
		HttpSession session = request.getSession();
		userVO = (UserVO) session.getAttribute("userVO");
		String u_id = userVO.getU_id();
		
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
	
	/////                     사용 비밀번호 찾기									///////////
	
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
		System.out.println("일치여부 : " + check);
		String u_id = (String) userMap.get("u_id"); 
		
		System.out.println("u_id : " + u_id);
		
		String message;
		
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		if(check) {
			
			message = "<script>";
			message += " alert('회원 정보가 일치합니다. 비밀번호 재설정 화면으로 이동합니다 !');";
			message += "location.href='"+multipartRequest.getContextPath()+"/user/u_newPwd.do?u_id="+u_id+"';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}else {
			message = "<script>";
			message += " alert('회원 정보가 일치하지 않습니다 !');";
			message += "location.href='"+multipartRequest.getContextPath()+"/main/ufind_pwd.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		}
		
		return resEnt;
	}
	
	
	
	/////////비밀번호 재설정 /////
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
			message += " alert('비밀번호를 성공적으로 변경했습니다.');";
			message += "location.href='"+multipartRequest.getContextPath()+"/main/main.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			message = "<script>";
			message += " alert('비밀변호 재설정에 실패했습니다.');";
			message += "location.href='"+multipartRequest.getContextPath()+"/user/userFindPwd.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
	

	//////////////////////////////////////////////////////////////////////////////////////////

	/////                       사용자 개인정보 수정하기									///////////

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
				message += " alert('개인정보 수정을 완료했습니다!');";
				message += "location.href='"+request.getContextPath()+"/user/myInfo.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {					
				message = "<script>";
				message += " alert('개인정보 수정에 실패했습니다!');";
				message += "location.href='"+request.getContextPath()+"/user/myInfo.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
			return resEnt;
		}
		
	
	
	
	
	
}

