package spring.fin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.fin.dao.CoffeeDetailDAO;
import spring.fin.dao.CoffeePostscriptDAO;
import spring.fin.model.CoffeeInformationDTO;
import spring.fin.model.CoffeePostscriptDTO;

@Controller
public class DetailController {
	@Autowired
	private CoffeeDetailDAO coffeeDetail;
	@Autowired
	CoffeePostscriptDAO postscript;
	@Autowired
	CoffeeDetailDAO rec;
	
	@RequestMapping(value="/coffeeDetail.do")
	public ModelAndView coffee_detail(HttpServletRequest request, HttpServletResponse response,@RequestParam("coffee_number") int coffee_number){
		CoffeeInformationDTO list=null;
		List<CoffeePostscriptDTO> polist;
		
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
