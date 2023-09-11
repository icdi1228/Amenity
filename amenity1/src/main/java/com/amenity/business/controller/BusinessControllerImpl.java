package com.amenity.business.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.amenity.business.service.BusinessService;
import com.amenity.business.vo.BusinessVO;
import com.amenity.company.service.CompanyService;
import com.amenity.company.vo.CompanyVO;
import com.amenity.goods.service.GoodsService;
import com.amenity.goods.vo.GoodsVO;
import com.amenity.notice.service.NoticeService;
import com.amenity.notice.vo.NoticeVO;
import com.amenity.res.service.ResService;
import com.amenity.review.service.ReviewService;
import com.amenity.review.vo.ReviewVO;

@Controller("BusinessController")
public class BusinessControllerImpl {
	@Autowired(required=true)
	private BusinessService businessService;
	
	@Autowired(required=true)
	BusinessVO businessVO;
	
	@Autowired(required=true)
	private CompanyService companyService;
		
	@Autowired(required=true)
	CompanyVO companyVO;
	
	@Autowired(required=true)
	private GoodsService goodsService;
	
	@Autowired(required=true)
	private NoticeService noticeService;
	
	@Autowired(required=true)
	NoticeVO noticeVO;
	
	@Autowired(required=true)
	ReviewVO reviewVO;
	
	@Autowired(required=true)
	private ReviewService reviewService;
	
	@Autowired(required=true)
	private ResService resService;
	
	@Autowired(required=true)
	GoodsVO goodsVO;
	
	
	private static final String ARTICLE_IMAGE_REPO = "C:\\amenity\\notice_admin\\article_image";
	private static final String COMPANY_IMAGE_REPO="C:\\amenity\\business\\company_image";
	private static final String GOODS_IMAGE_REPO="C:\\amenity\\business\\goods_image";

	
	// 관리자 마이페이지 업체추가 jsp
	@RequestMapping(value = { "/business/b_newCompany.do"}, method = RequestMethod.GET)
	private ModelAndView b_newCompany(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
	
	
	
		//////////////////////////////////////////////////////////////////////////////////////////

		/////                       사업자 로그인										///////////

		//////////////////////////////////////////////////////////////////////////////////////////


		@RequestMapping(value="/business/b_signIn.do", method=RequestMethod.POST)
		public ModelAndView signIn(@ModelAttribute("businessVO") BusinessVO businessVO, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
				ModelAndView mav = new ModelAndView();
				
				businessVO = businessService.b_signIn(businessVO);
				
					if(businessVO != null) {
						HttpSession session = request.getSession();
						session.setAttribute("businessVO", businessVO);
						session.setAttribute("isLogOn", true);
						String action=(String)session.getAttribute("action");
						session.removeAttribute("action");
						if(action != null) {
							mav.setViewName("redirect:"+action);
						} else {
							mav.setViewName("redirect:/main/main.do");
						}
					} else {
						rAttr.addAttribute("result", "loginFailed");
						mav.setViewName("redirect:/main/b_login.do");
					}
					return mav;
		}
		

		//////////////////////////////////////////////////////////////////////////////////////////

		/////                       사업자 업체 추가										///////////

		//////////////////////////////////////////////////////////////////////////////////////////
	
		// 사업자 마에페이지에서 업체 DB에 추가하는 로직
		@RequestMapping(value="/business/addNewCompany.do", method=RequestMethod.POST)
		@ResponseBody
		public ResponseEntity addNewCompany(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
				throws Exception {
			multipartRequest.setCharacterEncoding("utf-8");
			Map<String, Object> articleMap = new HashMap<String, Object>();
			Enumeration enu = multipartRequest.getParameterNames();
			// mutilpart 정보 받아서 map에 저장
			while(enu.hasMoreElements()) {
				String name = (String)enu.nextElement();
				String value = multipartRequest.getParameter(name);
				articleMap.put(name, value);
			}
			
			List<String> main_imgs = companyMainUpload(multipartRequest);
			List<String> sub_imgs = companySubUpload(multipartRequest);
			String message;
			ResponseEntity resEnt = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
			
			// 이미지 저장 로직
			try {
				companyService.addNewCompany(articleMap);
				String company = companyService.companyName(articleMap);
				for(String main_img : main_imgs) {
				    if(main_img != null && main_img.length() != 0) {
				        File srcFile = new File(COMPANY_IMAGE_REPO + "\\" + "temp" + "\\" + main_img);
				        File destDir = new File(COMPANY_IMAGE_REPO + "\\" + company + "\\" + "main_img");
				        FileUtils.moveFileToDirectory(srcFile, destDir, true);
				        Map<String, Object> imageMap = new HashMap<>();
				        imageMap.put("main_img", main_img);
				        imageMap.put("company", company);
				        companyService.insertMainImg(imageMap);
				        System.out.println("main_img name : "+main_img);
				    }
				}
				for(String sub_img : sub_imgs) {
				    if(sub_img != null && sub_img.length() != 0) {
				        File srcFile = new File(COMPANY_IMAGE_REPO + "\\" + "temp" + "\\" + sub_img);
				        File destDir = new File(COMPANY_IMAGE_REPO + "\\" + company + "\\" + "sub_img");
				        FileUtils.moveFileToDirectory(srcFile, destDir, true);
				        Map<String, Object> imageMap = new HashMap<>();
				        imageMap.put("sub_img", sub_img);
				        imageMap.put("company", company);
				        companyService.insertSubImg(imageMap);
				        System.out.println("sub_img name : "+sub_img);
				    }
				}
				message = "<script>";
				message += " alert('새로운 사업장을 등록하였습니다.');";
				message += "location.href='"+multipartRequest.getContextPath()+"/business/b_companyList.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {
				File srcFile = new File(COMPANY_IMAGE_REPO+"\\"+"temp"+"\\"+"delImg");
				srcFile.delete();
				

				message = "<script>";
				message += " alert('사업장 등록에 실패하였습니다.');";
				message += "location.href='"+multipartRequest.getContextPath()+"/business/b_newCompany';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
			return resEnt;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		// mutilpart로 받은 파일(sub_img)을 실제 temp폴더에 저장하는 로직
		private List<String> companySubUpload(MultipartHttpServletRequest multipartRequest) throws Exception {
		    List<String> imageFileNames = new ArrayList<>();
		    
		    // �룞�씪�븳 �씠由꾩쓣 媛�吏� 紐⑤뱺 �뙆�씪�쓣 媛��졇�샃�땲�떎.
		    List<MultipartFile> files = multipartRequest.getFiles("sub_img");
		    
		    for (MultipartFile mFile : files) {
		        String originalFileName = mFile.getOriginalFilename();
		        File file = new File(COMPANY_IMAGE_REPO + "\\" + "temp" + "\\" + originalFileName);
		        
		        if (mFile.getSize() != 0) {
		            if (!file.exists()) {
		                file.getParentFile().mkdirs();
		                mFile.transferTo(new File(COMPANY_IMAGE_REPO + "\\" + "temp" + "\\" + originalFileName));
		                System.out.println("upload name : " + originalFileName);
		            }
		        }
		        imageFileNames.add(originalFileName);
		    }
		    
		    return imageFileNames;
		}
		
		
		// 비밀번호 재설정 하는 jsp로 이동
		@RequestMapping(value = { "/business/b_newPwd.do"}, method = RequestMethod.GET)
		private ModelAndView b_newPwd(@RequestParam("b_no") String b_no,HttpServletRequest request, HttpServletResponse response) {
			String viewName = (String)request.getAttribute("viewName");
			System.out.println(viewName);
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			mav.addObject("b_no", b_no);
			return mav;
		}

		
		// mutilpart로 받은 파일(main_img)을 실제 temp폴더에 저장하는 로직
		private List<String> companyMainUpload(MultipartHttpServletRequest multipartRequest) throws Exception{
			 List<String> imageFileNames = new ArrayList<>();
			    
			    // �룞�씪�븳 �씠由꾩쓣 媛�吏� 紐⑤뱺 �뙆�씪�쓣 媛��졇�샃�땲�떎.
			    List<MultipartFile> files = multipartRequest.getFiles("main_img");
			    
			    for (MultipartFile mFile : files) {
			        String originalFileName = mFile.getOriginalFilename();
			        File file = new File(COMPANY_IMAGE_REPO + "\\" + "temp" + "\\" + originalFileName);
			        
			        if (mFile.getSize() != 0) {
			            if (!file.exists()) {
			                file.getParentFile().mkdirs();
			                mFile.transferTo(new File(COMPANY_IMAGE_REPO + "\\" + "temp" + "\\" + originalFileName));
			                System.out.println("upload name : " + originalFileName);
			            }
			        }
			        imageFileNames.add(originalFileName);
			    }
			    
			    return imageFileNames;
			}
		
		

		
		

		
		
		
	
		// 사업자 마이페이지 로직
		@RequestMapping(value = { "/business/myPage.do"}, method = RequestMethod.GET)
		@ResponseBody
		private ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		    String viewName = (String)request.getAttribute("viewName");
		    System.out.println(viewName);
		    ModelAndView mav = new ModelAndView();
		    HttpSession session = request.getSession();
		    BusinessVO bVO = (BusinessVO) session.getAttribute("businessVO");
		    
		    // 색 인덱스
		    ArrayList<String> colorList = new ArrayList<String>();
		    colorList.add("rgba(255, 99, 132, 0.6)");
		    colorList.add("rgba(54, 162, 235, 0.6)");
		    colorList.add("rgba(255, 206, 86, 0.6)");
		    colorList.add("rgba(75, 192, 192, 0.6)");
		    colorList.add("rgba(23, 87, 156, 0.6)");
		    colorList.add("rgba(29, 138, 196, 0.6)");
		    colorList.add("rgba(113, 201, 228, 0.6)");
		    colorList.add("rgba(205, 239, 237, 0.6)");
		    colorList.add("rgba(248, 239, 237, 0.6)");
		    colorList.add("rgba(179, 178, 235, 0.6)");
		    mav.addObject("colorList", colorList);
		    String bno = bVO.getB_no();
		    
		    // 사업자가 운영하는 companyList
		    List<String> comList = companyService.myCompanyList(bno); 
		    
		    // 각 company의 name 을 key로 해서 판매액을 저장 graph1
		    Map<String, List<String>> companySalesMap = new HashMap<>();
		    for(String company : comList) {
		        List<String> sales = businessService.businessBill(company);
		        companySalesMap.put(company, sales);
		        System.out.println("sales : " + sales);
		    }
		    // 라벨 (sales에 맞게 수정해야함) graph1
		    List<String> labels = businessService.businessResdate(bno);
		    System.out.println("labels : " + labels);
		    
		    // 사업자가 운영하는 roomList
		    Map<String, List<String>> roomSalesMap = new HashMap<>();
		    List<String> roomList = new ArrayList<>();
		    
		    for(String company : comList) {
		        List<String> rooms = goodsService.selectRoom(company);
		        System.out.println("rooms : " + rooms);
		        
		        // 가장 객실명이 많은 업체를 기준으로 label을 짠다.
		        if (rooms.size() > roomList.size()) {
		            roomList.clear();
		            roomList.addAll(rooms);
		        }
		        
		        List<String> roomListSales = new ArrayList<>();
		        for(String room : rooms) {
		            String temp = businessService.businessRoomBill(company, room);
		            roomListSales.add(temp);
		        }
		        System.out.println("company : " + company + "roomListSales" + roomListSales);
		        roomSalesMap.put(company, roomListSales);
		        System.out.println("roomListSales : " + roomListSales);
		    }
		    
		    // 사업자가 운영하는 업체 전체 평점
		    List<Integer> gradeLabel = new ArrayList<>();
		    for(int i=1; i<11; i++) {
		    	gradeLabel.add(i);
		    }
		    
		    List<String> gradeList = businessService.businessGrade(bno);
		    System.out.println("List : " + gradeList);
		    
		    // 내 사업장 리뷰가져오기
		    List<ReviewVO> reviewList = reviewService.businessReview(bno);
		    
		    
		    // Map을 mav에 저장
		    mav.addObject("comList", comList);
		    mav.addObject("roomList", roomList);
		    mav.addObject("labels", labels);
		    mav.addObject("gradeLabel", gradeLabel);
		    mav.addObject("gradeList", gradeList);
		    mav.addObject("companySalesMap", companySalesMap);
		    mav.addObject("roomSalesMap", roomSalesMap);
		    mav.addObject("reviewList", reviewList);
		    mav.setViewName(viewName);
		    return mav;
		}
		

	


	// 사업자 비밀번호 찾기
	@RequestMapping(value="/business/businessFindPwd.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity b_FindPwd(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		Map<String, Object> businessMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			businessMap.put(name, value);
		}
		
		boolean check = businessService.checkBusiness(businessMap); 
		System.out.println("일치여부 : " + check);
		String b_no = (String) businessMap.get("b_no"); 

		System.out.println("b_no : " + b_no);
		
		String message;
		
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		if(check) {
			
			message = "<script>";
			message += " alert('회원 정보가 일치합니다. 비밀번호 재설정 화면으로 이동합니다 !');";
			message += "location.href='"+multipartRequest.getContextPath()+"/business/b_newPwd.do?b_no="+b_no+"';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}else {
			message = "<script>";
			message += " alert('회원 정보가 일치하지 않습니다 !');";
			message += "location.href='"+multipartRequest.getContextPath()+"/main/bfind_pwd.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		}
		
		return resEnt;
		}
	
	
	
	/////////사업자 비밀번호 재설정 /////
	@RequestMapping(value="/business/b_updatePwd.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity b_updatePwd(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		
		Map<String, Object> businessMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			businessMap.put(name, value);
		}
		
		System.out.println("bno: " + businessMap.get("b_no"));
		
		String message;
		businessService.changeB_pwd(businessMap);
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
			message += "location.href='"+multipartRequest.getContextPath()+"/business/businessFindPwd.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}

		return resEnt;
	}
	
	// 사업자의 사업장 목록조회
	@RequestMapping(value = "/business/b_companyList.do", method = RequestMethod.GET)
	private ModelAndView b_companyList(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");

		// 로그인 세션정보중 사업자 번호 가져오기
		HttpSession session = request.getSession();
		BusinessVO businessVO = (BusinessVO) session.getAttribute("businessVO");
		String b_no = businessVO.getB_no();

		// 사업자 번호 기준 사업장 목록 불러오기
		List<String> myCompanyList = companyService.selectCompanyByBno(b_no);
		
		System.out.println(myCompanyList);
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.addObject("myCompanyList", myCompanyList);
		mav.setViewName(viewName);
		return mav;
	}

	// 사업자의 사업장 목록에서 수정하러 가기
	@RequestMapping(value = "/business/b_modCompanyInList.do", method = RequestMethod.GET)
	private ModelAndView b_modCompanyInList(@RequestParam("company") String company, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("viewName:" + viewName);

		// 사업자의 사업장이름을 기준 해당 사업장정보 가져오기
		CompanyVO modCompanyInfo = companyService.modCompanyInList(company);
		// 사업자의 사업장 등록시 등록한 이미지 정보 가져오기
		List<String> modCompanyMainImg = companyService.viewMainImg(company);
		List<String> modCompanySubImg = companyService.viewSubImg(company);

		// 사업자 사업장이름 기준 해당정보 담아보내기
		ModelAndView mav = new ModelAndView();
		mav.addObject("modCompanyInfo", modCompanyInfo);
		mav.addObject("modCompanyMainImg", modCompanyMainImg);
		mav.addObject("modCompanySubImg", modCompanySubImg);
		mav.setViewName(viewName);
		return mav;
	}
	
	//사업자의 사업장 수정
	  @RequestMapping(value = "/business/updateCompanyInList.do", method = {RequestMethod.GET, RequestMethod.POST}) 
	  public ResponseEntity updateCompanyInfo(@RequestParam("c_no") int c_no, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{ 
	  multipartRequest.setCharacterEncoding("utf-8");
	  
	  	CompanyVO oldCompanyInfo = companyService.selectCompanyByNo(c_no);
		String oldCompanyName = oldCompanyInfo.getCompany();
	  
		Map<String, Object> modCompanyMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			modCompanyMap.put(name, value);
		}

		List<String> main_imgs = companyMainUpload(multipartRequest);
		List<String> sub_imgs = companySubUpload(multipartRequest);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");

		try {
			companyService.modCompanyInList(modCompanyMap);
			String newCompany = companyService.companyName(modCompanyMap);
			
			// 사업장명이 바뀌는 경우를 포함한 기존 폴더 삭제
			File oldFile = new File(COMPANY_IMAGE_REPO + "\\" + oldCompanyName);
			if (oldFile.exists() && oldFile.isDirectory()) {
				FileUtils.deleteDirectory(oldFile);
			}
			File clearFile = new File(COMPANY_IMAGE_REPO + "\\" + newCompany);
			if (clearFile.exists() && clearFile.isDirectory()) {
				FileUtils.deleteDirectory(clearFile);
			}

			for (String main_img : main_imgs) {
				if (main_img != null && main_img.length() != 0) {
					File srcFile = new File(COMPANY_IMAGE_REPO + "\\" + "temp" + "\\" + main_img);
					File destDir = new File(COMPANY_IMAGE_REPO + "\\" + newCompany + "\\" + "main_img");
					
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
					Map<String, Object> imageMap = new HashMap<>();
					imageMap.put("main_img", main_img);
					imageMap.put("newCompany", newCompany);
					companyService.modCompanyMainImg(imageMap);
//					companyService.insertMainImg(imageMap);
					System.out.println("main_img name : " + main_img);
				}
			}
			
			for (String sub_img : sub_imgs) {
				if (sub_img != null && sub_img.length() != 0) {
					File srcFile = new File(COMPANY_IMAGE_REPO + "\\" + "temp" + "\\" + sub_img);
					File destDir = new File(COMPANY_IMAGE_REPO + "\\" + newCompany + "\\" + "sub_img");
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
					Map<String, Object> imageMap = new HashMap<>();
					imageMap.put("sub_img", sub_img);
					imageMap.put("newCompany", newCompany);
					companyService.modComapnySubImg(imageMap);
//					companyService.insertSubImg(imageMap);
					System.out.println("sub_img name : " + sub_img);
				}
			}
			message = "<script>";
			message += " alert('사업장 정보를 수정했습니다.');";
			message += "location.href='" + multipartRequest.getContextPath() + "/business/b_companyList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(COMPANY_IMAGE_REPO + "\\" + "temp" + "\\" + "delImg");
			srcFile.delete();

			message = "<script>";
			message += " alert('사업장 정보수정에 실패했습니다.');";
			message += "location.href='" + multipartRequest.getContextPath() + "/business/b_companyList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}



	  //사업자의 사업장 목록에서 사업장 삭제하기
	  @RequestMapping(value = "/business/deleteCompanyInList.do", method = {RequestMethod.GET, RequestMethod.POST}) 
	  public ResponseEntity deleteCompanyInList(@ModelAttribute("c_no") int c_no, HttpServletRequest request, HttpServletResponse response) throws Exception{ 
		  String viewName = (String) request.getAttribute("viewName");
		  System.out.println("viewName:" + viewName);
		  
		  CompanyVO delCompanyInfo = companyService.selectCompanyByNo(c_no);
		  String companyName = delCompanyInfo.getCompany();

		  String message;
		  ResponseEntity resEnt = null;
		  HttpHeaders responseHeaders = new HttpHeaders();
		  responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
			
		try {
			File destDirMain = new File(COMPANY_IMAGE_REPO + "\\" + companyName);
			if(destDirMain.isDirectory()) {
		            FileUtils.deleteDirectory(destDirMain);
			}
			companyService.deleteCompanyInList(c_no);

				message = "<script>";
				message += " alert('등록된 사업장을 삭제했습니다.');";
				message += "location.href='"+request.getContextPath()+"/business/b_companyList.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {					
				message = "<script>";
				message += " alert('사업장 삭제에 실패했습니다.');";
				message += "location.href='"+request.getContextPath()+"/business/b_companyList.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
			return resEnt;
		}
	  
		// 사업자의 사업장에 객실상품 등록가기
		@RequestMapping(value = { "/business/b_newGoods.do" }, method = RequestMethod.GET)
		private ModelAndView b_newGoods(HttpServletRequest request, HttpServletResponse response) {
			String viewName = (String) request.getAttribute("viewName");

			// 로그인 세션정보로 사업자 번호 가져오기
			HttpSession session = request.getSession();
			BusinessVO businessVO = (BusinessVO) session.getAttribute("businessVO");
			String b_no = businessVO.getB_no();

			// 사업자 번호 기준 사업장 목록 불러오기
			List<String> myCompanyList = companyService.myCompanyList(b_no);

			System.out.println(viewName);
			ModelAndView mav = new ModelAndView();
			mav.addObject("myCompanyList", myCompanyList);
			mav.setViewName(viewName);
			return mav;
		}
		
		// 객실상품 등록
		@RequestMapping(value = "/business/addNewGoods.do", method = RequestMethod.POST)
		@ResponseBody
		public ResponseEntity addNewGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
				throws Exception {
			multipartRequest.setCharacterEncoding("utf-8");
			Map<String, Object> articleMap = new HashMap<String, Object>();
			Enumeration enu = multipartRequest.getParameterNames();
			while (enu.hasMoreElements()) {
				String name = (String) enu.nextElement();
				String value = multipartRequest.getParameter(name);
				articleMap.put(name, value);
			}
			Object getMainImgType = articleMap.get("imgType_main");
			Object getSubImgType = articleMap.get("imgType_sub");
			Object getCompanyName = articleMap.get("company");
			String mainImgType = (String) getMainImgType;
			String subImgType = (String) getSubImgType;
			String companyName = (String) getCompanyName;

			List<String> main_imgs = goodsMainUpload(multipartRequest);
			List<String> sub_imgs = goodsSubUpload(multipartRequest);
			String message;
			ResponseEntity resEnt = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=UTF-8");

			try {
				goodsService.addNewGoods(articleMap);
				String room = goodsService.goodsName(articleMap);
				for (String main_img : main_imgs) {
					if (main_img != null && main_img.length() != 0) {
						File srcFile = new File(GOODS_IMAGE_REPO + "\\" + "temp" + "\\" + main_img);
						File destDir = new File(GOODS_IMAGE_REPO + "\\" + companyName + "\\" + room + "\\" + "main_img");
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
						Map<String, Object> imageMap = new HashMap<>();
						imageMap.put("main_img", main_img);
						imageMap.put("room", room);
						imageMap.put("mainImgType", mainImgType);
						imageMap.put("companyName", companyName);
						goodsService.insertMainImg(imageMap);
						System.out.println("main_img name : " + main_img);
					}
				}
				for (String sub_img : sub_imgs) {
					if (sub_img != null && sub_img.length() != 0) {
						File srcFile = new File(GOODS_IMAGE_REPO + "\\" + "temp" + "\\" + sub_img);
						File destDir = new File(GOODS_IMAGE_REPO + "\\" + companyName + "\\" + room + "\\" + "sub_img");
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
						Map<String, Object> imageMap = new HashMap<>();
						imageMap.put("sub_img", sub_img);
						imageMap.put("room", room);
						imageMap.put("subImgType", subImgType);
						imageMap.put("companyName", companyName);
						goodsService.insertSubImg(imageMap);
						System.out.println("sub_img name : " + sub_img);
					}
				}
				message = "<script>";
				message += " alert('새로운 객실 상품을 등록하였습니다.');";
				message += "location.href='" + multipartRequest.getContextPath() + "/business/b_goodsList.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			} catch (Exception e) {
				File srcFile = new File(GOODS_IMAGE_REPO + "\\" + "temp" + "\\" + "delImg");
				srcFile.delete();

				message = "<script>";
				message += " alert('객실상품 등록에 실패하였습니다.');";
				message += "location.href='" + multipartRequest.getContextPath() + "/business/b_newGoods.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
			return resEnt;
		}
		
		// 메인 이미지 업로드 메소드
		private List<String> goodsMainUpload(MultipartHttpServletRequest multipartRequest) throws Exception {
			List<String> imageFileNames = new ArrayList<>();

			List<MultipartFile> files = multipartRequest.getFiles("main_img");

			for (MultipartFile mFile : files) {
				String originalFileName = mFile.getOriginalFilename();
				File file = new File(GOODS_IMAGE_REPO + "\\" + "temp" + "\\" + originalFileName);

				if (mFile.getSize() != 0) {
					if (!file.exists()) {
						file.getParentFile().mkdirs();
						mFile.transferTo(new File(GOODS_IMAGE_REPO + "\\" + "temp" + "\\" + originalFileName));
						System.out.println("upload name : " + originalFileName);
					}
				}
				imageFileNames.add(originalFileName);
			}

			return imageFileNames;
		}
		
		//서브 이미지 업로드 메소드
		private List<String> goodsSubUpload(MultipartHttpServletRequest multipartRequest) throws Exception {
			List<String> imageFileNames = new ArrayList<>();

			List<MultipartFile> files = multipartRequest.getFiles("sub_img");

			for (MultipartFile mFile : files) {
				String originalFileName = mFile.getOriginalFilename();
				File file = new File(GOODS_IMAGE_REPO + "\\" + "temp" + "\\" + originalFileName);

				if (mFile.getSize() != 0) {
					if (!file.exists()) {
						file.getParentFile().mkdirs();
						mFile.transferTo(new File(GOODS_IMAGE_REPO + "\\" + "temp" + "\\" + originalFileName));
						System.out.println("upload name : " + originalFileName);
					}
				}
				imageFileNames.add(originalFileName);
			}

			return imageFileNames;
		}
	
	 // 사업자의 사업장에 등록한 객실상품 목록 조회
	 @RequestMapping(value = "/business/b_goodsList.do", method = RequestMethod.GET)
	 private ModelAndView b_goodsList(HttpServletRequest request, HttpServletResponse response) throws Exception { 
		 String viewName = (String) request.getAttribute("viewName");
	 
	 // 로그인 세션정보중 사업자 번호 가져오기 
	 HttpSession session = request.getSession();
	 BusinessVO businessVO = (BusinessVO)session.getAttribute("businessVO");
	 String b_no = businessVO.getB_no();
	
	 //사업자의 사업장 리스트 불러오기
	 List<String> myCompanyList = companyService.myCompanyList(b_no);	 
	 // 사업장의 객실상품 리스트 불러오기
	 List<String> myGoodsList = goodsService.myGoodsList(b_no);
	 
	 System.out.println(viewName); 
	 ModelAndView mav = new ModelAndView();
	 mav.addObject("myCompanyList", myCompanyList); 
	 mav.addObject("myGoodsList", myGoodsList);
	 mav.setViewName(viewName);
	 return mav;
	 
	 }
	 
	 // 사업장의 객실상품 수정하러 가기
	 @RequestMapping(value = "/business/b_modGoodsInList.do", method = RequestMethod.GET)
	 private ModelAndView b_modGoodsInList(@RequestParam("g_no") int g_no, HttpServletRequest request, HttpServletResponse response) throws Exception { 
		 String viewName = (String) request.getAttribute("viewName");
	 
	 //리스트에서 선택한 객실상품의 고유값으로 객실상품정보 불러오기
	 GoodsVO goodsVO = goodsService.selectGoodsByNo(g_no);
	 
	 System.out.println(viewName); 
	 ModelAndView mav = new ModelAndView();
	 mav.addObject("modGoodsInfo", goodsVO);
	 mav.setViewName(viewName);
	 return mav;
	 
	 }
	 
	 
		// 객실상품 업데이트
		@RequestMapping(value = "/business/updateGoodsInList.do", method = { RequestMethod.GET, RequestMethod.POST })
		public ResponseEntity updateGoodsInList(@RequestParam("company") String company, @RequestParam("g_no") int g_no, MultipartHttpServletRequest multipartRequest,
				HttpServletResponse response) throws Exception {
			multipartRequest.setCharacterEncoding("utf-8");
			
			List<String> oldRoomInfo = goodsService.selectRoom(company);
			String oldRoomName = oldRoomInfo.get(0);
			
			Map<String, Object> modGoodsMap = new HashMap<String, Object>();
			Enumeration enu = multipartRequest.getParameterNames();
			while (enu.hasMoreElements()) {
				String name = (String) enu.nextElement();
				String value = multipartRequest.getParameter(name);
				modGoodsMap.put(name, value);
			}
			
			Object getMainImgType = modGoodsMap.get("imgType_main");
			Object getSubImgType = modGoodsMap.get("imgType_sub");
			Object getCompanyName = modGoodsMap.get("company");
			Object getRoomName = modGoodsMap.get("room");
			String mainImgType = (String)getMainImgType;
			String subImgType = (String)getSubImgType;
			String companyName = (String)getCompanyName;
			String room = (String)getRoomName;

			List<String> main_imgs = goodsMainUpload(multipartRequest);
			List<String> sub_imgs = goodsSubUpload(multipartRequest);
			String message;
			ResponseEntity resEnt = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=UTF-8");

			try {
				goodsService.existingDataDel(g_no);
				goodsService.modGoodsInList(modGoodsMap);
			//	String room = goodsService.goodsName(modGoodsMap);

				// 객실명이 바뀌는 경우를 포함한 기존 폴더 삭제
				File oldFile = new File(GOODS_IMAGE_REPO + "\\" + companyName + "\\" + oldRoomName);
				if (oldFile.exists() && oldFile.isDirectory()) {
					FileUtils.deleteDirectory(oldFile);
				}
				File clearFile = new File(GOODS_IMAGE_REPO + "\\" + companyName + "\\" + room);
				if (clearFile.exists() && clearFile.isDirectory()) {
					FileUtils.deleteDirectory(clearFile);
				}

				for (String main_img : main_imgs) {
					if (main_img != null && main_img.length() != 0) {
						File srcFile = new File(GOODS_IMAGE_REPO + "\\" + "temp" + "\\" + main_img);
						File destDir = new File(GOODS_IMAGE_REPO + "\\" + companyName + "\\" + room + "\\" + "main_img");
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
						Map<String, Object> imageMap = new HashMap<>();
						imageMap.put("main_img", main_img);
						imageMap.put("room", room);
						imageMap.put("mainImgType", mainImgType);
				        imageMap.put("companyName", companyName);
						goodsService.modGoodsMainImg(imageMap);
						System.out.println("main_img name : " + main_img);
					}
				}
				for (String sub_img : sub_imgs) {
					if (sub_img != null && sub_img.length() != 0) {
						File srcFile = new File(GOODS_IMAGE_REPO + "\\" + "temp" + "\\" + sub_img);
						File destDir = new File(GOODS_IMAGE_REPO + "\\" + companyName + "\\" + room + "\\" + "sub_img");
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
						Map<String, Object> imageMap = new HashMap<>();
						imageMap.put("sub_img", sub_img);
						imageMap.put("room", room);
						imageMap.put("subImgType", subImgType);
				        imageMap.put("companyName", companyName);
						goodsService.modGoodsSusbImg(imageMap);
						System.out.println("sub_img name : " + sub_img);
					}
				}
				message = "<script>";
				message += " alert('등록된 객실상품 정보를 수정했습니다.');";
				message += "location.href='" + multipartRequest.getContextPath() + "/business/b_goodsList.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			} catch (Exception e) {
				File srcFile = new File(GOODS_IMAGE_REPO + "\\" + "temp" + "\\" + "delImg");
				srcFile.delete();

				message = "<script>";
				message += " alert('객실상품 정보수정에 실패했습니다.');";
				message += "location.href='" + multipartRequest.getContextPath() + "/business/b_goodsList.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
			return resEnt;
		}
	 
		// 사업자의 사업장 객실목록에서 객실상품 삭제하기
		@RequestMapping(value = "/business/deleteGoodsInList.do", method = RequestMethod.GET)
		public ResponseEntity deleteGoodsInList(@RequestParam("g_no") int g_no, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			String viewName = (String) request.getAttribute("viewName");
			System.out.println("viewName:" + viewName);

			// 목록에서 삭제 선택한 객실정보 가져오기
			GoodsVO delGoodsInfo = goodsService.selectGoodsByNo(g_no);
			String goodsName = delGoodsInfo.getRoom();
			String companyName = delGoodsInfo.getCompany();

			String message;
			ResponseEntity resEnt = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=UTF-8");

			// 사업장 이름과 객실이름을 기준으로 하드디스크 이미지 폴더 삭제하기
			try {
				File destDirMain = new File(GOODS_IMAGE_REPO + "\\" + companyName + "\\" + goodsName);
				if (destDirMain.exists() && destDirMain.isDirectory()) {
					FileUtils.deleteDirectory(destDirMain);
				}
				goodsService.deleteGoodsInList(g_no);

				message = "<script>";
				message += " alert('등록된 객실 상품을 삭제했습니다.');";
				message += "location.href='" + request.getContextPath() + "/business/b_goodsList.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			} catch (Exception e) {
				message = "<script>";
				message += " alert('객실상품 삭제에 실패했습니다.');";
				message += "location.href='" + request.getContextPath() + "/business/b_goodsList.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
			return resEnt;
		}
		
		// 사업장 예약목록 조회
		@RequestMapping(value = "/business/b_reservationList.do", method = RequestMethod.GET)
		private ModelAndView reservationList(HttpServletRequest request, HttpServletResponse response) throws Exception{
			 String viewName = (String) request.getAttribute("viewName");
			 
				// 로그인 세션정보중 사업자 번호 가져오기
				HttpSession session = request.getSession();
				BusinessVO businessVO = (BusinessVO) session.getAttribute("businessVO");
				String b_no = businessVO.getB_no();

				// 사업자 번호를 기준으로 한 company, res join테이블 가져오기
				List<String> myResList = resService.resList(b_no);
				// 사업장 이름 가져오기(제이쿼리에서 중복검사,제거용으로 사용)
				List<String> myCompany = companyService.myCompanyList(b_no);
			 
			 System.out.println(viewName); 
			 ModelAndView mav = new ModelAndView();
			 mav.addObject("myResList", myResList);
			 mav.addObject("myCompany", myCompany);
			 mav.setViewName(viewName);
			 return mav;
		}
		
		
 



















		// 사업자 개인정보 수정
		@RequestMapping(value="/business/updateInfo.do", method=RequestMethod.POST)
		@ResponseBody
		public ResponseEntity updateInfo(HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			request.setCharacterEncoding("utf-8");
			Map<String, Object> businessMap = new HashMap<String, Object>();
			Enumeration enu = request.getParameterNames();
			while(enu.hasMoreElements()) {
				String name = (String)enu.nextElement();
				String value = request.getParameter(name);
				businessMap.put(name, value);
			}
			businessService.updateInfo(businessMap);	
				
			String message;
			ResponseEntity resEnt = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
			
			
			HttpSession session = request.getSession();
			session.removeAttribute("businessVO");
			
			String b_no = (String) businessMap.get("b_no");
			String b_pw = (String) businessMap.get("b_pw");
			businessVO.setB_no(b_no);
			businessVO.setB_pw(b_pw);
			businessVO = businessService.b_signIn(businessVO);
			
			session.setAttribute("businessVO", businessVO);
			session.setAttribute("isLogOn", true);
			String action=(String)session.getAttribute("action");		
				
			try {
				message = "<script>";
				message += " alert('개인정보 수정을 완료했습니다!');";
				message += "location.href='"+request.getContextPath()+"/business/myPage.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {					
				message = "<script>";
				message += " alert('개인정보 수정에 실패했습니다!');";
				message += "location.href='"+request.getContextPath()+"/business/myPage.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
				return resEnt;
			}
			
			
			// 사업자가 jsp에서 폴더에 저장된 이미지를 불러와서 보여주는 기능
			@RequestMapping("/business/mainDownload.do")
			public void mainDownload(@RequestParam(value = "main_img") String main_img, @RequestParam("room") String room, HttpServletResponse response) throws Exception {
				String downFile = GOODS_IMAGE_REPO + "\\" + room +"\\" + "main_img" +"\\"+ main_img;
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
			

			
			
			// 사업자 내 문의 내역 조회	
			@RequestMapping(value = { "/business/b_myQuestion.do"}, method = RequestMethod.GET)
			private ModelAndView myQuestion(HttpServletRequest request, HttpServletResponse response) {
				String viewName = (String)request.getAttribute("viewName");
				System.out.println(viewName);
				ModelAndView mav = new ModelAndView();
				List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
				HttpSession session = request.getSession();
				BusinessVO businessVO = (BusinessVO) session.getAttribute("businessVO");
				String b_no = businessVO.getB_no();
				noticeList = noticeService.selectMyQuestion2(b_no);
				
				
				mav.addObject("noticeList",noticeList);
				mav.setViewName(viewName);
				return mav;
			}
			
			//문의글 보기
			@RequestMapping(value = { "/business/b_viewMyQuestion.do"}, method = RequestMethod.GET)
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
			
			
/////////////유저 문의 작성 페이지////////////////////
		@RequestMapping(value = { "/business/b_qnaForm.do"}, method = RequestMethod.GET)
		private ModelAndView u_qnaForm(HttpServletRequest request, HttpServletResponse response) {
			String viewName = (String)request.getAttribute("viewName");
			System.out.println(viewName);
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			return mav;
		}
		
		/////////////사업자 문의 작성하기////////////////////		
		@RequestMapping(value="/business/writeQna.do", method= RequestMethod.POST)
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
			BusinessVO businessVO = (BusinessVO)session.getAttribute("businessVO");
			String b_no = businessVO.getB_no();			
			noticeMap.put("b_no", b_no);
			noticeMap.put("imageFileNames", imageFileNames);
			
			String message;
			ResponseEntity resEnt = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
			try {
				noticeService.addNewArticle2(noticeMap);
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
				message += "location.href='"+multipartRequest.getContextPath()+"/business/b_myQuestion.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {
				File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileNames);
				srcFile.delete();
				
				message = "<script>";
				message += " alert('문의 작성에 실패했습니다. ');";
				message += "location.href='"+multipartRequest.getContextPath()+"/main/main.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
			return resEnt;
		}
		
		
		
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
			
		
		@RequestMapping(value = { "/business/b_notice.do"}, method = RequestMethod.GET)
	    public ModelAndView b_notice(
	            HttpServletRequest request, 
	            HttpServletResponse response) {
	        
	    	String viewName = (String)request.getAttribute("viewName");
	        ModelAndView mav = new ModelAndView();
	        mav.setViewName(viewName);
	        
	        
	        List<NoticeVO> noticeList = noticeService.selectOnlyNotice();
	        mav.addObject("noticeList",noticeList);
	        return mav;
	    }
			
		///사업자 리뷰답변 작성
		@RequestMapping(value="/business/addReply.do", method= RequestMethod.POST)
		@ResponseBody
		public ResponseEntity addReply(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
				throws Exception {
			multipartRequest.setCharacterEncoding("utf-8");
			Map<String, Object> reviewMap = new HashMap<String, Object>();
			Enumeration enu = multipartRequest.getParameterNames();
			while(enu.hasMoreElements()) {
				String name = (String)enu.nextElement();
				String value = multipartRequest.getParameter(name);
				reviewMap.put(name, value);
			}
			//리뷰 답변작성
			reviewService.addReply(reviewMap);
			
			String message;
			ResponseEntity resEnt = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
			try {
				
				
				message = "<script>";
				message += " alert('답변을 작성했습니다. ');";
				message += "location.href='"+multipartRequest.getContextPath()+"/business/myPage.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {

				
				message = "<script>";
				message += " alert('답변 작성에 실패했습니다. ');";
				message += "location.href='"+multipartRequest.getContextPath()+"/main/main.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
			return resEnt;
		}
			
	}
	
