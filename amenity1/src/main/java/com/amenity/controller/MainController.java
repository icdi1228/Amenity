package com.amenity.controller;

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
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@RequestMapping(value = { "/","/main/main.do"}, method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = { "/main/account.do"}, method = RequestMethod.GET)
	private ModelAndView account(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
	
	@RequestMapping(value = { "/main/b_login.do"}, method = RequestMethod.GET)
	private ModelAndView b_login(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = { "/main/b_signup.do"}, method = RequestMethod.GET)
	private ModelAndView b_signup(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
	
	/*
	
	@RequestMapping(value = { "/main/u_login.do"}, method = RequestMethod.GET)
	private ModelAndView u_login(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	*/
	
	
	
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


	
	
	@RequestMapping(value = { "/main/u_signup.do"}, method = RequestMethod.GET)
	private ModelAndView u_signup(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
	
	@RequestMapping(value = { "/main/ufind_id.do"}, method = RequestMethod.GET)
	private ModelAndView ufind_id(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = { "/main/ufind_pwd.do"}, method = RequestMethod.GET)
	private ModelAndView ufind_pwd(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = { "/main/bfind_pwd.do"}, method = RequestMethod.GET)
	private ModelAndView bfind_pwd(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//상품 상세
	@RequestMapping(value = { "/main/product.do"}, method = RequestMethod.GET)
	private ModelAndView product(@RequestParam("company") String company, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName"); 
		System.out.println(viewName);
		
		
		ModelAndView mav = new ModelAndView();

		// 받은 company 명으로 vo 에 값 받기
		CompanyVO companyVO = companyService.selectedCompany(company);
		// 받은 company 명의의 상품목록 출력하기
		List<GoodsVO> goods = goodsService.companyGoods(company); 
		//goodsService.goodsName(goods);
		
		
		// company 이름으로 등록된 리뷰 값 받기
		List<ReviewVO> reviewVO = reviewService.selecteCompanyReviewList(company);
		// company 다중이미지
		List<String> main_imgs = companyService.viewMainImg(company);
		List<String> sub_imgs = companyService.viewSubImg(company);
		
		List<String> rooms = goodsService.selectRoom(company);
		//room 이미지
		
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
		
		String message;
		
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			userService.u_addsignUp(userMap);
			message = "<script>";

			message += " alert('가입 성공적.');";

			message += "location.href='"+multipartRequest.getContextPath()+"/main/main.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			message = "<script>";

			message += " alert('가입 실패.');";

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

	
//////////////////////////////////////////////////////////////////////////////////////////


/////                        �뜝�떥源띿삕�뜝�룞�삕										///////////

//////////////////////////////////////////////////////////////////////////////////////////

/*
	@RequestMapping(value="/main/u_signIn.do", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("userVO") UserVO userVO, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		userVO = userService.u_signIn(userVO);
		HttpSession session = request.getSession();
		
		if(userVO != null && userVO.getAuth() == null) {
			session.setAttribute("userVO", userVO);
			session.setAttribute("isLogOn", true);
			
			String action = (String)session.getAttribute("action");
			session.removeAttribute("action");
			if(action != null) {
				mav.setViewName("redirect:"+action);
			} else {
				mav.setViewName("redirect:/main/main.do");
			}
		}
		else if(userVO != null && userVO.getAuth() != null) {
			session.setAttribute("userVO", userVO);
			session.setAttribute("auth", userVO.getAuth());
			session.setAttribute("isLogOn", true);
			mav.setViewName("redirect:/main/main.do");
		}
		else {
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/main/u_login.do");
		}
		return mav;
	}
*/
	@RequestMapping(value = "/main/u_signIn.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("userVO") UserVO userVO, RedirectAttributes rAttr,
	                          HttpSession session) throws Exception {
	    ModelAndView mav = new ModelAndView();
	    userVO = userService.u_signIn(userVO);

	    if (userVO != null && userVO.getAuth() == null) {
	        session.setAttribute("userVO", userVO);
	        session.setAttribute("isLogOn", true);

	        // 이전 페이지 URL 가져오기
	        String previousPageUrl = (String) session.getAttribute("previousPageUrl");
	        if (previousPageUrl != null) {
	            mav.setViewName("redirect:" + previousPageUrl);
	            session.removeAttribute("previousPageUrl");
	        } else {
	            mav.setViewName("redirect:/main/main.do");
	        }
	    } else if (userVO != null && userVO.getAuth() != null) {
	        session.setAttribute("userVO", userVO);
	        session.setAttribute("auth", userVO.getAuth());
	        session.setAttribute("isLogOn", true);
	        mav.setViewName("redirect:/main/main.do");
	    } else {
	        rAttr.addAttribute("result", "loginFailed");
	        mav.setViewName("redirect:/main/u_login.do");
	    }
	    return mav;
	}
	
	
	
//////////////////////////////////////////////////////////////////////////////////////////

/////                        �뜝�떥洹몄븘�슱�삕										///////////

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
		System.out.println("�뜝�떥洹몄븘�슱�삕");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}
	
	
	
	
//////////////////////////////////////////////////////////////////////////////////////////

/////                       �뜝�룞�삕�뭹�뜝�룞�삕�뜝占� �뜝�룞�삕�뜝占� 									///////////



//////////////////////////////////////////////////////////////////////////////////////////


	@RequestMapping(value="/main/productList.do", method=RequestMethod.GET)
	public ModelAndView listProducts(HttpServletRequest request, HttpServletResponse response, @RequestParam(value="name", required=false) String name) throws Exception {
		request.setCharacterEncoding("utf-8");
	    response.setContentType("html/text; charset=utf-8");
	    String viewName = (String)request.getAttribute("viewName");
	    
	    List<CompanyVO> companyList;
	    if(name != null && !name.trim().isEmpty()) {
	        companyList = companyService.searchCompaniesByName(name); // Assuming you have this method in your service
	    } else {
	        companyList = companyService.listProducts(); // Original method to get all companies
	    }
	    
	    ModelAndView mav = new ModelAndView("/main/productList");
	    mav.addObject("companyList", companyList);
	    return mav;
	}
	
	
	
	
	//////////////////////////////////////////////
	
	
	
	
	@RequestMapping(value="/main/categorySearch.do", method=RequestMethod.GET)
	public ModelAndView searchByCategory(HttpServletRequest request, HttpServletResponse response, @RequestParam("category") String category) throws Exception {
	    request.setCharacterEncoding("utf-8");
	    response.setContentType("html/text; charset=utf-8");
	    
	    List<CompanyVO> companyList = companyService.searchCompaniesByCategory(category);
	    
	    ModelAndView mav = new ModelAndView("/main/productList"); // �뿬湲곗꽌�뒗 寃곌낵瑜� 蹂댁뿬以� JSP �럹�씠吏�瑜� 吏��젙�빀�땲�떎.
	    mav.addObject("companyList", companyList);
	    return mav;
	}

	
	
//////////////////////////////////////////////////////////////////////////////////////////

/////                      사업자 회원가입							///////////

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
			message += " alert('회원가입을 성공적으로 완료했습니다.');";
			message += "location.href='"+multipartRequest.getContextPath()+"/main/main.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			message = "<script>";
			message += " alert('회원가입에 실패했습니다.');";
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
	
	
	@RequestMapping("/main/bookmarked.do")
	@ResponseBody
	public String bookmarked(@RequestParam("c_no") int c_no, @RequestParam("u_id") String u_id) {
	    boolean isbook = bookmarkService.chkBookmark(u_id, c_no);

	    if (isbook) {
	        bookmarkService.delBookmark(u_id, c_no);
	        return "af";
	    } else {
	        bookmarkService.insertBookmark(u_id, c_no);
	        return "bf";
	    }
	}



	@RequestMapping("/main/detailSearch.do")
	public ModelAndView detailSearch(HttpServletRequest Request, HttpServletResponse response) throws Exception{
		Request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		List<CompanyVO> allCompanyList = companyService.listProducts();
		List<CompanyVO> companyList = new ArrayList<>();
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		System.out.println("detail");
		Enumeration enu = Request.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = Request.getParameter(name);
			searchMap.put(name, value);
		}
		
		String slatitude = Request.getParameter("slatitude");
		String slongitude = Request.getParameter("slongitude");
		double userLatitude = Double.parseDouble(slatitude);
	    double userLongitude = Double.parseDouble(slongitude);
	    
		for(CompanyVO companyVO : allCompanyList) {
			String alatitude = companyVO.getLatitude();
			String alongitude = companyVO.getLongitude();
			int companyGrade = companyVO.getGrade();
			if(alatitude != null && alongitude != null) {
				double companyLatitude = Double.parseDouble(alatitude);
				double companyLongitude = Double.parseDouble(alongitude);
				double distance = calculateDistance(userLatitude, userLongitude, companyLatitude, companyLongitude);

				double selectedDistance = Double.parseDouble((String) searchMap.get("distance"));
				int selectedGrade = Integer.parseInt((String) searchMap.get("grade"));
				int selectedPrice = Integer.parseInt((String) searchMap.get("price"));
				
				
				if (distance <= selectedDistance && companyGrade >= selectedGrade) {
					System.out.println("distance : " + distance);
					System.out.println("companyGrade : " + companyGrade);
					System.out.println("selectedPrice : " + selectedPrice);
					System.out.println("selectDistance : " + selectedDistance);
					companyList.add(companyVO);
				}
			}
		}
		
		
		ModelAndView mav = new ModelAndView("/main/productList"); 
	    mav.addObject("companyList", companyList);
	    return mav;
	}
	
	
}
