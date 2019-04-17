package spring.fin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.fin.dao.CoffeePostscriptDAO;
import spring.fin.dao.SearchDAOImpl;
import spring.fin.model.CoffeePostscriptDTO;
import spring.fin.model.SearchCriteriaDTO;

@Controller
public class SearchController {
	@Autowired
	private SearchDAOImpl search;
	
	// 검색 리스트 보여주기
	@RequestMapping(value="/search.do")
	public ModelAndView listAll(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="searchType",required=false,defaultValue="1")String searchType,
			@RequestParam(value="keyword",required=false,defaultValue="1")String keyword){ 
		
		//String searchType= request.getParameter("searchType"); 또는 RequestParam으로 받아옴
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println(searchType);
		System.out.println(keyword);
		
		List<CoffeePostscriptDTO> list=null;
		SearchCriteriaDTO scr = new SearchCriteriaDTO();
		
		if(searchType != null){
				if(searchType.equals("t")){
				System.out.println(searchType);
				scr.setSearchType(searchType);
				scr.setKeyword(keyword);
				list=search.title(scr, scr);
				mv.addObject("listAll",list);
				mv.setViewName("homeSearch");
				
			}else if(searchType.equals("c")){
				System.out.println(searchType);
				scr.setSearchType(searchType);
				scr.setKeyword(keyword);
				list=search.content(scr, scr);
				mv.addObject("listAll",list);
				mv.setViewName("homeSearch");
				 
			}else if(searchType.equals("w")){
				System.out.println(searchType);
				scr.setSearchType(searchType);
				scr.setKeyword(keyword);
				list=search.writer(scr, scr);
				mv.addObject("listAll",list);
				mv.setViewName("homeSearch");
				System.out.println(mv);
				
			}else if(searchType.equals("a")){
				CoffeePostscriptDTO post = new CoffeePostscriptDTO();
				post.setEvaluation(keyword);
				mv.addObject("listAll", search.all(post));
				mv.setViewName("homeSearch");
			}else{
				System.out.println("에러");
			}
		}
		return mv;
	}
/*	@RequestMapping(value="/event.do")
	public ModelAndView eventSave(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="perNum",required=false,defaultValue="1")String perNum,
			@RequestParam(value="namePer",required=false,defaultValue="1")String namePer){
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println(perNum);
		System.out.println(namePer);
		
		List<CoffeePostscriptDTO> list=null;
		SearchCriteriaDTO scr = new SearchCriteriaDTO();//입력된 내용을 저장할 javaBean
		
		
		return mv;
	}*/
}
