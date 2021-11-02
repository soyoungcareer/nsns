package com.kh.spring.certificate.controller;

import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.certificate.service.CertificateService;
import com.kh.spring.certificate.vo.Craw;
import com.kh.spring.member.vo.Student;

@Controller
public class crawController {
	
	 @Autowired 
	  private CertificateService certificateService;
	 
		@RequestMapping("crawMain.cer")
	    public String craw_select(Model model, HttpSession session, @RequestParam(value="categoryTable", required= false, defaultValue = "0") int categoryTable)throws Exception {
	        String url = "https://www.jobkorea.co.kr/top100/";
	        Document doc =Jsoup.connect(url).get();
	        int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
	        Student depart =  certificateService.studentDepartment(stuId);
	        Elements ele = doc.select("ol.rankList");
	        
	        Iterator<Element> company =ele.select("b").iterator();
	        Iterator<Element> title =ele.select("a span").iterator();
	        Iterator<Element> href =ele.select("a.link").iterator();
	        Iterator<Element> cHref =ele.select("a.coLink").iterator();
	        Iterator<Element> opt1 =ele.select("div.sDsc span:nth-child(1)").iterator();
	        Iterator<Element> opt2 =ele.select("div.sDsc span:nth-child(2)").iterator();
	        Iterator<Element> opt3 =ele.select("div.sDsc span:nth-child(3)").iterator();
	        Iterator<Element> opt4 =ele.select("div.sDsc span:nth-child(4)").iterator();
	        ArrayList<Craw> top = new ArrayList<Craw>();
	        
	        while(company.hasNext()&&title.hasNext()&&href.hasNext()&&cHref.hasNext()&&opt1.hasNext()&&opt2.hasNext()&&opt3.hasNext()&&opt4.hasNext()) {
	        	top.add(new Craw(title.next().text(),href.next().attr("href"),company.next().text(),
	        			cHref.next().attr("href"),opt1.next().text(),opt2.next().text(),opt3.next().text(),opt4.next().text()));
	        }
	        for(int i=0; i<top.size();i++) {
	        	System.out.println(i+" : "+top.get(i));
	        }
	        model.addAttribute("top", top);
	        model.addAttribute("depart", depart);
	        model.addAttribute("categoryTable", categoryTable);
	            return "board/crawBoard";
	    }
		@RequestMapping("crawSearch.cer")
	    public String craw_Search(Model model, HttpSession session, @RequestParam(value="categoryTable", required= false, defaultValue = "1" ) int categoryTable)throws Exception {
			int stuId = ((Student)session.getAttribute("loginStu")).getStuId();
	        Student depart =  certificateService.studentDepartment(stuId);
	        String url = "https://www.jobkorea.co.kr/Search/?stext="+depart.getDeptName();
	        Document doc =Jsoup.connect(url).get();
	        Elements ele = doc.select("ul.clear");
	        
	        Iterator<Element> company =ele.select("div.post-list-corp a").iterator();
	        Iterator<Element> href =ele.select("div.post-list-corp a").iterator();
	        Iterator<Element> title =ele.select("div.post-list-info a").iterator();
	        Iterator<Element> cHref =ele.select("div.post-list-info a").iterator();
	        Iterator<Element> opt1 =ele.select("p.option span.exp").iterator();
	        Iterator<Element> opt2 =ele.select("p.option span.edu").iterator();
	        Iterator<Element> opt3 =ele.select("p.option span.loc").iterator();
	        Iterator<Element> opt4 =ele.select("p.option span.date").iterator();
	        
	        ArrayList<Craw> top = new ArrayList<Craw>();
	        
	        while(company.hasNext()&&title.hasNext()&&href.hasNext()&&cHref.hasNext()&&opt1.hasNext()&&opt2.hasNext()&&opt3.hasNext()&&opt4.hasNext()) {
	        	top.add(new Craw(title.next().text(),href.next().attr("href"),company.next().text(),
	        			cHref.next().attr("href"),opt1.next().text(),opt2.next().text(),opt3.next().text(),opt4.next().text()));
	        }
	        for(int i=0; i<top.size();i++) {
	        	System.out.println(i+" : "+top.get(i));
	        }
	        model.addAttribute("top", top);
	        model.addAttribute("depart", depart);
	        model.addAttribute("categoryTable", categoryTable);
	            return "board/crawBoard";
	    }
}
