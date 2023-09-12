
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

import org.apache.commons.io.FileUtils;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.amenity.bookmark.service.BookmarkService;
import com.amenity.cart.service.CartService;
import com.amenity.cart.vo.CartVO;
import com.amenity.company.service.CompanyService;
import com.amenity.company.vo.CompanyVO;
import com.amenity.coupon.service.CouponService;
import com.amenity.coupon.vo.CouponVO;
import com.amenity.email.service.EmailService;
import com.amenity.goods.service.GoodsService;
import com.amenity.goods.vo.GoodsVO;
import com.amenity.mile.service.MileService;
import com.amenity.mile.vo.MileVO;
import com.amenity.notice.service.NoticeService;
import com.amenity.notice.vo.NoticeVO;
import com.amenity.res.service.ResService;
import com.amenity.res.vo.ResVO;
import com.amenity.review.service.ReviewService;
import com.amenity.review.vo.ReviewVO;
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
	private CompanyService companyService;
	
	@Autowired(required=true)
	private GoodsService goodsService;
	
	@Autowired(required=true)
	private CartService cartService;
	
	@Autowired(required=true)
	private ResService resService;
	
	@Autowired(required=true)
	private ReviewService reviewService;
	
	@Autowired(required=true)
	private MileService mileService;
	
	@Autowired(required=true)
	private BookmarkService bookmarkService;

	@Autowired(required=true)
	private NoticeService noticeService;

	@Autowired(required=true)
	NoticeVO noticeVO;
	
	@Autowired(required=true)
	MileVO mileVO;
	
	@Autowired(required=true)
	ReviewVO reviewVO;
	
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
	
	
	private static final String ARTICLE_IMAGE_REPO = "C:\\amenity\\notice_admin\\article_image";
	private static final String COUPON_IMAGE_REPO = "C:\\amenity\\coupon_admin\\coupon_image";
	
	// DB에서 공지사항 목록을 가져옴
	@RequestMapping(value = { "/user/notice.do"}, method = RequestMethod.GET)
    public ModelAndView notice(
            HttpServletRequest request, 
            HttpServletResponse response) {
        
    	String viewName = (String)request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView();
        mav.setViewName(viewName);
        
        
        List<NoticeVO> noticeList = noticeService.selectOnlyNotice();
        mav.addObject("noticeList",noticeList);
        return mav;
    }
	
	//내 문의 내역 조회	user_id 기반
	@RequestMapping(value = { "/user/myQuestion.do"}, method = RequestMethod.GET)
	private ModelAndView myQuestion(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		String u_id = userVO.getU_id();
		noticeList = noticeService.selectMyQuestion(u_id);
		
		
		mav.addObject("noticeList",noticeList);
		mav.setViewName(viewName);
		return mav;
	}
	
	//문의글 보기
	@RequestMapping(value = { "/user/viewMyQuestion.do"}, method = RequestMethod.GET)
	private ModelAndView viewMyQuestion(@RequestParam("articleNO")int articleNO,HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		NoticeVO noticeVO = (NoticeVO) noticeService.viewNotice(articleNO);
		List<String> imageFileNames = noticeService.getImageFileNames(articleNO);
		
        mav.addObject("imageFileNames", imageFileNames);				
		mav.addObject("notice",noticeVO);		
		mav.setViewName(viewName);
		return mav;
	}
	
	
	// 사용자 마이페이지 
	@RequestMapping(value = { "/user/myInfo.do"}, method = RequestMethod.GET)
	private ModelAndView myInfo(HttpServletRequest request, HttpServletResponse response,@RequestParam(value="page", defaultValue="1") int page) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		// 세션에서 u_id 받아오기
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		String u_id = userVO.getU_id();
		// db에서 북마크한 c_no 가져오기
		List<Integer> cno = userService.getBookmark(u_id);
		// 내 찜목록 가져오기
		List<CompanyVO> bkCom = new ArrayList<>();
		List<String> main_imgs = new ArrayList<String>();
		for(int c_no : cno) {
			int i = 0;
			bkCom.add(i,(CompanyVO)companyService.selectCompanyByNo(c_no));
			String company = bkCom.get(i).getCompany();
			
			main_imgs.add(i,companyService.viewCompanyMainImage2(company) );
			i++;
		}
	
		//내 쿠폰 목록 가져오기
		List<CouponVO> myCouponList = couponService.findMyCoupon(u_id);		
		
		//마일리지 페이징
		int limit = 10;  // 예시로 페이지당 10개씩 보이도록 설정
        int start = (page - 1) + limit;
        //내 마일리지 정보 가져오기
        List<MileVO> myVarMile = mileService.varMyMile(u_id,start,limit);
        int totalMyMile = mileService.getTotalMyMileCount(u_id);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("myCouponList",myCouponList);
		mav.addObject("myVarMile",myVarMile);
		mav.addObject("totalMyMile", totalMyMile);
        mav.addObject("currentPage", page);
        mav.addObject("company", bkCom);
        mav.addObject("main_imgs", main_imgs);
		
		return mav;
	
	}
	
	//////////사용자 리뷰 작성 페이지 이동/////////////////////////////
	@RequestMapping(value = { "/user/review.do"}, method = RequestMethod.GET)
	private ModelAndView review(@RequestParam int resNO,HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("resNO", resNO);
		mav.setViewName(viewName);
		return mav;
	
	}
	
	
	
	/////////사용자 리뷰 작성 후 + 적립금 ( mileage)적립///////////////
	@RequestMapping(value="/user/writeReview.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity writeReview(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		String u_id = userVO.getU_id();
		
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			reviewMap.put(name, value);
		}
		int resNO = (Integer) Integer.parseInt((String) reviewMap.get("resNO"));
		ResVO resVO = (ResVO) resService.compleRes(resNO);
		int price = (Integer) resVO.getPrice();
		
		String company = resVO.getCompany();
		
		reviewMap.put("g_no", resVO.getG_no());
		reviewMap.put("company", company);
		String bno = companyService.getBno(resVO.getCompany());
		reviewMap.put("b_no", bno);
		
		//리뷰 등록
		reviewService.writeNewReview(reviewMap);
		// 마일리지 적립
		int mile = price/100;
		mileService.accumulateMile(u_id, mile);
		System.out.println(mile + "적립완료 적립완료");
		//마일리지 테이블에 삽입
		int myMile = mileService.findMyMile(u_id);
	    userVO.setMileage(myMile);
	    userService.updateMyMile(userVO);
	    // 리뷰 작성시 입력한 평점 사업체 평점에 반영
	    int grade =  Integer.parseInt((String) reviewMap.get("grade"));
	    int count = reviewService.countReview(company);
	    companyService.updateGrade(company, grade , count);
	    
	    
	    
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		try {
			message = "<script>";
			message += " alert('리뷰를 작성했습니다!');";
			message += "location.href='"+request.getContextPath()+"/user/myInfo.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {					
			message = "<script>";
			message += " alert('리뷰작성에 실패했습니다!');";
			message += "location.href='"+request.getContextPath()+"/user/myInfo.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	/// 사용자 찜한상품(북마크) 삭제
	@RequestMapping(value="/user/deleteMark.do", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity deleteMark(@RequestParam("u_id")String u_id,@RequestParam("c_no")int c_no,HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");		
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
			
		//북마크 삭제하기
		bookmarkService.delBookmark(u_id, c_no);
		
		try {
			message = "<script>";
			message += " alert('선택한 항목을 찜목록에서 삭제했습니다.');";
			message += "location.href='"+request.getContextPath()+"/user/myInfo.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {					
			message = "<script>";
			message += " alert('선택한 항목을 찜목록에서 삭제하는데 실패했습니다.');";
			message += "location.href='"+request.getContextPath()+"/user/myInfo.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
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
			
			for (CartVO cartVO : payList) {
			    System.out.println("payList : " + cartVO.getResform()); // 각 요소 출력
			}
			
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
	private ModelAndView myres(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();		
		userVO = (UserVO) session.getAttribute("userVO");
		List<ResVO> myRes = resService.myRes(userVO.getU_id());
		List<String> rooms = new ArrayList<String>();
		List isReview = new ArrayList();
		// 리뷰를 이미 작성했을 시 리뷰작성 버튼 안보이게하기
		
		for(int i=0;i<myRes.size(); i++) {
			int resNO = myRes.get(i).getResNO();
			boolean hasReview = reviewService.checkMyReview(resNO);
			isReview.add(i, hasReview);
		}
		
		int g_no;
		for(int i = 0; i < myRes.size(); i++) {
			g_no = myRes.get(i).getG_no();
			String room = goodsService.selectGoodsByNo(g_no).getRoom();
			myRes.get(i).setRoom(room);
			////////이미지출력용
			rooms.add(i, room);			
		}
		
		List<String> gmain_imgs_accumulated = new ArrayList<>();

		for (String room : rooms) {
		    List<String> gmain_imgs = goodsService.viewMainImg(room);
		    
		    if (!gmain_imgs.isEmpty()) {
		        gmain_imgs_accumulated.addAll(gmain_imgs);
		    }
		}
		
		mav.addObject("gmain_imgs", gmain_imgs_accumulated);
		mav.addObject("myRes",myRes);
		mav.addObject("isReview",isReview);
		mav.setViewName(viewName);
		return mav;
	}
	
	
	///////pay1///	사용자 상품페이지에서 바로결제(단일결제)
	@RequestMapping(value="/user/pay1.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity pay1(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		HttpSession session = request.getSession();
		Map<String, Object> payMap = new HashMap<String, Object>();

		Enumeration enu = request.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			payMap.put(name, value);
			System.out.println("pay name : " + name + " pay value : " + value);
		}
		//유효성 검사 (로그인 유무)
		
				boolean isLogOn = (boolean) session.getAttribute("isLogOn");
				System.out.println("isLogOn = " + isLogOn);
				if(isLogOn==false) {
					String message;
					ResponseEntity resEnt = null;
					HttpHeaders responseHeaders = new HttpHeaders();
					responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
					message = "<script>";
					message += " alert('상품을 구매하기위해선 로그인이 필요합니다.');";
					message += "location.href='"+request.getContextPath()+"/main/u_login.do';";
					message += " </script>";
					resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
					
					return resEnt;
				}
		
				// g_no 를 이용하여 상품 정보 goodsVO객체에 저장
		int g_no = Integer.parseInt((String) payMap.get("g_no"));
		goodsVO = goodsService.selectGoodsByNo(g_no);
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
			System.out.println("payList : " + payList);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("payList", payList);
		
		}
		
	}
	
	// 사용자 예약완료 로직	
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
		
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		String u_id = userVO.getU_id();
		String u_name = userVO.getName();
 
		List<CartVO> payList = (ArrayList) session.getAttribute("payList");
		
		// 여러건 결제한 경우 payList가 널이아님 
		if(payList != null) {
			for(int i=0;i<payList.size();i++) { 		
				int resNO = resService.makeResNumber(); // 예약번호 랜덤발급
				cartVO = payList.get(i);				// payList에 들어있는 장바구니 객체 하나씩 꺼내오기
				resMap.put("g_no", cartVO.getG_no());				//	
				resMap.put("company", cartVO.getCompany());		 	//	resMap에 키,값 넣어주기
				resMap.put("checkIn", cartVO.getCheckIn());			//
				resMap.put("checkOut", cartVO.getCheckOut());		//	
				resMap.put("checkInTime", cartVO.getCheckInTime());	//	
				resMap.put("checkOutTime", cartVO.getCheckOutTime());//	
				resMap.put("resform", cartVO.getResform());			 //	
				resMap.put("resNO", resNO);
				resMap.put("u_id", u_id);
				resMap.put("name", u_name);
				
				resService.insertRes(resMap);						// 예약 테이블에 값 삽입
				resService.sendEmail_Res(userVO,resNO);

				
				resList.add(i, resService.compleRes(resNO)); 		// 예약VO형의 리스트에 객체 담기
				cartService.deleteCart(cartVO.getC_id());			// 예약완료시 카트 내부 삭제
						
			}
			session.setAttribute("resList", resList);  				// 세션으로 예약 List 넣기
			//세션에서 카트에서 받아온 세션 삭제
			session.removeAttribute("payList");
		}
		
		// 단일 결제 (payList가 널인경우)
		else if(payList == null || payList.size() == 0) {
			int resNO = resService.makeResNumber();

			resMap.put("resNO", resNO);
			resMap.put("u_id", u_id);
			resMap.put("name", u_name);
			
			resService.insertRes(resMap);
			
			ResVO resVO = resService.compleRes(resNO);
			session.setAttribute("resVO", resVO);

		  	resService.sendEmail_Res(userVO,resNO);
		}
		
		//쿠폰 사용 
		couponService.useCoupon(resMap);
		// 마일리지 사용시 감소
		if(resMap.get("mile_point") != null && resMap.get("mile_point") != "") {
		int mile_point = Integer.parseInt((String)resMap.get("mile_point"));
		mileService.accumulateMile(u_id, -mile_point);
		}
		
		String message;
		//
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			
			message = "<script>";
			message += " alert('예약을 성공적으로 완료했습니다.');";
			message += "location.href='"+request.getContextPath()+"/user/payComplete.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		catch(Exception e) {
			message = "<script>";
			message += " alert('예약에 실패했습니다.');";
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
		  	
		  	List<ResVO> resList = new ArrayList<ResVO>();
		  	
		  	HttpSession session = request.getSession();	
		  	
			resVO = (ResVO) session.getAttribute("resVO");
		  	resList = (List) session.getAttribute("resList");
		  	
		  	mav.setViewName(viewName);
		  	mav.addObject("resVO",resVO);
		  	mav.addObject("resList",resList);
		  	session.removeAttribute("resVO");
		  	session.removeAttribute("resList");
	  	  	return mav; 
		  	}
	 
	// 업데이트 폼으로 이동
	@RequestMapping(value = { "/user/updateInfo.do"}, method = RequestMethod.GET)
	private ModelAndView updateInfo(HttpServletRequest request, HttpServletResponse response) {

		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	// 회원가입 이메일 보내기 
	@ResponseBody
	@RequestMapping(value = { "/user/sendEmail.do"}, method = RequestMethod.GET)
	private String sendMail(@RequestParam("email") String email,HttpServletRequest request, HttpServletResponse response) {

		System.out.println("이메일발송");
		System.out.println("인증번호 : " + email);
		
		return emailService.sendEmail(email);
	}
	
	// payment coupon box 
	@RequestMapping(value = { "/user/u_couponbox.do"}, method = RequestMethod.GET)
	private ModelAndView u_couponbox(@RequestParam("u_id") String u_id , HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		
		List<CouponVO> mycoupon = couponService.findMyCoupon(u_id);
		for(CouponVO couponVO : mycoupon) {
			System.out.println("couponName : " + couponVO.getCouponName());
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("mycoupon", mycoupon);
		
		mav.setViewName(viewName);
		return mav;
	}
	
	
	// 이메일로 아이디 찾기
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
	
	//사용자 카트 조회
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

	// 사용자 카트 삭제
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
	

	// 사용자 카트 삽입
	@RequestMapping(value="/user/InCart.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity InCart(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		HttpSession session = request.getSession();
		Map<String, Object> cartMap = new HashMap<String, Object>();
		
		Enumeration enu = request.getParameterNames();
		
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			cartMap.put(name, value);
			System.out.println("cartMap : " + cartMap);
		}
		
		//유효성 검사 (로그인 유무)
		boolean isLogOn = (boolean) session.getAttribute("isLogOn");

		if(isLogOn==false) {
			String message;
			ResponseEntity resEnt = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
			try {
				
				message = "<script>";
				message += " alert('상품을 구매하기위해선 로그인이 필요합니다.');";
				message += "location.href='"+request.getContextPath()+"/main/u_login.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {
				message = "<script>";
				message += " alert('ERROR.');";
				message += "location.href='"+request.getContextPath()+"/main/main.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
			
			return resEnt;
		}
		
		//u_id
		System.out.println("session : " + session);

		UserVO userVO = (UserVO) session.getAttribute("userVO");
		String u_id = userVO.getU_id();
		System.out.println("u_id : " + u_id);

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
					


	
	
	// 사용자 쿠폰 발급 페이지 이동
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
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		mav.setViewName(viewName);
		return mav;
	}
	
	
	// 쿠폰 이미지 다운로드
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
	
	// 쿠폰 받기
	@RequestMapping("/user/couponReceive.do")
	public ResponseEntity<String> couponReceive(@RequestParam("u_id") String u_id, @RequestParam("couponCode") String couponCode, @RequestParam("expiryDate") String expiryDate, @RequestParam("discountType") String discountType, @RequestParam("discountValue") int discountValue, @RequestParam("imagename") String imagename) throws Exception {
	    boolean okay = true;
		List<CouponVO> couponVO = (List)couponService.findMyCoupon(u_id);
		
		
		for(CouponVO test : couponVO) {
			if(test.getCouponCode().equals((String)couponCode)) {
				okay = false;
			}
		}
		
		Map<String, Object> articleMap = new HashMap<String, Object>();
	    if(okay) {
	    	articleMap.put("u_id", u_id);
		    articleMap.put("couponCode", couponCode);
		    articleMap.put("expiryDate", expiryDate);
		    articleMap.put("discountType", discountType);
		    articleMap.put("discountValue", discountValue);
		    articleMap.put("imagename", imagename);
		    couponService.receiveCoupon(articleMap);
		    Map<String, Object> cpMap = new HashMap<String, Object>();
		    int couponetc = couponService.couponCount(u_id);
		    cpMap.put("u_id", u_id);
		    cpMap.put("coupon", couponetc);
		    userService.couponOccur(cpMap);
		    
		    return new ResponseEntity(HttpStatus.OK);
	    }
	    else {
	    	return new ResponseEntity(HttpStatus.BAD_REQUEST);
	    }
	}
	
	// 유저 새로운 비밀번호 설정 페이지
	@RequestMapping(value = { "/user/u_newPwd.do"}, method = RequestMethod.GET)
	private ModelAndView b_newPwd(@RequestParam("u_id") String u_id,HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("u_id", u_id);
		return mav;
	}
	

	// 사용자 비밀번호 찾기 form으로 이동
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
	
	
	// 사용자 비밀번호 업데이트 로직
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
			message += " alert('비밀번호를 변경 했습니다.');";
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
	
	// 사용자 개인정보 수정
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
				message += " alert('회원정보를 수정했습니다.');";
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
			System.out.println("여기와따");
			paramMap.put("flag","kakao");
			userService.setKakaoConnection(paramMap);
			
				if(userVO != null && userVO.getAuth() == null) {
					System.out.println("로그인 와따");	
					String u_id = (String) kakaoConnectionCheck.get("u_id");
					String u_pw = (String) kakaoConnectionCheck.get("u_pw");
					UserVO uVO = new UserVO();
					
					uVO.setU_id(u_id);
					uVO.setU_pw(u_pw);
					
					userVO = userService.u_signIn(uVO);
					
					session.setAttribute("userVO", userVO);
					session.setAttribute("isLogOn", true);
				}
				resultMap.put("JavaData", "YES");
			}
			else{
				userService.setKakaoConnection(paramMap);
				
				if(userVO != null && userVO.getAuth() == null) {
					String u_id = (String) kakaoConnectionCheck.get("u_id");
					String u_pw = (String) kakaoConnectionCheck.get("u_pw");
					UserVO uVO = new UserVO();
					uVO.setU_id(u_id);
					uVO.setU_pw(u_pw);
					userVO = userService.u_signIn(uVO);
					
					session.setAttribute("userVO", userVO);
					session.setAttribute("isLogOn", true);
				}
				
				resultMap.put("JavaData", "YES");
			}
			return resultMap;		
		}
		
		//네이버 로그인
		@RequestMapping(value="/user/NaverLoginPro.do", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> NaverLoginPro(@RequestParam Map<String,Object> paramMap, HttpSession session) throws SQLException, Exception {
			Map <String, Object> resultMap = new HashMap<String, Object>();
					
			Map <String, Object> naverConnectionCheck = userService.kakaoConnectionCheck(paramMap);
			System.out.println("naverConnectionCheck : " + naverConnectionCheck);
			
			if(naverConnectionCheck == null) {    //일치하는 이메일 없을때
				resultMap.put("JavaData", "register");
			}
			else if(naverConnectionCheck.get("api") == null && naverConnectionCheck.get("email") != null) { //이메일 가입 되어있고 카카오 연동 안되어 있을시
				userService.setKakaoConnection(paramMap);
				
				if(userVO != null && userVO.getAuth() == null) {
					String u_id = (String) naverConnectionCheck.get("u_id");
					String u_pw = (String) naverConnectionCheck.get("u_pw");
					
					UserVO uVO = new UserVO();
					
					uVO.setU_id(u_id);
					uVO.setU_pw(u_pw);
					
					userVO = userService.u_signIn(uVO);
					
					session.setAttribute("userVO", userVO);
					session.setAttribute("isLogOn", true);
				}
				resultMap.put("JavaData", "YES");
			}
			else{
				userService.setKakaoConnection(paramMap);
				
				if(userVO != null && userVO.getAuth() == null) {
					String u_id = (String) naverConnectionCheck.get("u_id");
					String u_pw = (String) naverConnectionCheck.get("u_pw");
					UserVO uVO = new UserVO();
					uVO.setU_id(u_id);
					uVO.setU_pw(u_pw);
					userVO = userService.u_signIn(uVO);
					
					session.setAttribute("userVO", userVO);
					session.setAttribute("isLogOn", true);
				}
				
				resultMap.put("JavaData", "YES");
			}
			System.out.println("resultMap : " + resultMap);
			return resultMap;		
		}
		
		
		// api 정보추가
		@RequestMapping(value="/user/setSnsInfo.do")
		public String setKakaoInfo(Model model,HttpSession session,@RequestParam Map<String,Object> paramMap) {
			System.out.println("param ==>"+paramMap);
			
			model.addAttribute("id",paramMap.get("id"));
			model.addAttribute("nickname",paramMap.get("nickname"));
			model.addAttribute("email",paramMap.get("email"));
			
			model.addAttribute("flag",paramMap.get("flag"));
			System.out.println("모델 : " + model );
			
			return "user/snsInfo";
		}
		
		
		// api 회원가입 + 로그인
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
			*/
			else if(flag.equals("naver")) {
				registerCheck = userService.userNaverRegisterPro(paramMap);
			}
			
			
			// 여기서 로그인 기능 구현하면 될듯
			if(registerCheck != null && registerCheck > 0) {
				Map<String, Object> loginCheck = null;
				
				if(flag.equals("kakao")) {
					System.out.println("카카오계정으로 로그인");
					
					if(userVO != null && userVO.getAuth() == null) {
						String u_id = (String) paramMap.get("u_id");
						String u_pw = (String) paramMap.get("u_pw");
						UserVO uVO = new UserVO();
						uVO.setU_id(u_id);
						uVO.setU_pw(u_pw);
						userVO = userService.u_signIn(uVO);
						
						session.setAttribute("userVO", userVO);
						//session.setAttribute("userVO", paramMap);
						session.setAttribute("isLogOn", true);
					}
				}
				else if(flag.equals("naver")) {
					System.out.println("네이버로 로그인");
					
					if(userVO != null && userVO.getAuth() == null) {
						String u_id = (String) paramMap.get("u_id");
						String u_pw = (String) paramMap.get("u_pw");
						UserVO uVO = new UserVO();
						uVO.setU_id(u_id);
						uVO.setU_pw(u_pw);
						userVO = userService.u_signIn(uVO);
						
						//session.setAttribute("userVO", paramMap);
						session.setAttribute("userVO", userVO);
						session.setAttribute("isLogOn", true);
					}
				}	
				 
				resultMap.put("JavaData", "YES");
			}
			else {
				resultMap.put("JavaData", "NO");
			}
			System.out.println("resultMap : " + resultMap);
			return resultMap;
		}
		
		//////// 회원 탈퇴하기 ///////////// 2023.09.05 캐스캐이드온 걸고 확인요망
		@RequestMapping(value="/user/unsignUser.do", method=RequestMethod.POST)
		@ResponseBody
		public ResponseEntity unsignUser(HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			request.setCharacterEncoding("utf-8");
			Map<String, Object> userMap = new HashMap<String, Object>();
			Enumeration enu = request.getParameterNames();
			while(enu.hasMoreElements()) {
				String name = (String)enu.nextElement();
				String value = request.getParameter(name);
				userMap.put(name, value);
			}		
			
			String message;
			ResponseEntity resEnt = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
			
			String u_id = (String) userMap.get("u_id");
			//회원정보 탈퇴테이블로 이동
			userService.addResignUser(userMap);
			// 회원정보user 테이블에서 삭제
			userService.resignUser(u_id);
			
			
				HttpSession session = request.getSession();				
				session.removeAttribute("userVO");
				session.setAttribute("isLogOn", false);
				session.removeAttribute("auth");
							
			try {

				message = "<script>";
				message += " alert('회원정보를 삭제했습니다.');";
				message += "location.href='"+request.getContextPath()+"/main/main.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {					
				message = "<script>";
				message += " alert('회원정보 삭제에 실패했습니다!');";
				message += "location.href='"+request.getContextPath()+"/user/myInfo.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
			return resEnt;
		}
		
		
		
		// 유저 문의 작성 페이지
		@RequestMapping(value = { "/user/qnaForm.do"}, method = RequestMethod.GET)
		private ModelAndView u_qnaForm(HttpServletRequest request, HttpServletResponse response) {
			String viewName = (String)request.getAttribute("viewName");
			System.out.println(viewName);
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			return mav;
		}
		
		// 유저 문의 작성하기		
		@RequestMapping(value="/user/writeQna.do", method= RequestMethod.POST)
		@ResponseBody
		public ResponseEntity writeQna(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
				throws Exception {
			multipartRequest.setCharacterEncoding("utf-8");
			Map<String, Object> noticeMap = new HashMap<String, Object>();
			Enumeration enu = multipartRequest.getParameterNames();
			while(enu.hasMoreElements()) {
				String name = (String)enu.nextElement();
				String value = multipartRequest.getParameter(name);
				noticeMap.put(name, value);
			}
			
			List<String> imageFileNames = noticeUpload(multipartRequest);
			HttpSession session = multipartRequest.getSession();
			UserVO userVO = (UserVO)session.getAttribute("userVO");
			String u_id = userVO.getU_id();			
			noticeMap.put("u_id", u_id);
			noticeMap.put("imageFileNames", imageFileNames);
			
			String message;
			ResponseEntity resEnt = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
			try {
				noticeService.addNewArticle(noticeMap);
				int num = noticeService.selectNewArticleNO();
				for(String imageFileName : imageFileNames) {
				    if(imageFileName != null && imageFileName.length() != 0) {
				        File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				        File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + num);
				        FileUtils.moveFileToDirectory(srcFile, destDir, true);
				        Map<String, Object> imageMap = new HashMap<>();
				        imageMap.put("articleNO", num);
				        imageMap.put("imageFileName", imageFileName);
				        noticeService.addNoticeImage(imageMap);
				        System.out.println("controller name : "+imageFileName);
				    }
				}
				message = "<script>";
				message += " alert('문의를 작성했습니다. ');";
				message += "location.href='"+multipartRequest.getContextPath()+"/user/myQuestion.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {
				File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileNames);
				srcFile.delete();
				
				message = "<script>";
				message += " alert('문의 작성에 실패했습니다. ');";
				message += "location.href='"+multipartRequest.getContextPath()+"/user/myInfo.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
			return resEnt;
		}
		
		
		// 공지사항 이미지 업로드시 temp에 저장
		private List<String> noticeUpload(MultipartHttpServletRequest multipartRequest) throws Exception {
		    List<String> imageFileNames = new ArrayList<>();
		    
		    List<MultipartFile> files = multipartRequest.getFiles("imageFileNames");
		    
		    for (MultipartFile mFile : files) {
		        String originalFileName = mFile.getOriginalFilename();
		        File file = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + originalFileName);
		        
		        if (mFile.getSize() != 0) {
		            if (!file.exists()) {
		                file.getParentFile().mkdirs();
		                mFile.transferTo(new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + originalFileName));
		                System.out.println("upload name : " + originalFileName);
		            }
		        }
		        imageFileNames.add(originalFileName);
		    }
		    
		    return imageFileNames;
		}
		
		
		
		
		
		
		
		
		
	
}

