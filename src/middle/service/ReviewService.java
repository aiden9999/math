package middle.service;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

@Component
public class ReviewService {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	ServletContext application;
	
	// �������� ���� �� ����Ʈ
	public List<HashMap> reviewList(int num){
		SqlSession ss = fac.openSession();
		List<HashMap> list = new Vector<>();
		if(num==0){
			list = ss.selectList("review.reviewListM", 0);
		} else {
			list = ss.selectList("review.reviewListM", (num-1)*10);
		}
		ss.close();
		return list;
	}

	// �� ����
	public HashMap reviewView(int num) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("review.reviewViewM", num);
		ss.close();
		return map;
	}

	// �������� ����
	public boolean write(String title, String content,HttpSession session) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("id", ((HashMap)session.getAttribute("login")).get("id").toString());
		map.put("nick", ((HashMap)session.getAttribute("login")).get("nick").toString());
		try{
			ss.insert("review.writeM", map);
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

	// �������� ������
	public int reviewPage() {
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("review.reviewCountM");
		ss.close();
		n = n%10==0 ? n/10 : n/10+1;
		return n;
	}

	// �� ����
	public boolean modify(int num, String title, String content) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("title", title);
		map.put("content", content);
		int n = ss.update("review.modifyM", map);
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

	// �� ����
	public boolean remove(int num) {
		SqlSession ss = fac.openSession();
		int n = ss.delete("review.deleteM", num);
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

	// �� ��ȸ�� ����
	public void countUp(int num, HttpServletRequest req, HttpServletResponse resp) {
		SqlSession ss = fac.openSession();
		Cookie[] ar = req.getCookies();
		int n = 0;
		for(Cookie c : ar){
			if(c.getName().toString().equals("reviewM"+num)){
				if(c.getValue().toString().equals(Integer.toString(num))){
					n++;
					break;
				}
			}
		}
		if(n==0){
			ss.update("review.countUpM", num);
			ss.commit();
			ss.close();
			Cookie c = new Cookie("reviewM"+num, Integer.toString(num));
			c.setMaxAge(60*60);
			c.setPath("/");
			resp.addCookie(c);
		}
	}

	// ���ۺ���
	public List<HashMap> myReview(String id, int page) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		if(page==0){
			map.put("page", page);
		} else {
			map.put("page", (page-1)*10);
		}
		List<HashMap> list = ss.selectList("review.myReviewM", map);
		ss.close();
		return list;
	}

	// ���� ������
	public int myPage(String id) {
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("review.myReviewCountM", id);
		ss.close();
		n = n%10==0 ? n/10 : n/10+1;
		return n;
	}

	// �˻�
//	public List<HashMap> reviewSearch(String type, String search) {
//		SqlSession ss = fac.openSession();
//		String word = "%"+search+"%";
//		String sql = "review.review"+type;
//		List<HashMap> list = ss.selectList(sql, word);
//		return null;
//	}
}
