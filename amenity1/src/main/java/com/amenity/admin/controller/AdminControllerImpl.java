package com.amenity.admin.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
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

import com.amenity.admin.service.AdminService;
import com.amenity.admin.vo.AdminVO;
import com.amenity.business.service.BusinessService;
import com.amenity.business.vo.BusinessVO;
import com.amenity.coupon.service.CouponService;
import com.amenity.notice.vo.NoticeVO;
import com.amenity.res.service.ResService;
import com.amenity.res.vo.ResVO;
import com.amenity.user.vo.UserVO;

@Controller("AdminController")
public class AdminControllerImpl {
	
	private static final String ARTICLE_IMAGE_REPO = "C:\\amenity\\notice_admin\\article_image";
	private static final String COUPON_IMAGE_REPO = "C:\\amenity\\coupon_admin\\coupon_image";
	
	@Autowired(required=true)
	private AdminService adminService;
	
	@Autowired
    private BusinessService businessService;
	
	@Autowired
    private ResService resService;
	
	@Autowired(required=true)
	AdminVO adminVO;
	
	@Autowired(required=true)
	UserVO userVO;
	
	@Autowired(required=true)
	NoticeVO noticeVO;
	
	@Autowired(required=true)
	ResVO resVO;
	
	@Autowired
    private CouponService couponService;
	
	
	
	@RequestMapping(value = { "/admin/noticeForm.do"}, method = RequestMethod.GET)
	private ModelAndView noticeForm(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	

	
	@RequestMapping(value = { "/admin/qnaReply.do"}, method = RequestMethod.GET)
	private ModelAndView qnaReply(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = { "/admin/res_inquiry.do"}, method = RequestMethod.GET)
	private ModelAndView res_inquiry(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		List<ResVO> resList = new ArrayList<ResVO>();
		
		resList = resService.selectAllRes();
		
		
		mav.addObject("resList", resList);
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = { "/admin/couponPublish.do"}, method = RequestMethod.GET)
	private ModelAndView couponPublish(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = { "/admin/a_modBusinessList.do"}, method = RequestMethod.GET)
	private ModelAndView _modBusiness(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	
	

	@RequestMapping(value = {"/admin/userList.do"}, method = RequestMethod.GET)
	public ModelAndView userList(
	        HttpServletRequest request, 
	        HttpServletResponse response, 
	        @RequestParam(value="page", defaultValue="1") int page) {
	    
			String viewName = (String)request.getAttribute("viewName");
			System.out.println(viewName);
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
	    
	    try {
	        int limit = 10;  // 예시로 페이지당 10개씩 보이도록 설정
	        int start = (page - 1) * limit;
	        System.out.println("page : " + page);
	        System.out.println("start : " + start);
	        List<UserVO> users = adminService.getUserList(start, limit);
	        int totalUsers = adminService.getTotalUserCount();

	        mav.addObject("users", users);
	        mav.addObject("totalUsers", totalUsers);
	        mav.addObject("currentPage", page);
	    } catch (Exception e) {
	        e.printStackTrace();
	        mav.addObject("errorMsg", "사용자 정보를 가져오는 도중 오류가 발생했습니다.");
	    }
	    
	    return mav;
	}


	@RequestMapping("/admin/userListSearch.do")
    public ModelAndView searchUsers(@RequestParam("search") String searchCategory, 
                                    @RequestParam("value") String searchValue, 
                                    @RequestParam(value="page", defaultValue="1") int page) {
        ModelAndView mav = new ModelAndView("/admin/userList");
        int limit = 10;
        int start = (page - 1) * limit;

        try {
            List<UserVO> users = adminService.searchUsers(searchCategory, searchValue, start, limit);
            int totalSearchedUsers = adminService.getSearchedUserCount(searchCategory, searchValue);

            mav.addObject("users", users);
            mav.addObject("totalUsers", totalSearchedUsers);
            mav.addObject("currentPage", page);
        } catch (Exception e) {
            System.err.println("Error occurred while searching users: " + e.getMessage());
            mav.addObject("errorMessage", "에러발생");
        }

        return mav;
    }


	@RequestMapping(value = {"/admin/businessList.do"}, method = RequestMethod.GET)
    public ModelAndView businessList(
            HttpServletRequest request, 
            HttpServletResponse response, 
            @RequestParam(value="page", defaultValue="1") int page) {
        
        String viewName = (String)request.getAttribute("viewName");
        ModelAndView mav = new ModelAndView();
        mav.setViewName(viewName);
    
        try {
            int limit = 10;
            int start = (page - 1) * limit;
            List<BusinessVO> businesses = adminService.getBusinessList(start, limit);
            int totalBusinesses = adminService.getTotalBusinessCount();

            mav.addObject("businesses", businesses);
            mav.addObject("totalBusinesses", totalBusinesses);
            mav.addObject("currentPage", page);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("errorMsg", "사업체 정보를 가져오는 도중 오류가 발생했습니다.");
        }
        
        return mav;
    }

    @RequestMapping("/admin/businessListSearch.do")
    public ModelAndView searchBusinesses(
            @RequestParam("search") String searchCategory, 
            @RequestParam("value") String searchValue, 
            @RequestParam(value="page", defaultValue="1") int page) {
        
        ModelAndView mav = new ModelAndView("/admin/businessList");
        int limit = 10;
        int start = (page - 1) * limit;

        try {
            List<BusinessVO> businesses = adminService.searchBusinesses(searchCategory, searchValue, start, limit);
            int totalSearchedBusinesses = adminService.getSearchedBusinessCount(searchCategory, searchValue);

            mav.addObject("businesses", businesses);
            mav.addObject("totalBusinesses", totalSearchedBusinesses);
            mav.addObject("currentPage", page);
        } catch (Exception e) {
            System.err.println("사업체 검색 중 오류 발생: " + e.getMessage());
            mav.addObject("errorMessage", "에러 발생");
        }

        return mav;
    }
	
    
    @RequestMapping(value="/admin/createCoupon", method= RequestMethod.POST)
	@ResponseBody
    public ResponseEntity createCoupon(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {

    	multipartRequest.setCharacterEncoding("utf-8");
    	Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		
		String imageFileNames = couponUpload(multipartRequest);
		articleMap.put("imagename", imageFileNames);
		String imageFileName = (String)articleMap.get("imagename");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
    	
    	try {
    		
    		couponService.createCoupon(articleMap);
        	String couponCode = (String)articleMap.get("couponCode");
        	if(imageFileName != null && imageFileName.length() != 0) {
		        File srcFile = new File(COUPON_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
		        File destDir = new File(COUPON_IMAGE_REPO + "\\" + couponCode);
		        FileUtils.moveFileToDirectory(srcFile, destDir, true);
		        System.out.println("controller imagefilename : "+imageFileName);
		    }
        	message = "<script>";
			message += " alert('success');";
			message += "location.href='"+multipartRequest.getContextPath()+"/admin/notice.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
        } catch (Exception e) {
        	File srcFile = new File(COUPON_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileNames);
			srcFile.delete();
			
			message = "<script>";
			message += " alert('fail');";
			message += "location.href='"+multipartRequest.getContextPath()+"/admin/noticeForm.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();   
        }
    	return resEnt;
    }

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/admin/notice.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView notice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List noticeList = adminService.listArticles();
		System.out.println("noticeList : " + noticeList);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("noticeList", noticeList);
		return mav;
	}
	
	@RequestMapping(value="/admin/viewNotice.do", method=RequestMethod.GET)
	public ModelAndView viewNotice(int articleNO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		noticeVO = adminService.viewNotice(articleNO);
		List<String> imageFileNames = adminService.getImageFileNames(articleNO);
		ModelAndView mav = new ModelAndView();
        mav.addObject("imageFileNames", imageFileNames);
		mav.setViewName(viewName);
		mav.addObject("notice", noticeVO);
		return mav;
	}
	
	
	
	@RequestMapping(value="/admin/addNewArticle.do", method= RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		
		List<String> imageFileNames = noticeUpload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		String u_id = userVO.getU_id();
		articleMap.put("parentNO", 0);
		articleMap.put("id", u_id);
		articleMap.put("imageFileNames", imageFileNames);
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			adminService.addNewArticle(articleMap);
			int num = adminService.selectNewArticleNO();
			for(String imageFileName : imageFileNames) {
			    if(imageFileName != null && imageFileName.length() != 0) {
			        File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			        File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + num);
			        FileUtils.moveFileToDirectory(srcFile, destDir, true);
			        Map<String, Object> imageMap = new HashMap<>();
			        imageMap.put("articleNO", num);
			        imageMap.put("imageFileName", imageFileName);
			        adminService.addNoticeImage(imageMap);
			        System.out.println("controller name : "+imageFileName);
			    }
			}
			message = "<script>";
			message += " alert(' 성 공 ');";
			message += "location.href='"+multipartRequest.getContextPath()+"/admin/notice.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileNames);
			srcFile.delete();
			
			message = "<script>";
			message += " alert(' 실 패 ');";
			message += "location.href='"+multipartRequest.getContextPath()+"/admin/noticeForm.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	private List<String> noticeUpload(MultipartHttpServletRequest multipartRequest) throws Exception {
	    List<String> imageFileNames = new ArrayList<>();
	    
	    // �룞�씪�븳 �씠由꾩쓣 媛�吏� 紐⑤뱺 �뙆�씪�쓣 媛��졇�샃�땲�떎.
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

	private String couponUpload(MultipartHttpServletRequest multipartRequest) throws Exception{
		String imageFileName = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		System.out.println("is upload fileNames : " + fileNames);
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName = mFile.getOriginalFilename();
			File file = new File(COUPON_IMAGE_REPO+"\\"+"temp"+"\\"+fileName);
			if(mFile.getSize()!=0) {
				if(!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(COUPON_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName));
				}
			}
		}
		System.out.println("imageFileName : " + imageFileName);
		return imageFileName;
	}
	
	@RequestMapping("/admin/download.do")
	public void download(@RequestParam("imageFileName") String imageFileName, @RequestParam("articleNO") Integer articleNO, HttpServletResponse response) throws Exception {
	    String downFile = ARTICLE_IMAGE_REPO + "\\" + articleNO + "\\" + imageFileName;
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
	
	//관리자 리스트의 회원정보 수정기능
		@RequestMapping(value = {"/admin/userModForm.do"}, method = RequestMethod.GET)
		public ModelAndView modMember(@RequestParam("u_id") String u_id, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			String viewName = (String) request.getAttribute("viewName");
			System.out.println("viewName:" + viewName);
			
			UserVO userVO = adminService.modMember(u_id);
			
			//email, domain 문자열 분리
			String[] emailParts = userVO.getEmail().split("@");
		    String email1 = emailParts[0];
		    String email2 = emailParts[1];
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("oldUserInfo", userVO);
			mav.addObject("emailLocalPart", email1); 
		    mav.addObject("emailDomain", email2);  
			mav.setViewName(viewName);
			return mav;
		}
		
		//관리자의 수정회원정보 업데이트기능
		 @RequestMapping(value = "/admin/userUpdate.do", method = RequestMethod.POST)
		 public ModelAndView updateMember(@ModelAttribute("modMemInfo") UserVO modMemInfo, HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			String viewName = (String) request.getAttribute("viewName");
			System.out.println("viewName:" + viewName);
			
			adminService.updateMember(modMemInfo);
			
			ModelAndView mav = new ModelAndView("redirect:/admin/userList.do");
			return mav;
			
		 }
}
