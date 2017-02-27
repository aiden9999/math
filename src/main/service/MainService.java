package main.service;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class MainService {
	@Autowired
	SqlSessionFactory fac;
	
	// 아이디저장 / 자동로그인 체크
	public void check(HttpSession session, HttpServletRequest req, HttpServletResponse resp){
		Cookie[] ar = req.getCookies();
		String id = "";
		String pw = "";
		SqlSession ss = fac.openSession();
		if(ar!=null){
			for(Cookie c : ar){
				if(c.getName().equals("autoId")){
					id = c.getValue();
				} else if(c.getName().equals("autoPw")){
					pw = c.getValue();
				} else if(c.getName().equals("saveId")){
					id = c.getValue();
				}
			}
		}
		if(id!=""){
			if(pw!=""){
				List<HashMap> list = ss.selectList("member.memberList");
				for(HashMap m : list){
					if(m.get("id").toString().equals(id) && m.get("pw").toString().equals(pw)){
						session.setAttribute("login", m);
					}
				}
			} else {
				session.setAttribute("save", id);
			}
		}
		ss.close();
	}
	
	// 로그인
	public boolean login(String id, String pw, boolean autoLogin, boolean saveId, HttpSession session,
										HttpServletRequest req, HttpServletResponse resp){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		List<HashMap> list = ss.selectList("member.memberList");
		if(list.size()>0){
			for(HashMap m : list){
				if(m.get("id").toString().equals(id) && m.get("pw").toString().equals(pw)){
					session.setAttribute("login", m);
					ss.close();
					if(autoLogin){
						Cookie autoId = new Cookie("autoId", m.get("id").toString());
						Cookie autoPw = new Cookie("autoPw", m.get("pw").toString());
						autoId.setMaxAge(60*60*30);
						autoPw.setMaxAge(60*60*30);
						autoId.setPath("/");
						autoPw.setPath("/");
						resp.addCookie(autoId);
						resp.addCookie(autoPw);
					}
					if(saveId){
						Cookie save = new Cookie("saveId", m.get("id").toString());
						save.setMaxAge(60*60*30);
						save.setPath("/");
						resp.addCookie(save);
					}
					if(!autoLogin){
						Cookie autoId = new Cookie("autoId", "-");
						Cookie autoPw = new Cookie("autoPw", "-");
						autoId.setMaxAge(0);
						autoPw.setMaxAge(0);
						autoId.setPath("/");
						autoPw.setPath("/");
						resp.addCookie(autoId);
						resp.addCookie(autoPw);
					}
					if(!saveId){
						Cookie save = new Cookie("saveId", "-");
						save.setMaxAge(0);
						save.setPath("/");
						resp.addCookie(save);
					}
					ss.close();
					return true;
				}
			}
			ss.close();
			return false;
		} else {
			ss.close();
			return false;
		}
	}

	// 로그아웃
	public void logout(HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("saveId")) {
					continue;
				} else {
					c.setPath("/");
					c.setMaxAge(0);
					resp.addCookie(c);
				}
			}
		}
		session.removeAttribute("login");
	}
	
	// 아이피 저장 및 방문자수 리턴
	public String visitIp(HttpServletRequest req) {
		SqlSession ss = fac.openSession();
		String ip = req.getHeader("X-FORWARDED-FOR"); 
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getHeader("Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getHeader("WL-Proxy-Client-IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getHeader("HTTP_CLIENT_IP");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getHeader("HTTP_X_FORWARDED_FOR");
	    }
	    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	        ip = req.getRemoteAddr();
	    }
		List<HashMap> ipToday = new Vector<>();
		List<HashMap> ipAll = ss.selectList("main.getIpAll");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(System.currentTimeMillis());
		for(HashMap m : ipAll){
			if(m.get("day").toString().equals(today)){
				ipToday.add(m);
			}
		}
		int n = 0;
		for(HashMap m : ipToday){
			if(m.get("ip").toString().equals(ip)){
				n++;
				break;
			}
		}
		int todayVisit = ipToday.size();
		int totalVisit = ipAll.size();
		if(n==0){
			try{
				ss.insert("main.visitIp", ip);
				ss.commit();
				ss.close();
				todayVisit++;
				totalVisit++;
			} catch(Exception e){
				e.printStackTrace();
				ss.rollback();
				ss.close();
			}
		} else {
			ss.rollback();
			ss.close();
		}
		return todayVisit+"/"+totalVisit;
	}
}
