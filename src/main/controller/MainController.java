package main.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import main.service.*;

@Controller
@RequestMapping("/")
public class MainController {
	@Autowired
	MainService ms;

	// 인트로
	@RequestMapping("/")
	public ModelAndView index(HttpSession session, HttpServletRequest req, HttpServletResponse resp){
		ModelAndView mav = new ModelAndView("/main/intro.jsp");
		ms.check(session, req, resp);
		String ipSize = ms.visitIp(req);
		String todayVisit = ipSize.substring(0, ipSize.indexOf('/'));
		String totalVisit = ipSize.substring(ipSize.indexOf('/')+1);
		session.setAttribute("todayVisit", todayVisit);
		session.setAttribute("totalVisit", totalVisit);
		return mav;
	}
	
	// 중등학원 메인
	@RequestMapping("/middle")
	public ModelAndView middle(HttpSession session){
		ModelAndView mav = new ModelAndView("/middle/index/index.jsp");
		session.setAttribute("type", "middle");
		return mav;
	}
	
	// 고등학원 메인
	@RequestMapping("/high")
	public ModelAndView high(HttpSession session){
		ModelAndView mav = new ModelAndView("/high/index/index.jsp");
		session.setAttribute("type", "high");
		return mav;
	}
	
	// 로그인
	@RequestMapping("/login/{id}/{pw}/{autoLogin}/{saveId}")
	@ResponseBody
	public boolean login(@PathVariable(name="id")String id, @PathVariable(name="pw")String pw, @PathVariable(name="autoLogin")boolean autoLogin,
										@PathVariable(name="saveId")boolean saveId, HttpSession session, HttpServletRequest req, HttpServletResponse resp){
		return ms.login(id, pw, autoLogin, saveId, session, req, resp);
	}
	
	// 내정보
	@RequestMapping("/info")
	public ModelAndView info(){
		ModelAndView mav = new ModelAndView("/member/info.jsp");
		return mav;
	}
	
	// 정보변경
	@RequestMapping("/infoChange")
	public ModelAndView infoChange(){
		ModelAndView mav = new ModelAndView("/member/infoChange.jsp");
		String[] addr = {"서울", "인천", "세종", "대전", "대구", "광주", "울산", "부산", "경기도", "강원도", "충청도", "전라도", "경상도", "제주도"};
		mav.addObject("addr", addr);
		String[] phone = {"010", "011", "016", "017", "018", "019"};
		mav.addObject("phone", phone);
		mav.addObject("menu", "info");
		return mav;
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest req, HttpServletResponse resp){
		ms.logout(session, req, resp);
		return "redirect:/";
	}
}
