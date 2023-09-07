package com.amenity.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.amenity.bookmark.service.BookmarkService;
import com.amenity.business.service.BusinessService;
import com.amenity.business.vo.BusinessVO;
import com.amenity.company.service.CompanyService;
import com.amenity.company.vo.CompanyVO;
import com.amenity.goods.service.GoodsService;
import com.amenity.goods.vo.GoodsVO;
import com.amenity.mile.service.MileService;
import com.amenity.mile.vo.MileVO;
import com.amenity.res.service.ResService;
import com.amenity.review.service.ReviewService;
import com.amenity.review.vo.ReviewVO;
import com.amenity.service.MainService;
import com.amenity.user.service.UserService;
import com.amenity.user.vo.UserVO;


@Controller("mainController")
public class MainController {
	@Autowired(required=true)
	private MainService mainService;
	
	@Autowired(required=true)
	private GoodsService goodsService;
	
	@Autowired(required=true)
	private UserService userService;
	
	@Autowired(required=true)
	private BusinessService businessService;
	
	@Autowired(required=true)
	private CompanyService companyService;
	
	@Autowired(required=true)
	private ReviewService reviewService;
	
	@Autowired(required=true)
	private BookmarkService bookmarkService;
	
	@Autowired(required=true)
	private MileService mileService;

	@Autowired(required=true)
	private ResService resService;
	
	@Autowired(required=true)
	MileVO mileVO;
	
	@Autowired(required=true)
	private UserVO userVO;
	
	@Autowired(required=true)
	private BusinessVO businessVO;
	
	@Autowired(required=true)
	private CompanyVO companyVO;
	
	@Autowired(required=true)
	private GoodsVO goodsVO;
	
	@Autowired(required=true)
	private ReviewVO reviewVO;
	
	private static final String COMPANY_IMAGE_REPO="C:\\amenity\\business\\company_image";


	private static boolean isLogOn = false;

	
	@RequestMapping(value = { "/Tpay.do"}, method = {RequestMethod.POST, RequestMethod.GET})
	private ResponseEntity<Map<String, String>> rtest(@RequestBody HashMap paytest, HttpServletRequest request , HttpServletResponse response) {
		// 반환값 Map으로 주려고 함
		Map<String, String> responseData = new HashMap<>();
		// DB에 저장하기 위한 map
		Map<String, Object> payMap = new HashMap<>();
		
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		System.out.println("payment : " + paytest);
		
		HttpSession session	 = request.getSession();
		System.out.println("Before getting from session");
		payMap.put("imp_uid", paytest.get("imp_uid"));
		payMap.put("u_id", paytest.get("id"));
		payMap.put("name", paytest.get("buyer_name"));
		payMap.put("tel", paytest.get("buyer_tel"));
		payMap.put("payop", paytest.get("pay_option"));
		payMap.put("price", paytest.get("pay"));
		payMap.put("discount", paytest.get("discount"));
		payMap.put("company", paytest.get("buyer_addr"));
		payMap.put("room", paytest.get("name"));
		payMap.put("order_id", paytest.get("merchant_uid"));
		payMap.put("email", paytest.get("buyer_email"));
		System.out.println("After getting from session: " + paytest);
		
		System.out.println("payMap : " + payMap);
		
		userService.insertPay(payMap);
		
		String payResult = "success"; // 여기서 payResult 값을 설정
        responseData.put("payResult", payResult); 
        return ResponseEntity.ok(responseData); //반환
	}
	
	
	@RequestMapping(value = { "/resultTest.do"}, method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	private ModelAndView rteste(@RequestBody HashMap paytest, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		HttpSession session = request.getSession();
		
		//HashMap<String, Object> paytest ;  
		
		System.out.println("id33333 : " + (String)session.getAttribute("imp_uid"));
		System.out.println("merchant_uid : " + (String)session.getAttribute("merchant_uid"));
		System.out.println("name : " + (String)session.getAttribute("name"));
		System.out.println("email : " + (String)session.getAttribute("buyer_email"));
		System.out.println("buyer_name : " + (String)session.getAttribute("buyer_name"));
		
		
		//int amount = Integer.parseInt((String)session.getAttribute("amount"));
		// 아모르파티
		
		System.out.println("pay ㅇㅅㅇ : " + (String)session.getAttribute("pay"));
		System.out.println("amount ㅇㅅㅇ : " + (String)session.getAttribute("amount"));
		System.out.println("checkin ㅇㅅㅇ : " + (String)session.getAttribute("checkin"));
		System.out.println("checkout ㅇㅅㅇ : " + (String)session.getAttribute("checkout"));
		
		
		
		
		mav.setViewName(viewName);
		return mav;
	}
	
	
	// 메인 페이지로 이동
	@RequestMapping(value = { "/","/main/main.do"}, method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		mav.setViewName(viewName);
		return mav;
	}
	
	// 로그인, 회원가입 링크창으로 이동
	@RequestMapping(value = { "/main/account.do"}, method = RequestMethod.GET)
	private ModelAndView account(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
	//사업자 로그인페이지이동
	@RequestMapping(value = { "/main/b_login.do"}, method = RequestMethod.GET)
	private ModelAndView b_login(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	// 사업자 회원가입 페이지 이동
	@RequestMapping(value = { "/main/b_signup.do"}, method = RequestMethod.GET)
	private ModelAndView b_signup(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	// 사용자 로그인 페이지 이동
	@RequestMapping(value = "/main/u_login.do", method = RequestMethod.GET)
	private ModelAndView u_login(@RequestParam(required = false) String company,
	                              @RequestHeader(value = "referer", required = false) String referer,
	                              HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();

	    if (referer != null) {
	        session.setAttribute("previousPageUrl", referer);
	    }

	    mav.setViewName(viewName);
	    return mav;
	}


	
	//사용자 회원가입 페이지 이동
	@RequestMapping(value = { "/main/u_signup.do"}, method = RequestMethod.GET)
	private ModelAndView u_signup(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
	// 사용자 아이디찾기 이동
	@RequestMapping(value = { "/main/ufind_id.do"}, method = RequestMethod.GET)
	private ModelAndView ufind_id(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	//사용자 비밀번호 찾기 이동
	@RequestMapping(value = { "/main/ufind_pwd.do"}, method = RequestMethod.GET)
	private ModelAndView ufind_pwd(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	//사업자 비밀번호 찾기 이동
	@RequestMapping(value = { "/main/bfind_pwd.do"}, method = RequestMethod.GET)
	private ModelAndView bfind_pwd(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 상품 상세페이지
	@RequestMapping(value = { "/main/product.do"}, method = RequestMethod.GET)
	private ModelAndView product(@RequestParam("company") String company, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName"); 
		System.out.println(viewName);
		
		
		ModelAndView mav = new ModelAndView();

		// 업체명으로 회사정보 companyVO에 담기
		CompanyVO companyVO = companyService.selectedCompany(company);
		// 업체에 등록된 상품 리스트에 담기
		List<GoodsVO> goods = goodsService.companyGoods(company); 
		
		
		// 업체의 모든 리뷰 리스트에 담기
		List<ReviewVO> reviewVO = reviewService.selecteCompanyReviewList(company);
		// 업체의 이미지가져오기
		List<String> main_imgs = companyService.viewMainImg(company);
		List<String> sub_imgs = companyService.viewSubImg(company);
		
		List<String> rooms = goodsService.selectRoom(company);
		// 상품의 이미지 가져오기
		
		List<String> gmain_imgs_accumulated = new ArrayList<>();
		List<String> gsub_imgs_accumulated = new ArrayList<>();

		for (String room : rooms) {
		    List<String> gmain_imgs = goodsService.viewMainImg(room);
		    if (!gmain_imgs.isEmpty()) {
		        gmain_imgs_accumulated.addAll(gmain_imgs);
		    }

		    List<String> gsub_imgs = goodsService.viewSubImg(room);
		    if (!gsub_imgs.isEmpty()) {
		        gsub_imgs_accumulated.addAll(gsub_imgs);
		    }
		}

		mav.addObject("gmain_imgs", gmain_imgs_accumulated);
		mav.addObject("gsub_imgs", gsub_imgs_accumulated);

		int c_no = companyVO.getC_no();
		// 북마크 2023/09/04 이창현 추가
		HttpSession session = request.getSession();
		UserVO userVO =(UserVO) session.getAttribute("userVO");
		if(userVO != null) {
		String u_id = userVO.getU_id();
		//북마크 되어 있는지 확인
		boolean isbook = bookmarkService.chkBookmark(u_id, c_no);
		mav.addObject("isbook",isbook);
		}
		
		

		
		
		
		mav.addObject("company", companyVO);
		mav.addObject("goods", goods);
		mav.addObject("review", reviewVO);
		mav.addObject("sub_imgs", sub_imgs);
		mav.addObject("main_imgs", main_imgs);
		mav.setViewName(viewName);
		System.out.println("product mav : " + mav);
		return mav;
	}

	
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	//						사용자 회원가입 로직										////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="/main/u_addsignup.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity u_addsignup(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		Map<String, Object> userMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			userMap.put(name, value);
		}
		String u_id = (String) userMap.get("u_id");
		
		
		
		String message;
		
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			userService.u_addsignUp(userMap);
			
			// 회원가입시 마일리지 설정
			mileService.accumulateMile(u_id, 0);
			
			message = "<script>";

			message += " alert('회원가입에 성공했습니다.');";

			message += "location.href='"+multipartRequest.getContextPath()+"/main/main.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			message = "<script>";

			message += " alert('Error.');";

			message += "location.href='"+multipartRequest.getContextPath()+"/main/u_signup.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}

		return resEnt;
	}
	
	@PostMapping("/main/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("u_id") String u_id) {		
	    int cnt = mainService.idCheck(u_id);
	    return cnt;
	}

	
	//2023-09-05
	//사용자 로그인 로직
	@RequestMapping(value = "/main/u_signIn.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("userVO") UserVO userVO, RedirectAttributes rAttr,
	                          HttpSession session) throws Exception {
	    ModelAndView mav = new ModelAndView();
	    userVO = userService.u_signIn(userVO);
	    String u_id = userVO.getU_id();
	    
	    

	    if (userVO != null && userVO.getAuth() == null) {
	        session.setAttribute("userVO", userVO);
	        session.setAttribute("isLogOn", true);
	        mav.setViewName("redirect:/main/main.do");
	    } else if (userVO != null && userVO.getAuth() != null) {
	        session.setAttribute("userVO", userVO);
	        session.setAttribute("auth", userVO.getAuth());
	        session.removeAttribute("isLogOn");
	        session.setAttribute("isLogOn", true);
	        mav.setViewName("redirect:/main/main.do");
	    } else {
	        rAttr.addAttribute("result", "loginFailed");
	        mav.setViewName("redirect:/main/u_login.do");
	    }
	    return mav;
	}
	
	
	
//////////////////////////////////////////////////////////////////////////////////////////

/////                       로그아웃										///////////

//////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping(value="/main/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("userVO");
		session.removeAttribute("auth");
		System.out.println("占쎈쐻占쎈뼢域밸챷釉섓옙�뒻占쎌굲");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}
	
	
	
	
			//////////////////////////////////////////////////////////////////////////////////////////

			/////  								 상품목록 조회									///////////

			//////////////////////////////////////////////////////////////////////////////////////////


	@RequestMapping(value="/main/productList.do", method=RequestMethod.GET)
	public ModelAndView listProducts(HttpServletRequest request, HttpServletResponse response, @RequestParam(value="name", required=false) String name) throws Exception {
		request.setCharacterEncoding("utf-8");
	    response.setContentType("html/text; charset=utf-8");
	    String viewName = (String)request.getAttribute("viewName");
	    
	    List<String> main_imgs = new ArrayList<>();
	    List<CompanyVO> companyList;
	    
	    if(name != null && !name.trim().isEmpty()) {
	        companyList = companyService.searchCompaniesByName(name); // Assuming you have this method in your service
	    } else {
	        companyList = companyService.listProducts(); // Original method to get all companies
	    }
	    
	    // companyList 에서 main_img를 가져오는 과정
	    for(CompanyVO companyVO : companyList) {
	    	String company = companyVO.getCompany();
	    	String temp = companyService.viewCompanyListMainImage(company);
	    	main_imgs.add(temp);
	    	System.out.println("company: " + company + " main_imgs" + main_imgs);
	    }
	    
	    
	    ModelAndView mav = new ModelAndView("/main/productList");
	    mav.addObject("companyList", companyList);
	    mav.addObject("main_imgs", main_imgs);
	    return mav;
	}
	
	
	
	
	//////////////////////////////////////////////
	
	
	
	
	@RequestMapping(value="/main/categorySearch.do", method=RequestMethod.GET)
	public ModelAndView searchByCategory(HttpServletRequest request, HttpServletResponse response, @RequestParam("category") String category) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    response.setContentType("html/text; charset=utf-8");
	    
	    List<CompanyVO> companyList = companyService.searchCompaniesByCategory(category);
	    
	    ModelAndView mav = new ModelAndView("/main/productList"); // 占쎈연疫꿸퀣苑뚳옙�뮉 野껉퀗�궢�몴占� 癰귣똻肉т빳占� JSP 占쎈읂占쎌뵠筌욑옙�몴占� 筌욑옙占쎌젟占쎈�占쎈빍占쎈뼄.
	    mav.addObject("companyList", companyList);
	    return mav;
	}

	
	
//////////////////////////////////////////////////////////////////////////////////////////

/////                      �궗�뾽�옄 �쉶�썝媛��엯							///////////

//////////////////////////////////////////////////////////////////////////////////////////


	@RequestMapping(value="/main/businessSignup.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity businessSignup(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		Map<String, Object> businessMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			businessMap.put(name, value);
		}
		
		String message;
		
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			businessService.businessSignup(businessMap);
			message = "<script>";
			message += " alert('사업자 회원가입에 성공했습니다.');";
			message += "location.href='"+multipartRequest.getContextPath()+"/main/main.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			message = "<script>";
			message += " alert('사업자 회원가입에 실패했습니다. 회원가입 양식을 다시 작성해주세요.');";
			message += "location.href='"+multipartRequest.getContextPath()+"/main/b_signup.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}

		return resEnt;
	}
	
	
	
	
	
	
	@RequestMapping("/main/mainDownload.do")
	public void mainDownload(@RequestParam("main_img") String main_img, @RequestParam("company") String company, HttpServletResponse response) throws Exception {
	    String downFile = COMPANY_IMAGE_REPO + "\\" + company + "\\" + "main_img" + "\\" + main_img;
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
	
	@RequestMapping("/main/subDownload.do")
	public void subDownload(@RequestParam("sub_img") String sub_img, @RequestParam("company") String company, HttpServletResponse response) throws Exception {
	    String downFile = COMPANY_IMAGE_REPO + "\\" + company + "\\" + "sub_img" + "\\" + sub_img;
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
	
	///북마크 2023.09.04 이창현 수정
	@RequestMapping("/main/bookmarked.do")
	@ResponseBody
	public String bookmarked(@RequestParam("c_no") int c_no, @RequestParam("u_id") String u_id) {
	    bookmarkService.insertBookmark(u_id, c_no);
		return "상품을 찜했습니다! ";
	}
				


	@RequestMapping("/main/detailSearch.do")
	public ModelAndView detailSearch(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		List<CompanyVO> allCompanyList = companyService.listProducts();
		List<CompanyVO> companyList = new ArrayList<>();
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		System.out.println("detail");
		Enumeration enu = request.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = request.getParameter(name);
			searchMap.put(name, value);
		}
		
		String slatitude = request.getParameter("slatitude");
		String slongitude = request.getParameter("slongitude");
		double userLatitude = Double.parseDouble(slatitude);
	    double userLongitude = Double.parseDouble(slongitude);
	    String checkin = request.getParameter("checkin");
        String checkout = request.getParameter("checkout");
        List<Integer> compgnum = resService.compareRes(checkin, checkout);

        
		for(CompanyVO companyVO : allCompanyList) {
			/* 거리검색 */
			String alatitude = companyVO.getLatitude();
			String alongitude = companyVO.getLongitude();
			/* 별점검색 */
			int companyGrade = companyVO.getGrade();
			/* 가격검색 */
			String company = companyVO.getCompany();
			int goodsPrice = 1000000;
			int goodsStdper = 100;
			List<GoodsVO> goodsList = goodsService.companyGoods(company);
			for(GoodsVO goodsVO : goodsList) {
				if(goodsPrice>=goodsVO.getPrice() && goodsStdper >= goodsVO.getStdper()) {
					goodsPrice = goodsVO.getPrice();
					goodsStdper = goodsVO.getStdper();
				}
			}
			/* 예약날짜 검색 */
			boolean compare = false;

			for (GoodsVO goodsVO : goodsList) {
			    int gnum = goodsVO.getG_no();
			    boolean found = false;
			    for (int goods : compgnum) {
			        // 이 if문(예약내역에 해당 업체의 방번호가 있는 경우)
			    	// 이 if문을 거치는데 거치는 경우 compare를 true로 반전 못시킨다. (한 방도 남아있지 않는 경우)
			    	// 하지만 한 번이라도 거치지 않으면 compare는 true로 반전 (한 방이상 남아있는 경우)
			    	if (gnum == goods) {
			            found = true;
			            break;
			        }
			    }
			    if (!found) {
			        compare = true;
			    }
			}
			System.out.println("compare : " + compare);

		        
			if(alatitude != null && alongitude != null && checkin != null && checkout != null) {
				double companyLatitude = Double.parseDouble(alatitude);
				double companyLongitude = Double.parseDouble(alongitude);
				double distance = calculateDistance(userLatitude, userLongitude, companyLatitude, companyLongitude);

				double selectedDistance = Double.parseDouble((String) searchMap.get("distance"));
				int selectedGrade = Integer.parseInt((String) searchMap.get("grade"));
				int selectedPrice = Integer.parseInt((String) searchMap.get("price"));
				int selectedStdper = Integer.parseInt((String) searchMap.get("stdper"));
				
				if (distance <= selectedDistance && companyGrade >= selectedGrade && goodsPrice <= selectedPrice && goodsStdper <= selectedStdper && compare) {
					System.out.println("distance : " + distance);
					System.out.println("companyGrade : " + companyGrade);
					System.out.println("selectedPrice : " + selectedPrice);
					System.out.println("selectDistance : " + selectedDistance);
					System.out.println("distance : " + distance);
					System.out.println("company : " + companyVO.getCompany());
					companyList.add(companyVO);
					}
				}
			
		}
		
		
		ModelAndView mav = new ModelAndView("/main/productList"); 
	    mav.addObject("companyList", companyList);
	    return mav;
	}
	
	private double calculateDistance(double startLat, double startLon, double arriveLat, double arriveLon) {
		double slat = Math.cos(startLat);
		double absLonVal = Math.abs(startLon - arriveLon);
		double absLatVal = Math.abs(startLat - arriveLat); 
		double x = ((slat * 6400 * 2 * 3.14 / 360)*(absLonVal));
		double y = 111 * absLatVal;
		double calculatedDistance = Math.sqrt((Math.pow(x,2) + Math.pow(y,2)));
	    return calculatedDistance;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
