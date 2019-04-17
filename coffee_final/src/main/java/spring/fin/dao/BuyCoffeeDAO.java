package spring.fin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.fin.model.BuyRecordDTO;
import spring.fin.model.CoffeeInformationDTO;

@Repository
public class BuyCoffeeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	DataSource ds=null;
	String sql=null;
	
	public BuyCoffeeDAO(){
		try{
	      Context ctx=new InitialContext();
	      ds=(DataSource)ctx.lookup("java:comp/env/jdbc/xe");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void insertCoffeeRecord(String id, int quantity,CoffeeInformationDTO list){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userID",id);
		map.put("buy_count", quantity);
		map.put("coffee_number",list.getCoffee_number());
		map.put("buy_price",list.getPrice());
		sqlSession.insert("insert_coffeerecord",map);
	}
	//특정커피 주문했는지 체크
	public int searchId(String writer,int coffee_number){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userID",writer);
		map.put("coffee_number", coffee_number);
		return sqlSession.selectOne("buy_count", map);
	}
	
	//사용자 구매내역 가져오기
	public List<BuyRecordDTO> recordGet(String id){
		List<BuyRecordDTO> list;
		list=sqlSession.selectList("buy_record_get",id);
		return list;
	}
	//장바구니 결제 구매이력넣기
	public void insertCoffeeRecordB(String id,int coffee_number,int totalp,int count){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userID",id);
		map.put("coffee_number", coffee_number);
		map.put("buy_price", totalp);
		map.put("buy_count", count);
		sqlSession.insert("insert_coffeerecord",map);
		
		
	}
}
