package main.service;

import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class MemberService {
	@Autowired
	SqlSessionFactory fac;
	
	// 회원가입
	public boolean join(String id, String name, String nick, String pw, String addr1, String addr2, String phone, String email,
									String agreeSms, String agreeEmail){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		map.put("nick", nick);
		map.put("pw", pw);
		map.put("addr1", addr1);
		map.put("addr2", addr2);
		map.put("phone", phone);
		map.put("email", email);
		map.put("agreeSms", agreeSms);
		map.put("agreeEmail", agreeEmail);
		try{
			ss.insert("member.join", map);
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
	
	// 아이디 중복체크
	public boolean idCheck(String id){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("member.memberList");
		if(list.size()>0){
			for(HashMap m : list){
				if(m.get("id").toString().equals(id)){
					ss.close();
					return false;
				}
			}
			ss.close();
			return true;
		} else {
			ss.close();
			return true;
		}
	}

	// 닉네임 중복체크
	public boolean nickCheck(String nick) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("member.memberList");
		if(list.size()>0){
			for(HashMap m : list){
				if(m.get("nick").toString().equals(nick)){
					ss.close();
					return false;
				}
			}
			ss.close();
			return true;
		} else {
			ss.close();
			return true;
		}
	}

	// 아이디 찾기
	public HashMap searchId(String name, String phone) {
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("member.memberList");
		if(list.size()>0){
			for(HashMap m : list){
				if(m.get("name").toString().equals(name) && m.get("phone").toString().equals(phone)){
					ss.close();
					return m;
				}
			}
		}
		ss.close();
		return null;
	}

	// 정보변경
	public boolean change(String id, String nick, String addr1, String addr2, String phone, String agreeSms,
			String agreeEmail, String email, HttpSession session) {
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("nick", nick);
		map.put("addr1", addr1);
		map.put("addr2", addr2);
		map.put("phone", phone);
		map.put("agreeSms", agreeSms);
		map.put("agreeEmail", agreeEmail);
		map.put("email", email);
		int n = ss.update("member.change", map);
		if(n>0){
			ss.commit();
			List<HashMap> list = ss.selectList("member.memberList");
			for(HashMap m : list){
				if(m.get("id").toString().equals(((HashMap)session.getAttribute("login")).get("id"))){
					session.setAttribute("login", m);
					break;
				}
			}
			ss.close();
			return true;
		} else {
			ss.commit();
			ss.close();
			return false;
		}
	}
}
