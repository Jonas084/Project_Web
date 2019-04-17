package spring.fin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.fin.dao.CoffeeRecommandDAO;
import spring.fin.model.CoffeeInformationDTO;
import spring.fin.model.CoffeeTasteDTO;


@Controller
public class RecommandController {
	@Autowired
	private CoffeeRecommandDAO coffeeRecommand;
	
	@RequestMapping(value="/recommand.do")
	public ModelAndView coffee_list(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="sourness", required=false,defaultValue="1") int sourness,
			@RequestParam(value="bitters", required=false,defaultValue="1") int bitters,
			@RequestParam(value="sweetness", required=false,defaultValue="1") int sweetness,
			@RequestParam(value="aroma",required=false, defaultValue="1") int aroma,
			@RequestParam(value="body", required=false,defaultValue="1") int body,
			@RequestParam(value="balance", required=false,defaultValue="1") int balance){
		
		System.out.println("recommand");
		List<CoffeeInformationDTO> list=null;
		CoffeeTasteDTO coffeeTaste = new CoffeeTasteDTO();
		coffeeTaste.setSourness(sourness);
		coffeeTaste.setBitters(bitters);
		coffeeTaste.setSweetness(sweetness);
		coffeeTaste.setAroma(aroma);
		coffeeTaste.setBody(body);
		coffeeTaste.setBalance(balance);
		
		list=coffeeRecommand.selectRecommand(coffeeTaste);
		
		for(int i=0;i<list.size();i++){
			CoffeeInformationDTO r=(CoffeeInformationDTO)list.get(i);
			System.out.println(r.getCoffee_name());
		}
			
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("recommand");
		return mv;
	}
	
	
	@RequestMapping(value="/recommandbest.do")
	public ModelAndView coffee_best(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="sourness", required=false,defaultValue="1") int sourness,
			@RequestParam(value="bitters", required=false,defaultValue="1") int bitters,
			@RequestParam(value="sweetness", required=false,defaultValue="1") int sweetness,
			@RequestParam(value="aroma",required=false, defaultValue="1") int aroma,
			@RequestParam(value="body", required=false,defaultValue="1") int body,
			@RequestParam(value="balance", required=false,defaultValue="1") int balance){
		List<CoffeeInformationDTO> list=null;
		CoffeeTasteDTO coffeeTaste = new CoffeeTasteDTO();
		coffeeTaste.setSourness(sourness);
		coffeeTaste.setBitters(bitters);
		coffeeTaste.setSweetness(sweetness);
		coffeeTaste.setAroma(aroma);
		coffeeTaste.setBody(body);
		coffeeTaste.setBalance(balance);
		list=coffeeRecommand.selectRecommandBest(coffeeTaste);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("recommand");
		return mv;
	}
	
	@RequestMapping(value="/recommandlowprice.do")
	public ModelAndView coffee_low(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="sourness", required=false,defaultValue="1") int sourness,
			@RequestParam(value="bitters", required=false,defaultValue="1") int bitters,
			@RequestParam(value="sweetness", required=false,defaultValue="1") int sweetness,
			@RequestParam(value="aroma",required=false, defaultValue="1") int aroma,
			@RequestParam(value="body", required=false,defaultValue="1") int body,
			@RequestParam(value="balance", required=false,defaultValue="1") int balance){
		List<CoffeeInformationDTO> list=null;
		CoffeeTasteDTO coffeeTaste = new CoffeeTasteDTO();
		coffeeTaste.setSourness(sourness);
		coffeeTaste.setBitters(bitters);
		coffeeTaste.setSweetness(sweetness);
		coffeeTaste.setAroma(aroma);
		coffeeTaste.setBody(body);
		coffeeTaste.setBalance(balance);
		list=coffeeRecommand.selectRecommandLow(coffeeTaste);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("recommand");
		return mv;
	}
	@RequestMapping(value="/recommandhighprice.do")
	public ModelAndView coffee_high(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="sourness", required=false,defaultValue="1") int sourness,
			@RequestParam(value="bitters", required=false,defaultValue="1") int bitters,
			@RequestParam(value="sweetness", required=false,defaultValue="1") int sweetness,
			@RequestParam(value="aroma",required=false, defaultValue="1") int aroma,
			@RequestParam(value="body", required=false,defaultValue="1") int body,
			@RequestParam(value="balance", required=false,defaultValue="1") int balance){
		List<CoffeeInformationDTO> list=null;
		CoffeeTasteDTO coffeeTaste = new CoffeeTasteDTO();
		coffeeTaste.setSourness(sourness);
		coffeeTaste.setBitters(bitters);
		coffeeTaste.setSweetness(sweetness);
		coffeeTaste.setAroma(aroma);
		coffeeTaste.setBody(body);
		coffeeTaste.setBalance(balance);
		list=coffeeRecommand.selectRecommandHigh(coffeeTaste);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",list);
		mv.setViewName("recommand");
		return mv;
	}
}
