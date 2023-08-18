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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.amenity.goods.service.GoodsService;
import com.amenity.user.service.UserService;
import com.amenity.user.vo.UserVO;

/*2023.08.17 18:13 테스트입니다.*/
/* mental 추가 테스트입니다.*/
/* ㅁㄴㅇㅇㅇ */
/* 내꺼 테스트 */
@Controller("userController")
public class UserControllerImpl {
	@Autowired(required=true)
	private UserService userService;
	
	@Autowired(required=true)
	private GoodsService goodsService;
	
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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	////////////////////////////////////////////////////
	/////// 유저 핸드폰번호로 아이디 찾기  ////////////////////
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
	/////// 유저 핸드폰번호로 아이디 찾기  ////////////////////
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

/////                        일반유저 로그인										///////////

//////////////////////////////////////////////////////////////////////////////////////////


	@RequestMapping(value="/main/u_signIn.do", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("userVO") UserVO userVO, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		userVO = userService.u_signIn(userVO);
		if(userVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
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
			mav.setViewName("redirect:/main/u_login.do.do");
		}
		return mav;
	}

	
//////////////////////////////////////////////////////////////////////////////////////////

/////                        일반유저 로그아웃										///////////

//////////////////////////////////////////////////////////////////////////////////////////


	
	
	@RequestMapping(value="/main/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("isLogOn", false);		
		System.out.println("로그아웃");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}
	
	
	//////////////////////////////////////////////////////////////////////////////////////////

	/////                       장바구니 					///////////

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
