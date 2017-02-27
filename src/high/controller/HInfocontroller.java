package high.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
@RequestMapping("/high/info")
public class HInfocontroller {

	// 학원소개
	@RequestMapping("/info")
	public ModelAndView info(){
		ModelAndView mav = new ModelAndView("/high/menu/info/info/info.jsp");
		mav.addObject("menu", "info");
		mav.addObject("topMenu", "info");
		return mav;
	}
	
	// 대표 인사말
	@RequestMapping("/greet")
	public ModelAndView greet(){
		ModelAndView mav = new ModelAndView("/high/menu/info/greet/greet.jsp");
		mav.addObject("menu", "greet");
		mav.addObject("topMenu", "info");
		return mav;
	}
	
	// 학원위치
	@RequestMapping("/location")
	public ModelAndView location(){
		ModelAndView mav = new ModelAndView("/high/menu/info/location/location.jsp");
		mav.addObject("menu", "location");
		mav.addObject("topMenu", "info");
		return mav;
	}
	
	// 입학안내
	@RequestMapping("/admission")
	public ModelAndView admission(){
		ModelAndView mav = new ModelAndView("/high/menu/info/admission/admission.jsp");
		mav.addObject("menu", "admission");
		mav.addObject("topMenu", "info");
		return mav;
	}
	
	// 선생님 소개
//	@RequestMapping("/teacher")
//	public ModelAndView teacher(){
//		ModelAndView mav = new ModelAndView("/high/menu/info/teacher/teacher.jsp");
//		mav.addObject("menu", "teacher");
//		mav.addObject("topMenu", "info");
//		return mav;
//	}
}
