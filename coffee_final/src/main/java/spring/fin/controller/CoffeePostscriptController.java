package spring.fin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.fin.dao.BuyCoffeeDAO;
import spring.fin.dao.CoffeeDetailDAO;
import spring.fin.dao.CoffeePostscriptDAO;
import spring.fin.dao.MemberDAOImpl;
import spring.fin.model.CoffeeInformationDTO;
import spring.fin.model.CoffeePostscriptDTO;

@Controller
public class CoffeePostscriptController {
	@Autowired
	CoffeePostscriptDAO postscript;
	@Autowired
	CoffeeDetailDAO detail;
	@Autowired
	MemberDAOImpl mem;
	@Autowired
	BuyCoffeeDAO record;
	
	@RequestMapping(value="/postInsert.do")
	public ModelAndView insertPost2(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("coffee_number") int coffee_number,
			@RequestParam("title") String title,
			@RequestParam("writer") String writer,
			@RequestParam("content") String content,
			@RequestParam("evaluation") String evaluation) throws IOException{
				
		CoffeePostscriptDTO post=new CoffeePostscriptDTO();
		CoffeeInformationDTO list;
		//후기작성
		List<CoffeePostscriptDTO> polist;
		post.setCoffee_number(coffee_number);
		post.setBoard_number(postscript.postCount());
		post.setTitle(title);
		post.setWriter(writer);
		post.setClick_count(0);
		post.setEvaluation(evaluation);
		post.setContent(content);
		postscript.insert(post);
		//구입후기 포인트 지급
		int n = record.searchId(writer,coffee_number);
		if(n>0){
			mem.plusPoint(writer);
		}
		System.out.println("구입횟수"+n);
		
		System.out.println("success");
		list=detail.selectDetail(coffee_number);
		polist=postscript.selectPost(coffee_number);
		System.out.println("커피번호"+list.getCoffee_number());
		
		response.sendRedirect("coffeeDetail.do?coffee_number="+coffee_number);
		return null;
	}
}
