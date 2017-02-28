package main.service;

import java.io.*;
import java.net.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.util.*;
import org.springframework.web.servlet.view.*;

@Component
public class FileDownService extends AbstractView {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	ServletContext application;

	@Override
	protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		SqlSession ss = fac.openSession();
		String num = map.get("num").toString();
		HashMap map2 = ss.selectOne("notice.noticeOne", num);
		String fileName = map2.get("file").toString();
		String realName = map2.get("filename").toString();

		String browser = req.getHeader("User-Agent"); // 파일 인코딩
		if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
			realName = URLEncoder.encode(realName, "UTF-8").replaceAll("\\+", "%20");
		} else {
			realName = new String(realName.getBytes("UTF-8"), "ISO-8859-1");
		}

		resp.setHeader("content-Disposition", "attatchment;fileName=\"" + realName + "\"");

		File f = new File(application.getRealPath("/noticeFile"), fileName);
		File temp = change(f, realName, application);
		FileInputStream fis = new FileInputStream(temp);
		FileCopyUtils.copy(fis, resp.getOutputStream());
		temp.delete();
	}

	private File change(File f, String realName, ServletContext application) throws Exception {
		File temp = new File(application.getRealPath("/noticeFile"), realName);
		FileInputStream fis = new FileInputStream(f);
		FileOutputStream fos = new FileOutputStream(temp);
		while (true) {
			int n = fis.read();
			if (n < 0) {
				break;
			}
			fos.write(n);
		}
		return temp;
	}
}
