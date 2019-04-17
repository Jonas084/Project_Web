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
import spring.fin.model.SearchCriteriaDTO;

@Repository
public class SearchDAOImpl{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	DataSource ds=null;
	String sql=null;
	
	public SearchDAOImpl(){
		try{
	      Context ctx=new InitialContext();
	      ds=(DataSource)ctx.lookup("java:comp/env/jdbc/xe");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public List<CoffeePostscriptDTO> title(SearchCriteriaDTO title, SearchCriteriaDTO keyword){
		List<CoffeePostscriptDTO> list;
		list=sqlSession.selectList("title", title);//xml파일의 id와 para값 가져옴
		list=sqlSession.selectList("title", keyword);
		System.out.println(list);
		return list;
	}
	public List<CoffeePostscriptDTO> content(SearchCriteriaDTO content, SearchCriteriaDTO keyword){
		List<CoffeePostscriptDTO> list ;
		list=sqlSession.selectList("content", content);
		list=sqlSession.selectList("content", keyword);
		System.out.println(list);
		return list;
	}
	public List<CoffeePostscriptDTO> writer(SearchCriteriaDTO writer, SearchCriteriaDTO keyword){
		List<CoffeePostscriptDTO> list;
		list=sqlSession.selectList("writer", writer);
		list=sqlSession.selectList("writer", keyword);
		System.out.println(list);
		return list;
	}
	public Object all(CoffeePostscriptDTO keyword) {
		List<CoffeePostscriptDTO> list ;
		list=sqlSession.selectList("all", keyword);
		System.out.println("list가지고 드디어 돌아옴ㅠㅠ"+list);
		return list;
	}
}
