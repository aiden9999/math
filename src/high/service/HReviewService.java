package high.service;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

@Component
public class HReviewService {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	ServletContext application;
	
	// 공지사항 메인 글 리스트
	public List<HashMap> reviewList(int num){
		SqlSession ss = fac.openSession();
		List<HashMap> list = new Vector<>();
		if(num==0){
			list = ss.selectList("review.reviewListH", 0);
		} else {
			list = ss.selectList("review.reviewListH", (num-1)*10);
		}
		ss.close();
		return list;
	}

	// 글 보기
	public HashMap reviewView(int num) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("review.reviewViewH", num);
		ss.close();
		return map;
	}

	// 공지사항 저장
	public boolean write(String title, String content,HttpSession session) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("id", ((HashMap)session.getAttribute("login")).get("id").toString());
		map.put("nick", ((HashMap)session.getAttribute("login")).get("nick").toString());
		try{
			ss.insert("review.writeH", map);
			ss.commit();
			ss.close();
			return true;
		} catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
			return false;
		}
	}

	// 공지사항 페이지
	public int reviewPage() {
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("review.reviewCountH");
		ss.close();
		n = n%10==0 ? n/10 : n/10+1;
		return n;
	}

	// 글 수정
	public boolean modify(int num, String title, String content) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("title", title);
		map.put("content", content);
		int n = ss.update("review.modifyH", map);
		if(n>0){
			ss.commit();
			ss.close();
			return true;
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}

	// 글 삭제
	public boolean remove(int num) {
		SqlSession ss = fac.openSession();
		int n = ss.delete("review.deleteH", num);
		if(n>0){
			ss.commit();
			ss.close();
			return true;
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}

	// 글 조회수 증가
	public void countUp(int num, HttpServletRequest req, HttpServletResponse resp) {
		SqlSession ss = fac.openSession();
		Cookie[] ar = req.getCookies();
		int n = 0;
		for(Cookie c : ar){
			if(c.getName().toString().equals("reviewH"+num)){
				if(c.getValue().toString().equals(Integer.toString(num))){
					n++;
					break;
				}
			}
		}
		if(n==0){
			ss.update("review.countUpH", num);
			ss.commit();
			ss.close();
			Cookie c = new Cookie("reviewH"+num, Integer.toString(num));
			c.setMaxAge(60*60);
			c.setPath("/");
			resp.addCookie(c);
		}
	}
	
	// 내글보기
	public List<HashMap> myReview(String id, int page) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		if(page==0){
			map.put("page", page);
		} else {
			map.put("page", (page-1)*10);
		}
		List<HashMap> list = ss.selectList("review.myReviewH", map);
		ss.close();
		return list;
	}

	// 내글 페이지
	public int myPage(String id) {
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("review.myReviewCountH", id);
		ss.close();
		n = n%10==0 ? n/10 : n/10+1;
		return n;
	}
}
