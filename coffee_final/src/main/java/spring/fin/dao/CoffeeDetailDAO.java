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

import spring.fin.model.CoffeeInformationDTO;

@Repository
public class CoffeeDetailDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	DataSource ds=null;
	String sql=null;
	
	public CoffeeDetailDAO(){
		try{
	      Context ctx=new InitialContext();
	      ds=(DataSource)ctx.lookup("java:comp/env/jdbc/xe");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void plusCount(CoffeeInformationDTO list){
		list.setClick_count(list.getClick_count()+1);
		sqlSession.update("update_count",list);
	}
	public CoffeeInformationDTO selectDetail(int coffee_number){
		CoffeeInformationDTO list;
		list=sqlSession.selectOne("select_detail",coffee_number);
		return list;
	}
}
