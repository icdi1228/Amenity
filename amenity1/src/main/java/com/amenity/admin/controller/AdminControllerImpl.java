package com.amenity.admin.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.amenity.admin.service.AdminService;
import com.amenity.admin.vo.AdminVO;
import com.amenity.notice.vo.NoticeVO;
import com.amenity.user.vo.UserVO;

@Controller("AdminController")
public class AdminControllerImpl {
	
	private static final String ARTICLE_IMAGE_REPO = "C:\\amenity\\notice_admin\\article_image";
	
	@Autowired(required=true)
	private AdminService adminService;
	
	@Autowired(required=true)
	AdminVO adminVO;
	
	@Autowired(required=true)
	UserVO userVO;
	
	@Autowired(required=true)
	NoticeVO noticeVO;
	
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
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = { "/admin/userList.do"}, method = RequestMethod.GET)
	private ModelAndView userList(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = { "/admin/businessList.do"}, method = RequestMethod.GET)
	private ModelAndView businessList(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
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
		ModelAndView mav = new ModelAndView();
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
		
		List<String> imageFileNames = upload(multipartRequest);
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
			message += " alert('성공');";
			message += "location.href='"+multipartRequest.getContextPath()+"/admin/notice.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileNames);
			srcFile.delete();
			
			message = "<script>";
			message += " alert('실패');";
			message += "location.href='"+multipartRequest.getContextPath()+"/admin/noticeForm.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	private List<String> upload(MultipartHttpServletRequest multipartRequest) throws Exception {
	    List<String> imageFileNames = new ArrayList<>();
	    
	    // 동일한 이름을 가진 모든 파일을 가져옵니다.
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

	
	
	// 수정하기전 upload
/*	
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		String imageFileName = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		System.out.println("is upload fileNames : " + fileNames);
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			System.out.println("upload fileName : "+fileName);
			MultipartFile mFile = multipartRequest.getFile(fileName);
			System.out.println("upload mFile : "+mFile);
			imageFileName = mFile.getOriginalFilename();
			System.out.println("upload imageFileName : "+imageFileName);
			File file = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+fileName);
			System.out.println("upload File : "+file);
			if(mFile.getSize()!=0) {
				if(!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName));
				}
			}
		}
		System.out.println("imageFileName : " + imageFileName);
		return imageFileName;
	}
*/	
}
