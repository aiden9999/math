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
@RequestMapping("/middle/community/notice")
public class NoticeController {
	@Autowired
	NoticeService ns;
	
	// 글 보기
	@RequestMapping("/view/{num}")
	public ModelAndView view(@PathVariable(name="num")int num, HttpServletRequest req, HttpServletResponse resp){
		ModelAndView mav = new ModelAndView("/middle/menu/community/notice/view.jsp");
		mav.addObject("menu", "notice");
		mav.addObject("topMenu", "community");
		HashMap view = ns.noticeView(num);
		mav.addObject("view", view);
		ns.countUp(num, req, resp);
		return mav;
	}
	
	// 글 쓰기
	@RequestMapping("/write")
	public ModelAndView write(){
		ModelAndView mav = new ModelAndView("/middle/menu/community/notice/write.jsp");
		mav.addObject("menu", "notice");
		mav.addObject("topMenu", "community");
		return mav;
	}
	
	// 글 쓰기 저장
	@RequestMapping("/writeSave")
	public ModelAndView write(@RequestParam(name="title")String title, @RequestParam(name="content")String content,
											@RequestParam(name="file", required=false)MultipartFile file, @RequestParam(name="type")String type,
											HttpSession session){
		ModelAndView mav = new ModelAndView("/middle/menu/community/notice/notice.jsp");
		HashMap map = new HashMap();
		map.put("uuid", "null");
		map.put("fileName", "null");
		if(!file.isEmpty()){
			map = ns.fileUUID(file, session);
		}
		boolean b = ns.write(title, content, map.get("uuid").toString(), map.get("fileName").toString(), type, session);
		mav.addObject("b", b ? "y" : "n");
		mav.addObject("menu", "notice");
		mav.addObject("topMenu", "community");
		List<HashMap> notice = ns.noticeList(0);
		mav.addObject("notice", notice);
		List<HashMap> noticeNew = ns.noticeNew();
		mav.addObject("noticeNew", noticeNew);
		int n = ns.noticePage();
		mav.addObject("noticePage", n);
		mav.addObject("selectPage", 1);
		int start = 1;
		mav.addObject("start", start);
		int end = start+9>n? n: start+9;
		mav.addObject("end", end);
		return mav;
	}
	
	// 글 수정
	@RequestMapping("/modify/{num}/{title}/{content}")
	@ResponseBody
	public boolean modify(@PathVariable(name="num")int num, @PathVariable(name="title")String title, @PathVariable(name="content")String content){
		return ns.modify(num, title, content);
	}
	
	// 페이지 이동
	@RequestMapping("/page/{num}")
	public ModelAndView page(@PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/middle/menu/community/notice/notice.jsp");
		mav.addObject("menu", "notice");
		mav.addObject("topMenu", "community");
		List<HashMap> notice = ns.noticeList(num);
		mav.addObject("notice", notice);
		List<HashMap> noticeNew = ns.noticeNew();
		mav.addObject("noticeNew", noticeNew);
		int n = ns.noticePage();
		mav.addObject("noticePage", n);
		mav.addObject("selectPage", num);
		int start = 1+(int)((num-1)/10)*10;
		mav.addObject("start", start);
		int end = start+9>n? n: start+9;
		mav.addObject("end", end);
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
		ModelAndView mav = new ModelAndView("fileDownService");
		mav.addObject("num", num);
		return mav;
	}
}
