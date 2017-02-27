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
public class HNoticeService {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	ServletContext application;
	
	// 공지사항 메인 글 리스트
	public List<HashMap> noticeList(int num){
		SqlSession ss = fac.openSession();
		List<HashMap> list = new Vector<>();
		if(num==0){
			list = ss.selectList("notice.noticeList", 0);
		} else {
			list = ss.selectList("notice.noticeList", (num-1)*10);
		}
		ss.close();
		return list;
	}
	
	// 공지사항 메인 새글 리스트
	public List<HashMap> noticeNew() {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("notice.noticeNew");
		ss.close();
		return list;
	}

	// 글 보기
	public HashMap noticeView(int num) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("notice.noticeView", num);
		ss.close();
		return map;
	}

	// 첨부파일 uuid 생성 및 저장
	public HashMap<String, String> fileUUID(MultipartFile file, HttpSession session) {
		if(file.isEmpty()){
			return null;
		}
		try{
			String uuid = UUID.randomUUID().toString();
			String filename = uuid.substring(0,10);
			String fileDir = application.getRealPath("/noticeFile");
			File f = new File(fileDir, filename);
			file.transferTo(f);
			SqlSession ss = fac.openSession();
			HashMap<String, String> map = new HashMap<>();
			map.put("id", ((HashMap)session.getAttribute("login")).get("id").toString());
			map.put("uuid", filename);
			map.put("fileName", file.getOriginalFilename());
			try{
				ss.insert("notice.fileUpload", map);
				ss.commit();
				ss.close();
				return map;
			} catch(Exception e){
				e.printStackTrace();
				ss.rollback();
				ss.close();
			}
			return map;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	// 공지사항 저장
	public boolean write(String title, String content, String uuid, String fileName, HttpSession session) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("id", ((HashMap)session.getAttribute("login")).get("id").toString());
		map.put("nick", ((HashMap)session.getAttribute("login")).get("nick").toString());
		if(!uuid.equals("null") && !fileName.equals("null")){
			map.put("uuid", uuid);
			map.put("fileName", fileName);
		}
		try{
			ss.insert("notice.write", map);
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
	public int noticePage() {
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("notice.noticeCount");
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
		int n = ss.update("notice.modify", map);
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
		int n = ss.delete("notice.delete", num);
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
			if(c.getName().toString().equals("notice"+num)){
				if(c.getValue().toString().equals(Integer.toString(num))){
					n++;
					break;
				}
			}
		}
		if(n==0){
			ss.update("notice.countUp", num);
			ss.commit();
			ss.close();
			Cookie c = new Cookie("notice"+num, Integer.toString(num));
			c.setMaxAge(60*60);
			c.setPath("/");
			resp.addCookie(c);
		}
	}
}
