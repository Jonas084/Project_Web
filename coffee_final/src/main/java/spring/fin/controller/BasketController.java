package spring.fin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.fin.dao.BasketDAO;
import spring.fin.dao.CoffeeDetailDAO;
import spring.fin.dao.CoffeePostscriptDAO;
import spring.fin.model.CoffeeInformationDTO;
import spring.fin.model.CoffeePostscriptDTO;

@Controller
public class BasketController {
	@Autowired
	private CoffeeDetailDAO coffeeDetail;
	@Autowired
	CoffeePostscriptDAO postscript;
	@Autowired
	CoffeeDetailDAO rec;
	@Autowired
	BasketDAO basket;
	
	@RequestMapping("basket_login.do")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response,HttpSession session,@RequestParam("coffee_number") int coffee_number) throws IOException{
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		if(id!=null){
			response.sendRedirect("basketcoffee.do?coffee_number=" + coffee_number);
		}else{
			response.sendRedirect("member_Login.do");
		}
		return null;
	}
	@RequestMapping("basketcoffee.do")
	public ModelAndView buy(HttpServletRequest request, HttpServletResponse response,HttpSession session,
		@RequestParam("coffee_number") int coffee_number){
		CoffeeInformationDTO list=null;
		List<CoffeePostscriptDTO> polist;
		String id = (String) session.getAttribute("id");
		
		//담기
		basket.insertBasket(id,coffee_number);
		
		//페이지복귀
		list=coffeeDetail.selectDetail(coffee_number);
		polist=postscript.selectPost(coffee_number);
		rec.plusCount(list);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.addObject("polist",polist);
		mv.setViewName("detail");
		return mv;
	}
	
}
