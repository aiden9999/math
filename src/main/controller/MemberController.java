package main.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import main.service.*;
import middle.service.*;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	MemberService ms;
	
	// 회원가입
	@RequestMapping("/join/{id}/{name}/{nick}/{pw}/{addr1}/{addr2}/{phone}/{agreeSms}/{agreeEmail}")
	@ResponseBody
	public boolean join3(@PathVariable(name="id")String id, @PathVariable(name="name")String name, @PathVariable(name="nick")String nick,
									@PathVariable(name="pw")String pw, @PathVariable(name="addr1")String addr1, @PathVariable(name="addr2")String addr2,
									@PathVariable(name="phone")String phone, @RequestParam(name="email")String email,
									@PathVariable(name="agreeSms")String agreeSms, @PathVariable(name="agreeEmail")String agreeEmail){
		return ms.join(id, name, nick, pw, addr1, addr2, phone, email, agreeSms, agreeEmail);
	}
	
	// 아이디 중복체크
	@RequestMapping("/idCheck/{id}")
	@ResponseBody
	public boolean idCheck(@PathVariable(name="id")String id){
		return ms.idCheck(id);
	}
	
	// 닉네임 중복체크
	@RequestMapping("/nickCheck/{nick}")
	@ResponseBody
	public boolean nickCheck(@PathVariable(name="nick")String nick){
		return ms.nickCheck(nick);
	}
	
	// 아이디 찾기
	@RequestMapping("/searchId/{name}/{phone}")
	public ModelAndView searchId(@PathVariable(name="name")String name, @PathVariable(name="phone")String phone){
		ModelAndView mav = new ModelAndView("/member/searchId.jsp");
		HashMap map = ms.searchId(name, phone);
		if(map != null){
			mav.addObject("id", map.get("id"));
			mav.addObject("year", map.get("day").toString().substring(0, map.get("day").toString().indexOf('-')));
			mav.addObject("month", map.get("day").toString().substring(map.get("day").toString().indexOf('-')+1, map.get("day").toString().lastIndexOf('-')));
			mav.addObject("day", map.get("day").toString().substring(map.get("day").toString().lastIndexOf('-')+1));
		} else {
			mav.addObject("id", null);
		}
		return mav;
	}
	
	// 정보 변경
	@RequestMapping("/change/{id}/{nick}/{addr1}/{addr2}/{phone}/{agreeSms}/{agreeEmail}")
	@ResponseBody
	public boolean change(@PathVariable(name="id")String id, @PathVariable(name="nick")String nick, @PathVariable(name="addr1")String addr1,
										@PathVariable(name="addr2")String addr2, @PathVariable(name="phone")String phone,
										@PathVariable(name="agreeSms")String agreeSms, @PathVariable(name="agreeEmail")String agreeEmail,
										@RequestParam(name="email")String email, HttpSession session){
		return ms.change(id, nick, addr1, addr2, phone, agreeSms, agreeEmail, email, session);
	}
}
