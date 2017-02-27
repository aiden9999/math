package high.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
@RequestMapping("/high/program")
public class HProgramController {

	// 프로그램
	@RequestMapping("/program")
	public ModelAndView program(){
		ModelAndView mav = new ModelAndView("/high/menu/program/program/program.jsp");
		mav.addObject("menu", "program");
		mav.addObject("topMenu", "program");
		return mav;
	}
	
	// 4단계 학습 시스템
	@RequestMapping("/system")
	public ModelAndView system(){
		ModelAndView mav = new ModelAndView("/high/menu/program/system/system.jsp");
		mav.addObject("menu", "system");
		mav.addObject("topMenu", "program");
		return mav;
	}
}
