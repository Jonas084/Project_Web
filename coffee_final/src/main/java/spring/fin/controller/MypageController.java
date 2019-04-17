package spring.fin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.fin.dao.BasketDAO;
import spring.fin.dao.BuyCoffeeDAO;
import spring.fin.dao.CoffeeRecommandDAO;
import spring.fin.dao.CouponDAO;
import spring.fin.dao.MemberDAOImpl;
import spring.fin.model.BasketDTO;
import spring.fin.model.BuyRecordDTO;
import spring.fin.model.UserBasketDTO;
import spring.fin.model.UserBuyRecordDTO;

@Controller
public class MypageController {
	@Autowired
	BuyCoffeeDAO buyrecord;
	@Autowired
	CoffeeRecommandDAO coffee;
	@Autowired
	MemberDAOImpl mem;
	@Autowired
	CouponDAO cdao;
	@Autowired
	BasketDAO basket;
	
	@RequestMapping("mypage_login.do")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException{
		
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		if(id!=null){
			response.sendRedirect("mypage_basket.do");
		}else{
			response.sendRedirect("member_Login.do");
		}
		return null;
	}
	

	
	//구매내역
	@RequestMapping(value="/mypage_record.do")
	public ModelAndView my_record(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		List<BuyRecordDTO> record=null;
		List relist = new ArrayList();
		String id = (String) session.getAttribute("id");
		
		record = buyrecord.recordGet(id);
		for(int i=0;i<record.size();i++){
			UserBuyRecordDTO dto=new UserBuyRecordDTO();
			dto.setMain_img(coffee.mainimgGet(record.get(i).getCoffee_number()));
			dto.setCoffee_name(coffee.nameGet(record.get(i).getCoffee_number()));
			dto.setPrice(coffee.priceGet(record.get(i).getCoffee_number()));
			dto.setBuy_count(record.get(i).getBuy_count());
			dto.setBuy_price(record.get(i).getBuy_price());
			dto.setBuydate(record.get(i).getBuydate());
			
			relist.add(dto);
		}
				
		ModelAndView mv = new ModelAndView();
		mv.addObject("relist",relist);
		mv.setViewName("mypage/mypage_buyrecord");
		return mv;
	}
	//포인트
	@RequestMapping(value="/mypage_point.do")
	public ModelAndView my_point(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		
		String id = (String) session.getAttribute("id");
		int mempoint = mem.userPointGet(id);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("mempoint",mempoint);
		mv.setViewName("mypage/mypage_point");
		return mv;
	}
	//쿠폰사용
	@RequestMapping(value="/coupon_input.do")
	public ModelAndView coupon_point(HttpServletRequest request, HttpServletResponse response, HttpSession session,@RequestParam("couponNum") String couponNum) throws IOException{
		
		String id = (String) session.getAttribute("id");
		
		System.out.println(couponNum);
		int n=cdao.couponCheck(couponNum);
				
		if(n != 0){
			int price = cdao.couponPriceGet(couponNum);
			mem.addPoint(id,price);
			cdao.deleteCoupon(couponNum);
		}else if(n==0){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter put;
			put = response.getWriter();
			System.out.println("없는 쿠폰번호");
			put.println("<script>alert('없는 쿠폰번호 입니다.');location='mypage_point.do';</script>");
		
			return null;

		}
		int mempoint = mem.userPointGet(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("mempoint",mempoint);
		mv.setViewName("mypage/mypage_point");
		return mv;
	}
	//장바구니
	@RequestMapping(value="/mypage_basket.do")
	public ModelAndView basket(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException{
		List<BasketDTO> basketlist;
		List userbasketlist = new ArrayList();
		String id = (String) session.getAttribute("id");
		basketlist=basket.selectBasket(id);
		for(int i=0;i<basketlist.size();i++){
			UserBasketDTO dto=new UserBasketDTO();
			dto.setBasket_number(basketlist.get(i).getBasket_number());
			dto.setUserID(id);
			dto.setMain_img(coffee.mainimgGet(basketlist.get(i).getCoffee_number()));
			dto.setInform_img_a(coffee.imgaGet(basketlist.get(i).getCoffee_number()));
			dto.setCoffee_name(coffee.nameGet(basketlist.get(i).getCoffee_number()));
			dto.setPrice(coffee.priceGet(basketlist.get(i).getCoffee_number()));
			
			userbasketlist.add(dto);
		}
		int mempoint = mem.userPointGet(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("mempoint",mempoint);
		mv.addObject("userbasketlist",userbasketlist);
		mv.setViewName("mypage/mypage_basket");
		return mv;
	}
	
	//장바구니 결제
	@RequestMapping(value="/buy_basket.do")
	@ResponseBody
	public ModelAndView buybasket(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam(value="checkArray[]") List<Integer> checkArray,@RequestParam(value="top[]") List<Integer> totalp,
			@RequestParam(value="quantity[]") List<Integer> quantity,@RequestParam(value="totalprice") int totalprice) throws IOException{
		String id = (String) session.getAttribute("id");
		//포인트 까기
		mem.usePoint(id,totalprice);
				
		//구매이력넣기
		for(int i=0;i<checkArray.size();i++){
			System.out.println(basket.coffeeNumberGet(checkArray.get(i).intValue()));
			System.out.println(totalp.get(i).intValue());
			System.out.println(quantity.get(i).intValue());
			buyrecord.insertCoffeeRecordB(id, basket.coffeeNumberGet(checkArray.get(i).intValue()), totalp.get(i).intValue(), quantity.get(i).intValue());
		}
		//장바구니지우기
		for(int i=0;i<checkArray.size();i++){
			basket.deleteBasket(checkArray.get(i).intValue());
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mypage/mypage_basket");
		return mv;
	}
	//체크 장바구니 삭제
	@RequestMapping(value="/delete_basket.do")
	@ResponseBody
	public ModelAndView dbasket(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam(value="checkArray[]") List<Integer> checkArray) throws IOException{
		for(int i=0;i<checkArray.size();i++){
			basket.deleteBasket(checkArray.get(i).intValue());
		}
		return null;
	}
	
}
