package high.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
@RequestMapping("/high")
public class HighController {

	// �α��� ������
	@RequestMapping("/login")
	public ModelAndView login(){
		ModelAndView mav = new ModelAndView("/high/member/login.jsp");
		return mav;
	}
	
	// ȸ������ ������
	@RequestMapping("/join")
	public ModelAndView join(){
		ModelAndView mav = new ModelAndView("/high/member/join.jsp");
		return mav;
	}
	
	// ȸ������ 2������
	@RequestMapping("/join2")
	public ModelAndView join2(){
		ModelAndView mav = new ModelAndView("/high/member/join2.jsp");
		return mav;
	}
}
