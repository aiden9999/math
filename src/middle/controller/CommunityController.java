package middle.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import middle.service.*;

@Controller
@RequestMapping("/middle/community")
public class CommunityController {
	@Autowired
	NoticeService ns;
	@Autowired
	ReviewService rs;
	
	// 공지사항
	@RequestMapping("/notice")
	public ModelAndView community(){
		ModelAndView mav = new ModelAndView("/middle/menu/community/notice/notice.jsp");
		mav.addObject("menu", "notice");
		mav.addObject("topMenu", "community");
		List<HashMap> notice = ns.noticeList(0);
		mav.addObject("notice", notice);
		List<HashMap> noticeNew = ns.noticeNew();
		mav.addObject("noticeNew", noticeNew);
		int n = ns.noticePage();
		mav.addObject("noticePage", n);
		mav.addObject("selectPage", 1);
		int start = 1>n ? n : 1;
		mav.addObject("start", start);
		int end = 10>n ? n : 10;
		mav.addObject("end", end);
		return mav;
	}
	
	// 수업후기
	@RequestMapping("/review")
	public ModelAndView review(){
		ModelAndView mav = new ModelAndView("/middle/menu/community/review/review.jsp");
		mav.addObject("menu", "review");
		mav.addObject("topMenu", "community");
		List<HashMap> review = rs.reviewList(0);
		mav.addObject("review", review);
		int n = rs.reviewPage();
		mav.addObject("reviewPage", n);
		mav.addObject("selectPage", 1);
		int start = 1>n ? n : 1;
		mav.addObject("start", start);
		int end = 10>n ? n : 10;
		mav.addObject("end", end);
		return mav;
	}
	
	// 입시정보
	@RequestMapping("/info")
	public ModelAndView info(){
		ModelAndView mav = new ModelAndView("/middle/menu/community/info/info.jsp");
		mav.addObject("menu", "info");
		mav.addObject("topMenu", "community");
		return mav;
	}
}
