package middle.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import middle.service.*;

@Controller
@RequestMapping("/middle/community/info")
public class CoinfoController {
	@Autowired
	InfoService ns;
	
	// 글 보기
	@RequestMapping("/view/{num}")
	public ModelAndView view(@PathVariable(name="num")int num, HttpServletRequest req, HttpServletResponse resp){
		ModelAndView mav = new ModelAndView("/middle/menu/community/info/info.jsp");
		mav.addObject("menu", "info");
		mav.addObject("topMenu", "community");
		ns.countUp(num, req, resp);
		HashMap view = ns.infoView(num);
		mav.addObject("view", view);
		List<HashMap> list = ns.infoList(num);
		int count = ns.page();
		mav.addObject("count", count);
		mav.addObject("list", list);
		List<Integer> sep = ns.seperate();
		mav.addObject("sep", sep);
		return mav;
	}
	
	// 글 쓰기
	@RequestMapping("/write")
	public ModelAndView write(){
		ModelAndView mav = new ModelAndView("/middle/menu/community/info/write.jsp");
		mav.addObject("menu", "info");
		mav.addObject("topMenu", "community");
		return mav;
	}
	
	// 글 쓰기 저장
	@RequestMapping("/writeSave")
	public ModelAndView write(@RequestParam(name="title")String title, @RequestParam(name="content")String content,
											@RequestParam(name="file", required=false)MultipartFile file, @RequestParam(name="type")String type,
											HttpSession session){
		ModelAndView mav = new ModelAndView("/middle/menu/community/info/info.jsp");
		HashMap map = new HashMap();
		map.put("uuid", "null");
		map.put("fileName", "null");
		if(!file.isEmpty()){
			map = ns.fileUUID(file, session);
		}
		boolean b = ns.write(title, content, map.get("uuid").toString(), map.get("fileName").toString(), type, session);
		mav.addObject("b", b ? "y" : "n");
		mav.addObject("menu", "info");
		mav.addObject("topMenu", "community");
		HashMap view = ns.lastView();
		mav.addObject("view", view);
		List<HashMap> list = ns.infoList(0);
		mav.addObject("list", list);
		int count = ns.page();
		mav.addObject("count", count);
		List<Integer> sep = ns.seperate();
		mav.addObject("sep", sep);
		return mav;
	}
	
	// 글 수정
	@RequestMapping("/modify/{num}/{title}/{content}")
	@ResponseBody
	public boolean modify(@PathVariable(name="num")int num, @PathVariable(name="title")String title, @PathVariable(name="content")String content){
		return ns.modify(num, title, content);
	}
	
	// 이전 / 다음
	@RequestMapping("/prevNext/{num}")
	@ResponseBody
	public ModelAndView next(@PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/middle/menu/community/info/infoAjax.jsp");
		List<HashMap> list = ns.infoList(num);
		mav.addObject("list", list);
		List<Integer> sep = ns.seperate();
		mav.addObject("sep", sep);
		return mav;
	}
	
	// 글 삭제
	@RequestMapping("/remove/{num}")
	@ResponseBody
	public boolean remove(@PathVariable(name="num")int num){
		return ns.remove(num);
	}
	
	// 파일 다운
	@RequestMapping("/down/{num}")
	public ModelAndView down(@PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("infoFileDownService");
		mav.addObject("num", num);
		return mav;
	}
}
