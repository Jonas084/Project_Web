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

import spring.fin.model.BasketDTO;

@Repository
public class BasketDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	DataSource ds=null;
	String sql=null;
	
	public BasketDAO(){
		try{
	      Context ctx=new InitialContext();
	      ds=(DataSource)ctx.lookup("java:comp/env/jdbc/xe");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void insertBasket(String id, int coffee_number){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userID",id);
		map.put("coffee_number",coffee_number);
		sqlSession.update("insert_basket",map);
	}
	public List<BasketDTO> selectBasket(String id){
		List<BasketDTO> list;
		list=sqlSession.selectList("select_basket",id);
		return list;
	}
	
	public void deleteBasket(int i){
		sqlSession.delete("delete_basket",i);
	}
	//커피넘버겟
	public int coffeeNumberGet(int i){
		return sqlSession.selectOne("select_basket_coffeeN", i);
	}
}
