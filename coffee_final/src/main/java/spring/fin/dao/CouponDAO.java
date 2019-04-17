package spring.fin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	DataSource ds=null;
	String sql=null;
	
	public CouponDAO(){
		try{
	      Context ctx=new InitialContext();
	      ds=(DataSource)ctx.lookup("java:comp/env/jdbc/xe");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public int couponCheck(String couponNum){
		return sqlSession.selectOne("coupon_check",couponNum);
	}
	//쿠폰가격정보획득
	public int couponPriceGet(String couponNum){
		return sqlSession.selectOne("coupon_price_get",couponNum);
	}
	//쿠폰 삭제
	public void deleteCoupon(String couponNum){
		sqlSession.delete("delete_coupon",couponNum);
	}
}
