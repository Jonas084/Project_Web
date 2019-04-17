package spring.fin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.fin.model.MemberDTO;

@Repository
public class MemberDAOImpl {
		
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	DataSource ds=null;
	String sql=null;
	
	public MemberDAOImpl(){
		try{
	      Context ctx=new InitialContext();
	      ds=(DataSource)ctx.lookup("java:comp/env/jdbc/xe");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public MemberDTO idCheck(String id){
		System.out.println("DAO = " + id);
		MemberDTO bean = null;
		bean = sqlSession.selectOne("member_idcheck", id);
		System.out.println("받아옴");
		return bean;
	}
	
	/*우편번호 검색
	public List<ZipcodeBean2> findZipcode(String dong) 
	throws SQLException{
		List<ZipcodeBean2> list=this.template.queryForList("zipcodeList",dong);
		return list;
	} */

	/*중복 아이디 검색
	public SpringMemberBean idSearch(String mem_id) throws SQLException{
		SpringMemberBean db_id=null;
		db_id=(SpringMemberBean)this.template.queryForObject(
				"id_search",mem_id);
		return db_id;
	}*/

	/*회원 저장
	public int insertMember(SpringMemberBean m){
		int re=0;
		try {
			this.template.insert("memInsert",m);
			re=1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return re;
	}*/
	/* 비번 찾기 
	public SpringMemberBean findPwd(SpringMemberBean bean){
		SpringMemberBean b = null;
		b=(SpringMemberBean)this.template.queryForObject("pwd_find",bean);
		return b;
	}*/
	/* 정보 수정 
	public void editMember(SpringMemberBean bean){
		this.template.update("memEdit",bean);
	}*/
	/*회원 탈퇴 
	public void delMem(SpringMemberBean bean){
		this.template.update("memDEL",bean);
	}*/
	
	public MemberDTO memSelect(String id){
		MemberDTO dto;
		dto=sqlSession.selectOne("member_select", id);
		return dto;
	}
	//포인트 사용
	public void pointUpdate(String id,int remain){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userID",id);
		map.put("userPoint", remain);
		sqlSession.update("update_point",map);
	}
	//후기 포인트
	public void plusPoint(String writer){
		sqlSession.update("plus_postpoint",writer);
	}
	//포인트정보획득
	public int userPointGet(String id){
		return sqlSession.selectOne("member_point_get",id);
	}
	//쿠폰 포인트추가
	public void addPoint(String id,int price){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userID",id);
		map.put("userPoint", price);
		sqlSession.update("plus_coupon_point",map);
	}
	//장바구니결제
	public void usePoint(String id,int totalprice){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userID",id);
		map.put("totalPrice", totalprice);
		sqlSession.update("update_point_use",map);
	}
	
}
