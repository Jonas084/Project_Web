package spring.fin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.activation.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.fin.model.CoffeeArticleDTO;

@Repository
public class CoffeeArticleDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<CoffeeArticleDTO> selectArticle(){
		List<CoffeeArticleDTO> list;
		list=sqlSession.selectList("select_article");
		return list;
	}
	

	
}
