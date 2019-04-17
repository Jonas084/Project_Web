<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
try{ 
	String driver = "oracle.jdbc.driver.OracleDriver"; 
	Class.forName(driver); 
	System.out.println("드라이버 로딩 성공"); 
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
	String username = "scott"; 
	String password = "tiger"; 
	Connection con = DriverManager.getConnection(url, username, password); 
	System.out.println("DB 연결 성공!"); 
	
	Statement st = con.createStatement(); 
	
	String sql1 = "update coffee_postscript set click_count = click_count+1 where board_number="+request.getParameter("num"); 
		
	//5. 데이터 넣고, 불러오기 
	st.executeUpdate(sql1); //데이터 넣기 
	String sql2="select click_count from coffee_postscript where board_number="+request.getParameter("num"); //명령문 추가할 때 마다 변수명을 달리해줘야한다! 
	ResultSet rs = st.executeQuery(sql2); 
	int n1;
	while(rs.next()){ 
		System.out.println("반복들어옴");      
	    n1 = rs.getInt("click_count"); 
	    System.out.println(n1); 
	    
	    out.write(" "+n1);  //데이터를 요청하는 클라이언트에게 보내준다. 
	} 

	System.out.println("오라클 프로그램 실행"); 
	
	st.close(); 
	con.close(); 
	
	}catch(Exception e){ 
		System.out.println(e+" : 예외가 발생했습니다."); 
} 
%>
${n1}

