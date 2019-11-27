<%@ page contentType="text/html; charset=gb2312" import="java.sql.*" %>
<html>
<head>
<title>ACCESS连接测试</title>
</head>

<body>

<%
	try{
	
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		
	}catch(ClassNotFoundException e){
	
		out.print(e);
	}
	
	//连接数据库
	try{
    
	//获取当前站点的绝对路径
	String strDirPath=getServletContext().getRealPath("/");   
	  
	//将“\”替换为“/”  即：D:/WebTest
	strDirPath=strDirPath.replace('\\','/');  
	
	//数据库连接字符串
	String url = "jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ="+strDirPath+"student.mdb";
  
  
	//建立ODBC数据源连接
	Connection conn = DriverManager.getConnection(url);
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("SELECT * FROM chengjibiao");              //取得chengjibiao表中的记录
	
	out.println("学号\t姓名"+"<br>");
	
	//输出查询结果
	while(rs.next()){
	
    out.print(rs.getInt(1)+"\t");
    out.print(rs.getString(2)+"<br>");
    
	}
  
	rs.close();
	stmt.close();
	conn.close();
	
	}catch(Exception ex){
	
		out.print(ex);
	}
	
%>

</body>
</html>