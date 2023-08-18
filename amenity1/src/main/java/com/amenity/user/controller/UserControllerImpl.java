
package com.amenity.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.amenity.email.service.EmailService;
import com.amenity.goods.service.GoodsService;
import com.amenity.user.service.UserService;
import com.amenity.user.vo.UserVO;


@Controller("userController")
public class UserControllerImpl {
	@Autowired(required=true)
	private UserService userService;
	
	@Autowired(required=true)
	private GoodsService goodsService;
	
	@Autowired(required=true)
	private EmailService emailService;
	
	@Autowired(required=true)
	UserVO userVO;
	
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
	
	@RequestMapping(value = { "/user/event.do"}, method = RequestMethod.GET)
	private ModelAndView event(HttpServletRequest request, HttpServletResponse response) {
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
	
	@RequestMapping(value = { "/user/myres.do"}, method = RequestMethod.GET)
	private ModelAndView myres(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = { "/user/payment.do"}, method = RequestMethod.GET)
	private ModelAndView payment(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = { "/user/payComplete.do"}, method = RequestMethod.GET)
	private ModelAndView payComplete(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
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
	
	
	
	
	
	
	
	
	
	
	////////////////////////////////////////////////////
	/////// 占쎌�占쏙옙 占쎈퉾占쎈굡占쎈？甕곕뜇�깈嚥∽옙 占쎈툡占쎌뵠占쎈탵 筌≪뼐由�  ////////////////////
	////////////////////////////////////////////////////
	
	@RequestMapping(value="/user/selectUfindIdByPhone.do")
	public ModelAndView selectUfindIdByPhone(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		System.out.println("name: " + name);
		System.out.println("tel: " + tel);
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		UserVO result = userService.selectUfindIdByPhone(name, tel);	
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("result", result);
		return mav;
	}
	
	
	////////////////////////////////////////////////////
	/////// 占쎌�占쏙옙 占쎌뵠筌롫뗄�뵬嚥∽옙 占쎈툡占쎌뵠占쎈탵 筌≪뼐由�  ////////////////////
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

	/////                       占쎌삢獄쏅떽�럡占쎈빍 					///////////

	//////////////////////////////////////////////////////////////////////////////////////////

	@RequestMapping(value="/user/cart.do", method=RequestMethod.GET)
	public ModelAndView cart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text; charset=utf-8");
		String viewName = (String)request.getAttribute("viewName");
		List goodsList = goodsService.listGoods();
		//ModelAndView mav = new ModelAndView(viewName);
		ModelAndView mav = new ModelAndView("/user/cart");
		mav.addObject("goodsList", goodsList);
		return mav;
	}


	
	
	
	
	
	
	
	
	
	
}

