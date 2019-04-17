package spring.fin.boardscontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import spring.fin.boardsdao.CoBoardDAOImpl;
import spring.fin.boardsmodel.CoBoardDTO;
import spring.fin.boardsmodel.userIPDTO;

@Controller
public class CoBoardController {

	//DAO객체를 주입
	@Autowired
	private CoBoardDAOImpl coboardService; // 의존관계
	
	/* 게시판 입력 폼*/
	@RequestMapping(value = "/coboard_write.do")
	public ModelAndView coboard_write(){
		return new ModelAndView("boards/coboard_write");
	}
		
	/* 게시판 저장*/
	@RequestMapping(value = "/coboard_write_ok.do", method = RequestMethod.POST)
	public ModelAndView coboard_write_ok(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException{
		String coboard_sort = request.getParameter("coboard_sort");
		String coboard_name = request.getParameter("coboard_name");
		String coboard_title = request.getParameter("coboard_title");
		String coboard_cont = request.getParameter("coboard_cont");
		String coboard_pwd = request.getParameter("coboard_pwd");
		// 테이블에 저장할 데이터를 빈에 저장
	
		CoBoardDTO bean = new CoBoardDTO();
		bean.setCoboard_sort(coboard_sort);
		bean.setCoboard_name(coboard_name);
		bean.setCoboard_title(coboard_title);
		bean.setCoboard_cont(coboard_cont);
		bean.setCoboard_pwd(coboard_pwd);
		// DAO의 저장 메서드 호출
		this.coboardService.insertCoBoard(bean);
		response.sendRedirect("coboard_list.do");
		return null;		
	}
	
	/* 게시물 목록 */
	@RequestMapping(value = "/coboard_list.do")
	public ModelAndView coboard_list(HttpServletRequest request) throws SQLException {
		int page = 1; // 기본 페이지 수
		int limit = 10; // 한 페이지 당 줄 수
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 총 레코드 수
		int colistcount = this.coboardService.getCoListCount();
	
		//한 페이지에 보여줄 목록
		List coBoardList = this.coboardService.getCoBoardList(page, limit);
		
		//총 페이지 수
		int maxpage = (int) ((double) colistcount / limit + 0.95);
		
		// 현재 페이지에서 보여줄 시작 페이지 수
		int startpage = (int) ((double) page / 10 + 0.9);
		
		// 현재 페이지에서 보여줄 끝 페이지 수
		int endpage = maxpage;
		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;
		
		System.out.println("여기1");
		// 가장 많이 본 글
		List bestclick = this.coboardService.getCoBoardBestClick();		
		System.out.println("여기2");
		System.out.println(bestclick);
		
		// 가장 많이 추천 받은 글
		List bestrecom = this.coboardService.getCoBoardBestReco();
		System.out.println("여기3");
		System.out.println(bestrecom);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("boards/coboard_list");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", colistcount);
		mv.addObject("coboardList", coBoardList);
		mv.addObject("bestclick", bestclick);
		mv.addObject("bestrecom", bestrecom);
		
		return mv;		
	}
	
	/* 게시판 내용 + 수정 + 답변글 폼 + 삭제폼*/
	@RequestMapping(value="/coboard_cont.do")
	public ModelAndView coboard_cont(HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
		
		// 글번호를 정수형 숫자로 바꿔서 저장		
		int coboard_no = Integer.parseInt(request.getParameter("num"));
		
		// 내용보기 cont, 수정폼은 edit, 삭제폼 del, 답변글 폼 reply
		String state = request.getParameter("state");
		
		int page=1;		
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
			// 페이지 번호 저장
		}		
		
		if(state.equals("cont")){ // 내용보기일 때만 조회수 증가
			this.coboardService.coBoardHit(coboard_no);
		}
		
		// 글번호에 해당하는 게시물 내용을 디비로부터 가져오기
		CoBoardDTO coboard = this.coboardService.getCoBoardCont(coboard_no);
		
		String coboard_cont = coboard.getCoboard_cont();
		coboard_cont = coboard_cont.replace("\n", "<br/>");
		// 내용을 입력할 때 엔터키 친 부분(\n)을 웹상에 보이게 할 때 다음줄로 개행(<br/>)을 시켜준다.
		
		ModelAndView coboardM = new ModelAndView();
		coboardM.addObject("cobcont", coboard);
		coboardM.addObject("coboard_cont", coboard_cont);
		coboardM.addObject("page", page);
		
		
		// 해당 게시물에 대한 댓글 정보 끌어와보기
		int coboard_ref = coboard.getCoboard_ref();
		List coboardRpList = this.coboardService.getCoBoardRpList(coboard_ref);
		
		coboardM.addObject("coboardRpList", coboardRpList);
		
		
		// 작업처리후 이동할 뷰페이지
		if(state.equals("cont")){ // 내용보기일 때
			coboardM.setViewName("boards/coboard_cont");
		} else if (state.equals("reply")){ // 답변폼일 때
			coboardM.setViewName("boards/coboard_cont");
		} else if (state.equals("edit")){ // 수정폼일 때
			coboardM.setViewName("boards/coboard_edit");
		} else if (state.equals("del")){ // 삭제폼일 때
			coboardM.setViewName("boards/coboard_delete");
		}
		
		return coboardM;
	}

	
	
	/* 게시글 추천/비추천 기능*/
	@RequestMapping(value="/coboard_contopinion.do")
	public ModelAndView coboard_contopinion(HttpServletRequest request, HttpServletResponse response) 
			throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// 글번호를 정수형 숫자로 바꿔서 저장		
		int coboard_no = Integer.parseInt(request.getParameter("num"));
		
		// 내용보기 cont, 수정폼은 edit, 삭제폼 del, 답변글 폼 reply
		String state = request.getParameter("state");
		
		// 게시판 유저가 신규 추천인지 아닌지 판단하는 숫자
		int judgeNum = 0;
		
		int page=1;		
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
			// 페이지 번호 저장
		}		
		
		  String ip = null;
		  String existip = null;

		  ip = request.getHeader("X-FORWARDED-FOR");

		  if (ip == null) {
			  ip = request.getHeader("Proxy-Client-IP");

			  	if (ip == null) {	
			  		ip = request.getRemoteAddr();	
			  	}

		  }
		  
		System.out.println(ip);
		System.out.println("여기까진 옴?");		
		
		userIPDTO useripdto = new userIPDTO();
		useripdto.setCoboard_no(coboard_no);
		useripdto.setUserIP(ip);
		
		/* 유저 IP 이미 저장된 것이 있는 지 판단*/		  
		existip = this.coboardService.getStoredIp(useripdto);
		System.out.println(existip);
		System.out.println("여기까진 옴?2"); 
		  
		
		/* 유저 IP저장*/
		 if(ip.equals(existip)){
			 judgeNum = 0;
		}else if((ip != null) && (!ip.equals(existip))){
			this.coboardService.storeIP(useripdto);
			judgeNum = 1;			
		}
		
		System.out.println("여기까진 옴?3");
		System.out.println(judgeNum);
		System.out.println(ip);
		
		if(judgeNum == 1){
			if(state.equals("recommendation")){ // 추천일 때 추천 수 증가
				this.coboardService.coBoardRecommand(coboard_no);
			} else if(state.equals("opposition")){ // 비추천일 때 비추천 수 증가
				this.coboardService.coBoardOpposition(coboard_no);
			}
		}  
		
		// 글번호에 해당하는 게시물 내용을 디비로부터 가져오기
		CoBoardDTO coboard = this.coboardService.getCoBoardCont(coboard_no);
		
		String coboard_cont = coboard.getCoboard_cont();
		coboard_cont = coboard_cont.replace("\n", "<br/>");
		// 내용을 입력할 때 엔터키 친 부분(\n)을 웹상에 보이게 할 때 다음줄로 개행(<br/>)을 시켜준다.
		
		ModelAndView coboardM = new ModelAndView();
		coboardM.addObject("cobcont", coboard);
		coboardM.addObject("coboard_cont", coboard_cont);
		coboardM.addObject("page", page);
		
		
		// 해당 게시물에 대한 댓글 정보 끌어오기
		int coboard_ref = coboard.getCoboard_ref();
		List coboardRpList = this.coboardService.getCoBoardRpList(coboard_ref);		
		coboardM.addObject("coboardRpList", coboardRpList);		
		
		// 작업처리후 이동할 뷰페이지	
		
		coboardM.setViewName("boards/coboard_cont");
		
		if(judgeNum == 0){
			out.println("<script>");
			out.println("alert('이미 추천/비추천을 선택하셨습니다!')");
			out.println("history.go(-1)");
			out.println("</script>");
			
		}
		
		judgeNum = 0; // judgeNum을 0으로 초기화시켜 다음 ip에 대한 판단을 가능케 함.
		return coboardM;		
		
	}
		
	
	/* 답변 저장 */
	@RequestMapping(value = "/coboard_reply_ok.do", method = RequestMethod.POST)
	public ModelAndView coboard_reply_ok(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 글번호를 저장
		int coboard_no = Integer.parseInt(request.getParameter("coboard_no"));
		
		// 글 그룹번호 저장
		int coboard_ref = Integer.parseInt(request.getParameter("coboard_ref"));
		
		// 답변글끼리의 순서번호 저장
		int coboard_step = Integer.parseInt(request.getParameter("coboard_step"));
		
		// 답변글 깊이
		int coboard_level = Integer.parseInt(request.getParameter("coboard_level"));
		
		
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			// 페이지 번호를 저장
		}
		
		
		
		// trim을 붙여 전달받은 파라미터값의 앞뒤 공백을 제거함.
		String coboard_name = request.getParameter("coboard_name").trim();		
		String coboard_title = request.getParameter("coboard_title").trim();		
		String coboard_cont = request.getParameter("coboard_cont").trim();		
/*		String coboard_pwd = request.getParameter("coboard_pwd").trim();
		System.out.println("여기까진 오는가5");*/
		String coboard_sort = request.getParameter("coboard_sort").trim();
		
		
		
		CoBoardDTO b = new CoBoardDTO();
		b.setCoboard_no(coboard_no);
		b.setCoboard_sort(coboard_sort);
		b.setCoboard_ref(coboard_ref);
		b.setCoboard_step(coboard_step);
		b.setCoboard_level(coboard_level);
		b.setCoboard_name(coboard_name);
		b.setCoboard_title(coboard_title);
		b.setCoboard_cont(coboard_cont);
		//b.setCoboard_pwd(coboard_pwd);		
		
		
		this.coboardService.replyCoBoard(b);// 저장메서드 호출
		
		
		response.sendRedirect("coboard_cont.do?num="+coboard_no +"&page="+page+"&state=reply");		
		
		return null;
	}

	/* 게시물 수정완료 */
	@RequestMapping(value = "/coboard_edit_ok.do", method = RequestMethod.POST)
	public ModelAndView coboard_edit_ok(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter(); // 클라이언트의 HTML 텍스트 데이터 전송하기 위해
		// 출력스트림 객체 생성		
		
		int coboard_no = Integer.parseInt(request.getParameter("coboard_no"));
		// 히든으로 넘어온 글번호를 정수형 숫자로 바꿔서 저장
		int page = 1;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		/*String coboard_name = request.getParameter("coboard_name").trim();*/
		String coboard_title = request.getParameter("coboard_title").trim();
		String coboard_cont = request.getParameter("coboard_cont").trim();
		String coboard_pwd = request.getParameter("coboard_pwd").trim();

		CoBoardDTO db_pwd = this.coboardService.getCoBoardCont(coboard_no);
		// 번호에 해당하는 게시물 내용을 디비로 부터 가져온다.

		if (!db_pwd.getCoboard_pwd().equals(coboard_pwd)) {// 비번이 다른경우
			out.println("<script>");
			out.println("alert('비번이 다릅니다!')");
			out.println("history.go(-1)");
			out.println("</script>");
		} else {// 비번이 같은 경우
			CoBoardDTO editB = new CoBoardDTO();
			editB.setCoboard_no(coboard_no);
			/*editB.setCoboard_name(coboard_name);*/
			editB.setCoboard_title(coboard_title);
			editB.setCoboard_cont(coboard_cont);

			this.coboardService.editCoBoard(editB);// 수정메서드 호출

			response.sendRedirect("coboard_cont.do?num=" + coboard_no + "&page=" + page + "&state=cont");
		}
		return null;
	}

	/* 게시물 삭제 완료 */
	@RequestMapping(value = "/coboard_del_ok.do", method = RequestMethod.POST)
	public ModelAndView coboard_del_ok(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		int coboard_no = Integer.parseInt(request.getParameter("coboard_no"));
		int page = Integer.parseInt(request.getParameter("page"));
		String coboard_pwd = request.getParameter("coboard_pwd").trim();

		CoBoardDTO db_pwd = this.coboardService.getCoBoardCont(coboard_no);

		if (db_pwd.getCoboard_pwd().equals(coboard_pwd)) {
			this.coboardService.deleteCoBoard(coboard_no);

			response.sendRedirect("coboard_list.do?page=" + page);
		} else {
			out.println("<script>");
			out.println("alert('비번이 다릅니다!')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}	

	
	
	/* 게시판 검색 */
	@RequestMapping(value="/coboard_find.do")
	public ModelAndView coboard_find(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute CoBoardDTO coboard) throws Exception{
		
		
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// 예제에 제시된 관리자 로그인 코드는 생략 후 수정. 
		
		CoBoardDAOImpl dao = new CoBoardDAOImpl();
		int page = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String find_name = null; // 검색어 저장
		
		if(request.getParameter("find_name").trim() != null){
			find_name = request.getParameter("find_name").trim();
			System.out.println("이름받기"+find_name);
			// get방식으로 넘어온 언어 코딩 타입을 위의 설정에서 UTF-8로 바꿔서 안 깨짐.
		}
		
		String find_field = null; // 검색 필드(영역) 저장
		if(request.getParameter("find_field") != null){
			find_field = request.getParameter("find_field");
		}
		
		int listcount = this.coboardService.getFindListCount("%" + find_name + "%", find_field);
		// 총 리스트 수를 받아왔음.
		
		List<CoBoardDTO> coboardList = dao.getCoBoardSearchList(page, limit, "%" + find_name + "%", find_field);
		// 리스트를 받아옴.
		System.out.println("값이 오긴 하는가");
		// 예제에 있는 관리자용은 불필요해 보여서 수정 없이 아예 생략.
		
		int maxpage = 0;
		if (listcount % limit == 0){
			maxpage = listcount / limit;
		} else {
			maxpage = listcount / limit +1;
		}
		
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		
		int endpage = maxpage;
		
		if (endpage > startpage + limit - 1)
			endpage = startpage + limit - 1;
		
		request.setAttribute("page", page); // 현재 페이지 수
		request.setAttribute("maxpage", maxpage); // 최대 페이지 수.
		request.setAttribute("startpage", startpage); // 현재 페이지에 표시할 첫 페이지 수.		
		request.setAttribute("endpage", endpage);// 현재 페이지에 표시할 끝 페이지 수. 
		request.setAttribute("listcount", listcount); // 글 수
		request.setAttribute("coboardList", coboardList);
		
		ModelAndView model = new ModelAndView("boards/coboard_find");		
		model.addObject("find_name", find_name);
		model.addObject("find_field", find_field);		
		
		return model;		
		
	}	
	
}