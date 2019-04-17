package spring.fin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.fin.dao.CoffeeArticleDAO;
import spring.fin.model.CoffeeArticleDTO;

@Controller
public class FamousController2 {
	@Autowired
	CoffeeArticleDAO coffeenews;
	
	
	@RequestMapping(value="/famouscafe.do")
	public ModelAndView coffee_famous(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("famouscafe");
		return mv;
	}
	
	
	
	@RequestMapping(value="/article.do")
	public ModelAndView coffee_article(HttpServletRequest request, HttpServletResponse response){
		
		List<CoffeeArticleDTO> list=null;
		
		list= coffeenews.selectArticle();
			
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", list);
		
		mv.setViewName("article");
		return mv;
	}
}
