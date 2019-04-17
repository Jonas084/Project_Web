package spring.fin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.fin.model.CoffeePostscriptDTO;

@Repository
public class CoffeePostscriptDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	DataSource ds=null;
	String sql=null;
	
	public CoffeePostscriptDAO(){
		try{
	      Context ctx=new InitialContext();
	      ds=(DataSource)ctx.lookup("java:comp/env/jdbc/xe");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public int postCount(){
		int n=sqlSession.selectOne("post_count");
		return n+1;
	}
	
	public void insert(CoffeePostscriptDTO post){
		sqlSession.insert("insert_post",post);
		
	}
	public List<CoffeePostscriptDTO> selectPost(int coffee_number){
		List<CoffeePostscriptDTO> polist;
		polist=sqlSession.selectList("post_select",coffee_number);
		return polist;
	}
}
