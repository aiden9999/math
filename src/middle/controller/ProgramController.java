package middle.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
@RequestMapping("/middle/program")
public class ProgramController {

	// ���α׷�
	@RequestMapping("/program")
	public ModelAndView program(){
		ModelAndView mav = new ModelAndView("/middle/menu/program/program/program.jsp");
		mav.addObject("menu", "program");
		mav.addObject("topMenu", "program");
		return mav;
	}
	
	// 4�ܰ� �н� �ý���
	@RequestMapping("/system")
	public ModelAndView system(){
		ModelAndView mav = new ModelAndView("/middle/menu/program/system/system.jsp");
		mav.addObject("menu", "system");
		mav.addObject("topMenu", "program");
		return mav;
	}
	
	// �н�����
	@RequestMapping("/process")
	public ModelAndView process(){
		ModelAndView mav = new ModelAndView("/middle/menu/program/process/process.jsp");
		mav.addObject("menu", "process");
		mav.addObject("topMenu", "program");
		return mav;
	}
}
