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
@RequestMapping("/middle/community/review")
public class ReviewController {
	@Autowired
	ReviewService ns;

	// �������� ����
	@RequestMapping("/")
	public ModelAndView review(){
		ModelAndView mav = new ModelAndView("/menu/community/review/review.jsp");
		mav.addObject("menu", "review");
		mav.addObject("hMenu", "hCommunity");
		List<HashMap> review = ns.reviewList(0);
		mav.addObject("review", review);
		List<HashMap> reviewNew = ns.reviewNew();
		mav.addObject("reviewNew", reviewNew);
		int n = ns.reviewPage();
		mav.addObject("reviewPage", n);
		mav.addObject("selectPage", 1);
		int start = 1>n ? n : 1;
		mav.addObject("start", start);
		int end = 10>n ? n : 10;
		mav.addObject("end", end);
		return mav;
	}
	
	// �� ����
	@RequestMapping("/view/{num}")
	public ModelAndView view(@PathVariable(name="num")int num, HttpServletRequest req, HttpServletResponse resp){
		ModelAndView mav = new ModelAndView("/menu/community/review/view.jsp");
		mav.addObject("menu", "review");
		mav.addObject("hMenu", "hCommunity");
		HashMap view = ns.reviewView(num);
		mav.addObject("view", view);
		ns.countUp(num, req, resp);
		return mav;
	}
	
	// �� ����
	@RequestMapping("/write")
	public ModelAndView write(){
		ModelAndView mav = new ModelAndView("/menu/community/review/write.jsp");
		mav.addObject("menu", "review");
		mav.addObject("hMenu", "hCommunity");
		return mav;
	}
	
	// �� ���� ����
	@RequestMapping("/writeSave")
	public ModelAndView write(@RequestParam(name="title")String title, @RequestParam(name="content")String content,
											@RequestParam(name="file", required=false)MultipartFile file, HttpSession session){
		ModelAndView mav = new ModelAndView("/menu/community/review/review.jsp");
		HashMap map = new HashMap();
		map.put("uuid", "null");
		map.put("fileName", "null");
		if(!file.isEmpty()){
			map = ns.fileUUID(file, session);
		}
		boolean b = ns.write(title, content, map.get("uuid").toString(), map.get("fileName").toString(), session);
		mav.addObject("b", b ? "y" : "n");
		mav.addObject("menu", "review");
		mav.addObject("hMenu", "hCommunity");
		List<HashMap> review = ns.reviewList(0);
		mav.addObject("review", review);
		List<HashMap> reviewNew = ns.reviewNew();
		mav.addObject("reviewNew", reviewNew);
		int n = ns.reviewPage();
		mav.addObject("reviewPage", n);
		mav.addObject("selectPage", 1);
		int start = 1+(int)((n-1)/10)*10;
		mav.addObject("start", start);
		int end = start+9>n? n: start+9;
		mav.addObject("end", end);
		return mav;
	}
	
	// �� ����
	@RequestMapping("/modify/{num}/{title}/{content}")
	@ResponseBody
	public boolean modify(@PathVariable(name="num")int num, @PathVariable(name="title")String title, @PathVariable(name="content")String content){
		return ns.modify(num, title, content);
	}
	
	// ������ �̵�
	@RequestMapping("/page/{num}")
	public ModelAndView page(@PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("/menu/community/review/review.jsp");
		mav.addObject("menu", "review");
		mav.addObject("hMenu", "hCommunity");
		List<HashMap> review = ns.reviewList(num);
		mav.addObject("review", review);
		List<HashMap> reviewNew = ns.reviewNew();
		mav.addObject("reviewNew", reviewNew);
		int n = ns.reviewPage();
		mav.addObject("reviewPage", n);
		mav.addObject("selectPage", num);
		int start = 1+(int)((num-1)/10)*10;
		mav.addObject("start", start);
		int end = start+9>n? n: start+9;
		mav.addObject("end", end);
		return mav;
	}
	
	// �� ����
	@RequestMapping("/remove/{num}")
	@ResponseBody
	public boolean remove(@PathVariable(name="num")int num){
		return ns.remove(num);
	}
	
	// ���� �ٿ�
	@RequestMapping("/down/{num}")
	public ModelAndView down(@PathVariable(name="num")int num){
		ModelAndView mav = new ModelAndView("fileDownService");
		mav.addObject("num", num);
		return mav;
	}
}
