package spring.fin.boardsdao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



import spring.fin.boardsmodel.CoBoardDTO;
import spring.fin.boardsmodel.CoSearchDTO;
import spring.fin.boardsmodel.userIPDTO;


// myBatis 연동
@Repository
public class CoBoardDAOImpl {
	
	/* myBatis 객체 주입(설정파일 Coboard.xml)*/
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	Connection con = null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	DataSource ds=null;
	String sql=null;
	
	public CoBoardDAOImpl(){ // 생성자
		  try{
			  Context ctx=new InitialContext();
			  ds=
				(DataSource)ctx.lookup("java:comp/env/jdbc/xe");	  
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		}
	
	
	/*게시판 저장*/
	public void insertCoBoard(CoBoardDTO coboard){
		this.sqlSession.insert("coboard_insert", coboard);
	}	
	
	/* 게시물 총 개수 */
	public int getCoListCount(){
		int re = (Integer)this.sqlSession.selectOne("coboard_count");		
		return re;
	}
	
	/* 게시판 목록 보기 */
	public List<CoBoardDTO> getCoBoardList(int page, int limit){
		int startrow = (page-1)*10 + 1; // 읽기 시작할 row 번호
		int endrow = page*limit;
		
		Map<String, Integer> map =
				new HashMap<String, Integer>();
		map.put("startrow", startrow);
		map.put("endrow", endrow);
		List<CoBoardDTO> list = 
				this.sqlSession.selectList("coboard_list", map);		
		return list;
	}
	
	
	/* 게시판 조회수 증가*/
	public void coBoardHit(int coboard_no){
		this.sqlSession.update("coboard_hit", coboard_no);
	}
	
	
	/* 이미 저장된 사용자 IP 주소를 반환. */
	public String getStoredIp(userIPDTO useripdto){
		
		String storedip = null;
		
		storedip = this.sqlSession.selectOne("storeduserip", useripdto);		
		
		System.out.println("getStoredIp의 ip"+useripdto);
		System.out.println("getStoredIp의 storedip"+storedip);
		System.out.println("getStoredIp 메소드 여긴 반환 되나?");		

		
		return storedip;
	}
	
	/* 사용자 IP 주소 저장(중복 추천 비추천 방지용)*/
	public void storeIP(userIPDTO useripdto){
		this.sqlSession.update("useripstore", useripdto);
	}
	
	/* 게시판 본문 추천 증가*/
	public void coBoardRecommand(int coboard_no){
		this.sqlSession.update("coboard_recommendation", coboard_no);
	}
	
	/* 게시판 본문 비추천 증가*/
	public void coBoardOpposition(int coboard_no){
		this.sqlSession.update("coboard_opposition", coboard_no);
	}
	
	
	/* 게시판 내용 보기*/
	public CoBoardDTO getCoBoardCont(int coboard_no){
		CoBoardDTO bean;
		bean = (CoBoardDTO)this.sqlSession.selectOne("coboard_cont", coboard_no);
		
		return bean;
	}
	
	/*답변저장 */
	public void replyCoBoard(CoBoardDTO b){
		int coboard_ref = b.getCoboard_ref();
		int coboard_step = b.getCoboard_step();
		int coboard_level = b.getCoboard_level();
		
		Map<String, Integer> map =
				new HashMap<String, Integer>();
		map.put("coboard_ref", coboard_ref);		
		map.put("coboard_step", coboard_step);
		
		this.sqlSession.update("coboard_replUp", map);
		
		b.setCoboard_step(b.getCoboard_step()+1);
		b.setCoboard_level(b.getCoboard_level()+1);
		
		this.sqlSession.insert("coboard_replIn", b);
	}
	
	
	/* 게시물 수정*/
	public void editCoBoard(CoBoardDTO bean){
		this.sqlSession.update("coboard_edit", bean);
	}
	
	/* 게시물 삭제*/
	public void deleteCoBoard(int coboard_no){
		this.sqlSession.delete("coboard_del", coboard_no);
	}	
	
	/* 댓글 내용 목록으로 가져오기*/
	public List<CoBoardDTO> getCoBoardRpList(int coboard_ref){
		List<CoBoardDTO> rplist = this.sqlSession.selectList("coboard_recont", coboard_ref);		
		return rplist;
	}	
	
	/* 게시판 검색 게시물 수 */
	public int getFindListCount(String find_name, String find_field){
		int count = 0;
		if(find_field.equals("coboard_sort")){
			count = this.sqlSession.selectOne("coboardfind_cnt1", find_name);
		}else if(find_field.equals("coboard_title")){
			count = this.sqlSession.selectOne("coboardfind_cnt2", find_name);
		}else if(find_field.equals("coboard_name")){
			count = this.sqlSession.selectOne("coboardfind_cnt3", find_name);
		}else if(find_field.equals("coboard_cont")){
			count = this.sqlSession.selectOne("coboardfind_cnt4", find_name);
		}
		
		
		return count;
	}
	
	
	/* 최다 조회 글*/
	public List<CoBoardDTO> getCoBoardBestClick(){
		List<CoBoardDTO> bestclick = this.sqlSession.selectList("best_click");
		
		return bestclick;
	}
	
	/* 최다 추천 글*/
	public List<CoBoardDTO> getCoBoardBestReco(){
		List<CoBoardDTO> bestrecom = this.sqlSession.selectList("best_reco");
		
		return bestrecom;
	}
	
	/* 게시판 검색 목록 보기(JDBC) */ 
	public List<CoBoardDTO> getCoBoardSearchList(int page, int limit, 
			String find_name, String find_field){
		List<CoBoardDTO> list = new ArrayList<CoBoardDTO>();
		try{
			con = ds.getConnection();
			sql="select * from (select rownum as rnum, coboard_no, coboard_sort, coboard_name,"
		     + " coboard_title, coboard_cont, coboard_ref, coboard_step, coboard_level,"
		     + " coboard_hit, coboard_regdate "
			 + " from (select * from CoBoard where coboard_level = 0 order by coboard_ref" 
		     + " desc, coboard_step asc) where "+find_field+" like ? and rownum <= ?)"
		     + " where rnum >= ?";
		    pstmt=con.prepareStatement(sql);
			pstmt.setString(1, find_name); // 실인수값 -> "%"+find_name+"%"
			pstmt.setInt(2, page*limit);
			pstmt.setInt(3, ((page-1)*limit)+1);
			rs = pstmt.executeQuery();

			while(rs.next()){
				CoBoardDTO b = new CoBoardDTO();
				b.setCoboard_no(rs.getInt("coboard_no"));
				b.setCoboard_sort(rs.getString("coboard_sort"));
				b.setCoboard_name(rs.getString("coboard_name"));
				b.setCoboard_title(rs.getString("coboard_title"));
				b.setCoboard_cont(rs.getString("coboard_cont"));
				b.setCoboard_ref(rs.getInt("coboard_ref"));
				b.setCoboard_step(rs.getInt("coboard_step"));
				b.setCoboard_level(rs.getInt("coboard_level"));
				b.setCoboard_hit(rs.getInt("coboard_hit"));
				b.setCoboard_regdate(rs.getString("coboard_regdate").substring(0,10));				

		        list.add(b); //컬렉션에 요소값 추가		
			}	
			rs.close(); pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return list;		
	}
	
	
	
	
	/* 게시판 검색 목록 보기(mybatis) 
	public List<CoBoardDTO> getCoBoardSearchList(int page, int limit, String find_name, String find_field){
		List<CoBoardDTO> list;
		
		int pagelimit1 = page*limit;
		int pagelimit2 = ((page-1)*limit)+1;
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagelimit1", pagelimit1);
		map.put("pagelimit2", pagelimit2);
		map.put("find_name", find_name);
		
		System.out.println("pagelimit1 : "+map.get("pagelimit1"));
		System.out.println("pagelimit2 : "+map.get("pagelimit2"));
		System.out.println("fine_name : "+map.get("find_name"));
		
		//CoSearchDTO cosearch = new CoSearchDTO();
		//cosearch.setPagelimit1(pagelimit1);
		//cosearch.setPagelimit2(pagelimit2);
		//cosearch.setFind_name(find_name);
		
		//System.out.println("pagelimit1 : "+cosearch.getPagelimit1());
		//System.out.println("pagelimit2 : "+cosearch.getPagelimit2());
		//System.out.println("fine_name : "+cosearch.getFind_name());
		
		if(find_field.equals("coboard_sort")){
			System.out.println(find_field);
			System.out.println("여기까진 오나1");
			list = sqlSession.selectList("cobFinList1", map);
			return list;			
		}else if(find_field.equals("coboard_title")){
			list = sqlSession.selectList("cobFinList2", map);
			return list;
		}else if(find_field.equals("coboard_name")){
			list = sqlSession.selectList("cobFinList3", map);
			return list;
		}else if(find_field.equals("coboard_cont")){
			list = sqlSession.selectList("cobFinList4", map);
			return list;
		}
		System.out.println("여기까진 오나3");		
		return null;
		
	}
	*/
	
}
