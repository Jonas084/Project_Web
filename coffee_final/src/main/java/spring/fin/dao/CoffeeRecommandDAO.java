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

import spring.fin.model.CoffeeInformationDTO;
import spring.fin.model.CoffeeTasteDTO;
@Repository
public class CoffeeRecommandDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	DataSource ds=null;
	String sql=null;
	
	public CoffeeRecommandDAO(){
		try{
	      Context ctx=new InitialContext();
	      ds=(DataSource)ctx.lookup("java:comp/env/jdbc/xe");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public List<CoffeeInformationDTO> selectRecommand(CoffeeTasteDTO taste){
		List<CoffeeInformationDTO> list;
		list=sqlSession.selectList("select_recommand",taste);
		return list;
	}
	public List<CoffeeInformationDTO> selectRecommandBest(CoffeeTasteDTO taste){
		List<CoffeeInformationDTO> list;
		list=sqlSession.selectList("select_recommandbest",taste);
		return list;
	}
	public List<CoffeeInformationDTO> selectRecommandLow(CoffeeTasteDTO taste){
		List<CoffeeInformationDTO> list;
		list=sqlSession.selectList("select_recommandlowprice",taste);
		return list;
	}
	public List<CoffeeInformationDTO> selectRecommandHigh(CoffeeTasteDTO taste){
		List<CoffeeInformationDTO> list;
		list=sqlSession.selectList("select_recommandhighprice",taste);
		return list;
	}
	//이미지
	public String mainimgGet(int n){
		return sqlSession.selectOne("main_img_get",n);
	}
	public String imgaGet(int n){
		return sqlSession.selectOne("imga_get",n);
	}
	public String nameGet(int n){
		return sqlSession.selectOne("name_get",n);
	}
	public int priceGet(int n){
		return sqlSession.selectOne("price_get",n);
	}
		
}
