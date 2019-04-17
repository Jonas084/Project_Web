package spring.fin.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.fin.dao.BuyCoffeeDAO;
import spring.fin.dao.CoffeeDetailDAO;
import spring.fin.dao.MemberDAOImpl;
import spring.fin.model.CoffeeInformationDTO;
import spring.fin.model.MemberDTO;

@Controller
public class BuyController {
	@Autowired
	BuyCoffeeDAO buy;
	@Autowired
	private CoffeeDetailDAO coffeeDetail;
	@Autowired
	MemberDAOImpl member;
	
	@RequestMapping("buy_login.do")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response,HttpSession session,@RequestParam("coffee_number") int coffee_number) throws IOException{
		
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		if(id!=null){
			response.sendRedirect("buycoffee.do?coffee_number=" + coffee_number);
		}else{
			response.sendRedirect("member_Login.do");
		}
		return null;
	}
	
	@RequestMapping("buycoffee.do")
	public ModelAndView buy(HttpServletRequest request, HttpServletResponse response,HttpSession session,
			@RequestParam("coffee_number") int coffee_number){
		ModelAndView mv = new ModelAndView();
		CoffeeInformationDTO list=null;
		MemberDTO mem=null;
		String id = (String) session.getAttribute("id");
		list=coffeeDetail.selectDetail(coffee_number);
			
		mem=member.memSelect(id);
		
		mv.addObject("list",list);
		mv.addObject("mem",mem);
		mv.setViewName("buyConfirm");
		return mv;
	}
	
	@RequestMapping("buycoffeereal.do")
	public ModelAndView buyr(HttpServletRequest request, HttpServletResponse response,
			HttpSession session,@RequestParam("coffee_number") int coffee_number,@RequestParam("quantity") int quantity) throws IOException{
		CoffeeInformationDTO list=null;
		String id = (String) session.getAttribute("id");
		list=coffeeDetail.selectDetail(coffee_number);
		list.setPrice(list.getPrice()*quantity);
		
		System.out.println("real"+quantity);
		//포인트사용.
		MemberDTO mem=null;
		mem=member.memSelect(id);
		int point=mem.getUserPoint();
		int tprice=list.getPrice();
		int remain=point-tprice;
		System.out.println("1 "+remain);
		member.pointUpdate(id,remain);
		//구매기록에 넣기
		buy.insertCoffeeRecord(id,quantity,list);
				
		response.sendRedirect("buycoffeerealcom.do?coffee_number="+coffee_number+"&quantity="+quantity);
		return null;
	}
	@RequestMapping("buycoffeerealcom.do")
	public ModelAndView buyrc(HttpServletRequest request, HttpServletResponse response,
			HttpSession session,@RequestParam("coffee_number") int coffee_number,@RequestParam("quantity") int quantity){
		CoffeeInformationDTO list=null;
		MemberDTO mem=null;
		String id = (String) session.getAttribute("id");
		list=coffeeDetail.selectDetail(coffee_number);
		//커피가격
		int coffeep=list.getPrice();
		//총가격세팅
		list.setPrice(list.getPrice()*quantity);
		
		mem=member.memSelect(id);
		int remain=mem.getUserPoint();
		int tprice=list.getPrice();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("quantity",quantity);
		mv.addObject("coffeep",coffeep);
		mv.addObject("tprice",tprice);
		mv.addObject("remain",remain);
		mv.addObject("mem",mem);
		mv.addObject("list",list);
		mv.setViewName("buyComplete");
		return mv;
	}
	
}
