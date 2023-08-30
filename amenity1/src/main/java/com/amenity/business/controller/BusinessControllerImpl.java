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
import org.springframework.web.bind.annotation.GetMapping;
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
	ReviewVO reviewVO;
	
	@Autowired(required=true)
	private ReviewService reviewService;
	
	@Autowired(required=true)
	GoodsVO goodsVO;
	
	
	private static final String COMPANY_IMAGE_REPO="C:\\amenity\\business\\company_image";
	private static final String GOODS_IMAGE_REPO="C:\\amenity\\business\\goods_image";

	
	@RequestMapping(value = { "/business/b_Info1.do"}, method = RequestMethod.GET)
	private ModelAndView b_Info1(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = { "/business/b_newCompany.do"}, method = RequestMethod.GET)
	private ModelAndView b_newCompany(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
	
	
	
		//////////////////////////////////////////////////////////////////////////////////////////

		/////                       �����  �α��� 										///////////

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

		/////                       �����  ��ü�߰�										///////////

		//////////////////////////////////////////////////////////////////////////////////////////
	
		
		@RequestMapping(value="/business/addNewCompany.do", method=RequestMethod.POST)
		@ResponseBody
		public ResponseEntity addNewCompany(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
				throws Exception {
			multipartRequest.setCharacterEncoding("utf-8");
			Map<String, Object> articleMap = new HashMap<String, Object>();
			Enumeration enu = multipartRequest.getParameterNames();
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
				message += " alert('성공');";
				message += "location.href='"+multipartRequest.getContextPath()+"/main/main.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {
				File srcFile = new File(COMPANY_IMAGE_REPO+"\\"+"temp"+"\\"+"delImg");
				srcFile.delete();
				

				message = "<script>";
				message += " alert('실패');";
				message += "location.href='"+multipartRequest.getContextPath()+"/business/b_newCompany';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
			return resEnt;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		//////////////////////////////////////////////////////////////////////////////////////////

		/////                     ���� ���ε�												///////////

		//////////////////////////////////////////////////////////////////////////////////////////
		
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
		
		

		@RequestMapping(value = { "/business/b_newPwd.do"}, method = RequestMethod.GET)
		private ModelAndView b_newPwd(@RequestParam("b_no") String b_no,HttpServletRequest request, HttpServletResponse response) {
			String viewName = (String)request.getAttribute("viewName");
			System.out.println(viewName);
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			mav.addObject("b_no", b_no);
			return mav;
		}

  
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
		
		

//////////////////////////////////////////////////////////////////////////////////////////

/////               새 객실상품 등록											///////////

//////////////////////////////////////////////////////////////////////////////////////////
		
		@RequestMapping(value = { "/business/b_newGoods.do"}, method = RequestMethod.GET)
		private ModelAndView b_newGoods(HttpServletRequest request, HttpServletResponse response) {
			String viewName = (String)request.getAttribute("viewName");
			
			//로그인 세션정보중 사업자 번호 가져오기
			HttpSession session = request.getSession();
			BusinessVO businessVO = (BusinessVO) session.getAttribute("businessVO");
			String b_no = businessVO.getB_no();
			
			//사업자 번호 기준 사업장 목록 불러오기
			List<String> myCompanyList = companyService.selectCompanyByBno(b_no);
			
			System.out.println(viewName);
			ModelAndView mav = new ModelAndView();
			mav.addObject(myCompanyList);
			mav.setViewName(viewName);
			return mav;
		}
		
		@RequestMapping(value="/business/addNewGoods.do", method=RequestMethod.POST)
		@ResponseBody
		public ResponseEntity addNewGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
				throws Exception {
			multipartRequest.setCharacterEncoding("utf-8");
			Map<String, Object> articleMap = new HashMap<String, Object>();
			Enumeration enu = multipartRequest.getParameterNames();
			while(enu.hasMoreElements()) {
				String name = (String)enu.nextElement();
				String value = multipartRequest.getParameter(name);
				articleMap.put(name, value);
			}
			
			List<String> main_imgs = goodsMainUpload(multipartRequest);
			List<String> sub_imgs = goodsSubUpload(multipartRequest);
			String message;
			ResponseEntity resEnt = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
			
			try {
				goodsService.addNewGoods(articleMap);
				String room = goodsService.goodsName(articleMap);
				for(String main_img : main_imgs) {
				    if(main_img != null && main_img.length() != 0) {
				        File srcFile = new File(GOODS_IMAGE_REPO + "\\" + "temp" + "\\" + main_img);
				        File destDir = new File(GOODS_IMAGE_REPO + "\\" + room + "\\" + "main_img");
				        FileUtils.moveFileToDirectory(srcFile, destDir, true);
				        Map<String, Object> imageMap = new HashMap<>();
				        imageMap.put("main_img", main_img);
				        imageMap.put("room", room);
				        goodsService.insertMainImg(imageMap);
				        System.out.println("main_img name : "+main_img);
				    }
				}
				for(String sub_img : sub_imgs) {
				    if(sub_img != null && sub_img.length() != 0) {
				        File srcFile = new File(GOODS_IMAGE_REPO + "\\" + "temp" + "\\" + sub_img);
				        File destDir = new File(GOODS_IMAGE_REPO + "\\" + room + "\\" + "sub_img");
				        FileUtils.moveFileToDirectory(srcFile, destDir, true);
				        Map<String, Object> imageMap = new HashMap<>();
				        imageMap.put("sub_img", sub_img);
				        imageMap.put("room", room);
				        goodsService.insertSubImg(imageMap);
				        System.out.println("sub_img name : "+sub_img);
				    }
				}
				message = "<script>";
				message += " alert('상품 추가 성공');";
				message += "location.href='"+multipartRequest.getContextPath()+"/main/main.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {
				File srcFile = new File(GOODS_IMAGE_REPO+"\\"+"temp"+"\\"+"delImg");
				srcFile.delete();
				
				message = "<script>";
				message += " alert('상품 추가 실패');";
				message += "location.href='"+multipartRequest.getContextPath()+"/main/main.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
			return resEnt;
		}
		
		private List<String> goodsMainUpload(MultipartHttpServletRequest multipartRequest) throws Exception{
			 List<String> imageFileNames = new ArrayList<>();
			    
			    // �룞�씪�븳 �씠由꾩쓣 媛�吏� 紐⑤뱺 �뙆�씪�쓣 媛��졇�샃�땲�떎.
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
		
		private List<String> goodsSubUpload(MultipartHttpServletRequest multipartRequest) throws Exception {
		    List<String> imageFileNames = new ArrayList<>();
		    
		    // �룞�씪�븳 �씠由꾩쓣 媛�吏� 紐⑤뱺 �뙆�씪�쓣 媛��졇�샃�땲�떎.
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
		

		
		
		
	
	
	@RequestMapping(value = { "/business/myPage.do"}, method = RequestMethod.GET)
	private ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		BusinessVO bVO = (BusinessVO) session.getAttribute("businessVO");
		String b_no = bVO.getB_no();

		//사업장,사업장내부 상품 가져오기
		List<String> myCom = companyService.selectCompanyByBno(b_no);
		Map<String,List> myGoods = new HashMap<String,List>();
		List<ReviewVO> myReview = new ArrayList<ReviewVO>();
		//사업장 이름을 키값으로 넣고 그 사업장의 상품을 삽입
		for(int i=0;i<myCom.size();i++) {			 
			myGoods.put(myCom.get(i),goodsService.selectRoom(myCom.get(i)) );
			System.out.println(myCom.get(i)+" : "+ myGoods.get(myCom.get(i)));

			//내 사업장 리뷰 가져오기
			
			myReview = reviewService.selecteCompanyReviewList(myCom.get(i));
			
		}		

		
		
		
		//사업장 판매내역가져오기
		
		//북마크 수
		
		
		
		mav.addObject(myGoods);
		mav.addObject(myCom);
		mav.addObject(myReview);
		mav.setViewName(viewName);
		return mav;
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////
	
	/////                     사업자 비밀번호 찾기									///////////
	
	//////////////////////////////////////////////////////////////////////////////////////////
	
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
	
	
	
	/////////비밀번호 재설정 /////
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
	
	//사업자의 사업장(company) 목록조회
	@RequestMapping(value = "/business/b_companyList.do", method = RequestMethod.GET)
	private ModelAndView b_companyList(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");


		//로그인 세션정보중 사업자 번호 가져오기
		HttpSession session = request.getSession();
		BusinessVO businessVO = (BusinessVO) session.getAttribute("businessVO");
		String b_no = businessVO.getB_no();

		//사업자 번호 기준 사업장 목록 불러오기
		List<String> myCompanyList = companyService.selectCompanyByBno(b_no);

		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.addObject("myCompanyList", myCompanyList);
		mav.setViewName(viewName);
		return mav;
	}
	
	//사업자의 사업장(company) 목록에서 수정 들어가기
	@RequestMapping(value = "/business/b_modCompanyInList.do", method = RequestMethod.GET)
	private ModelAndView b_modCompanyInList(@RequestParam("company") String company, HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("viewName:" + viewName);

		//사업자의 사업장이름을 기준 해당 사업장정보 가져오기
		CompanyVO modCompanyInfo = companyService.modCompanyInList(company);

		//사업자 사업장이름 기준 해당정보 담아보내기
		ModelAndView mav = new ModelAndView();
		mav.addObject("modCompanyInfo", modCompanyInfo);
		mav.setViewName(viewName);
		return mav;
	}
	
	/*
	 * //사업자의 사업장(company) 수정정보로 갱신하기
	 * 미구현
	 * @RequestMapping(value = "/business/updateCompanyInList.do", method =
	 * RequestMethod.GET) private ModelAndView
	 * updateCompanyInfo(@ModelAttribute("companyVO") CompanyVO companyVO,
	 * HttpServletRequest request, HttpServletResponse response) { String viewName =
	 * (String) request.getAttribute("viewName"); System.out.println("viewName:" +
	 * viewName);
	 * 
	 * //b_modCompanyInList.do에서 새로운 정보 입력 후 갱신하기
	 * companyService.updateCompanyInList(companyVO);
	 * 
	 * 
	 * //갱신 완료 후 리스트 리다이렉트 ModelAndView mav = new
	 * ModelAndView("redirect:/business/b_companyList.do"); return mav; }
	 */
	
	//사업자의 사업장(company) 목록에서 사업장 삭제하기
	//데이터베이스의 관계도와 ON DELETE CASCADE가 있어야 작동할 것 같습니다.
	@RequestMapping(value="/business/deleteCompanyInList.do", method=RequestMethod.GET)
	private ModelAndView deleteCompanyInList(@ModelAttribute("c_no") int c_no, HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("viewName:" + viewName);
		
		//company값 기준 정보삭제
		companyService.deleteCompanyInList(c_no);
		
		ModelAndView mav = new ModelAndView("redirect:/business/b_companyList.do");
		return mav;
		
	}



















		//////////////////////////////////////////////////////////////////////////////////////////

		/////                       사업자 개인정보 수정하기									///////////

		//////////////////////////////////////////////////////////////////////////////////////////



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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////			
			
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
	}
	
