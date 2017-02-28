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
public class InfoService {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	ServletContext application;
	
	// 공지사항 메인 글 리스트
	public List<HashMap> infoList(int num){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("info.infoAllM");
		List<Integer> auto = new Vector<>();
		for(HashMap m : list){
			auto.add(Integer.parseInt(m.get("auto").toString()));
		}
		List<HashMap> list2 = new Vector<>();
		int n = list.size()>5 ? 5 : list.size();
		if(num==0){
			for(int i=0; i<n; i++){
				list2.add(list.get(i));
			}
		} else {
			for(int i=0; i<list.size(); i++){
				if(list.get(i).get("auto").toString().equals(Integer.toString(num))){
					if(i==list.size()-1){
						for(int j=n-1; j>n-6; j--){
							int a = 0;
							if((i-j)>(list.size()-1) || (i-j)<0){
								a++;
							}
							if(a==0){
								list2.add(list.get(i-j));
							}
						}
						break;
					} else if(i==list.size()-2){
						for(int j=n-2; j>n-7; j--){
							int a = 0;
							if((i-j)>(list.size()-1) || (i-j)<0){
								a++;
							}
							if(a==0){
								list2.add(list.get(i-j));
							}
						}
						break;
					} else if(i==0){
						for(int j=n-5; j<n; j++){
							int a = 0;
							if((i-j)>(list.size()-1) || (i+j)<0){
								a++;
							}
							if(a==0){
								list2.add(list.get(i+j));
							}
						}
						break;
					} else if(i==1){
						for(int j=n-6; j<n-1; j++){
							int a = 0;
							if((i-j)>(list.size()-1) || (i+j)<0){
								a++;
							}
							if(a==0){
								list2.add(list.get(i+j));
							}
						}
						break;
					} else {
						for(int j=n-7; j<n-2; j++){
							int a = 0;
							if((i-j)>(list.size()-1) || (i+j)<0){
								a++;
							}
							if(a==0){
								list2.add(list.get(i+j));
							}
						}
						break;
					}
				}
			}
		}
		ss.close();
		return list2;
	}
	
	// 이전 다음 페이지 분할
	public List<Integer> seperate(){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("info.infoAllM");
		List<Integer> auto = new Vector<>();
		for(HashMap m : list){
			auto.add(Integer.parseInt(m.get("auto").toString()));
		}
		ss.close();
		return auto;
	}
	
	// 마지막글 보기
	public HashMap lastView(){
		SqlSession ss = fac.openSession();
		HashMap view = ss.selectOne("info.lastViewM");
		ss.close();
		return view;
	}
	
	// 글 갯수
	public int page(){
		SqlSession ss = fac.openSession();
		int n = ss.selectOne("info.infoCountM");
		ss.close();
		return n;
	}

	// 첨부파일 uuid 생성 및 저장
	public HashMap<String, String> fileUUID(MultipartFile file, HttpSession session) {
		if(file.isEmpty()){
			return null;
		}
		try{
			String uuid = UUID.randomUUID().toString();
			String filename = uuid.substring(0,10);
			String fileDir = application.getRealPath("/infoFile");
			File f = new File(fileDir, filename);
			file.transferTo(f);
			SqlSession ss = fac.openSession();
			HashMap<String, String> map = new HashMap<>();
			map.put("id", ((HashMap)session.getAttribute("login")).get("id").toString());
			map.put("uuid", filename);
			map.put("fileName", file.getOriginalFilename());
			try{
				ss.insert("info.fileUpload", map);
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
	public boolean write(String title, String content, String uuid, String fileName, String type, HttpSession session) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("id", ((HashMap)session.getAttribute("login")).get("id").toString());
		map.put("nick", ((HashMap)session.getAttribute("login")).get("nick").toString());
		map.put("type", type);
		if(!uuid.equals("null") && !fileName.equals("null")){
			map.put("uuid", uuid);
			map.put("fileName", fileName);
		}
		try{
			ss.insert("info.writeM", map);
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
	
	
	
	

	// 글 보기
	public HashMap infoView(int num) {
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("info.infoViewM", num);
		ss.close();
		return map;
	}

	// 글 수정
	public boolean modify(int num, String title, String content) {
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("title", title);
		map.put("content", content);
		int n = ss.update("info.modifyM", map);
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
		int n = ss.delete("info.deleteM", num);
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
			if(c.getName().toString().equals("infoM"+num)){
				if(c.getValue().toString().equals(Integer.toString(num))){
					n++;
					break;
				}
			}
		}
		if(n==0){
			ss.update("info.countUpM", num);
			ss.commit();
			ss.close();
			Cookie c = new Cookie("infoM"+num, Integer.toString(num));
			c.setMaxAge(60*60);
			c.setPath("/");
			resp.addCookie(c);
		}
	}
}
