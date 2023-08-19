package com.amenity.admin.controller;

import java.io.File;
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
	
	@RequestMapping(value = { "/admin/notice.do"}, method = RequestMethod.GET)
	private ModelAndView notice(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = { "/admin/noticeForm.do"}, method = RequestMethod.GET)
	private ModelAndView noticeForm(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = { "/admin/viewNotice.do"}, method = RequestMethod.GET)
	private ModelAndView viewNotice(HttpServletRequest request, HttpServletResponse response) {
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
	private ModelAndView userList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		List userList = adminService.userList(); //23.08.19 유치상 추가
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("userList",userList); //23.08.19 유치상 추가
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
		
		String imageFileName = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		String u_id = userVO.getU_id();
		articleMap.put("parentNO", 0);
		articleMap.put("id", u_id);
		articleMap.put("imageFileName", imageFileName);
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		try {
			adminService.addNewArticle(articleMap);
			int num = adminService.selectNewArticleNO();
			if(imageFileName != null && imageFileName.length()!=0) {
				File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
				File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+ num);
				System.out.println("1");
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				System.out.println("2");
			}
			message = "<script>";
			message += " alert('�� ���� �߰��߽��ϴ�.');";
			message += "location.href='"+multipartRequest.getContextPath()+"/admin/noticeForm.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
			srcFile.delete();
			
			message = "<script>";
			message += " alert('�߰� �� ������ �߻��߽��ϴ�.');";
			message += "location.href='"+multipartRequest.getContextPath()+"/admin/noticeForm.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
	
}
