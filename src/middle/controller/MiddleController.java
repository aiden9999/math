package middle.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import main.service.*;
import middle.service.*;

@Controller
@RequestMapping("/middle")
public class MiddleController {
	@Autowired
	MemberService ms;

	// 회원가입 페이지 이동
	@RequestMapping("/join")
	public ModelAndView join(){
		ModelAndView mav = new ModelAndView("/middle/member/join.jsp");
		return mav;
	}
	
	// 회원가입 2페이지 이동
	@RequestMapping("/join2")
	public ModelAndView join2(){
		ModelAndView mav = new ModelAndView("/middle/member/join2.jsp");
		return mav;
	}
}
