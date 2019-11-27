<%@ page contentType="text/html; charset=gb2312" import="java.sql.*" %>
<%
	boolean flag=false;              //设置登陆成功或失败的标记
%>
<html>
<head>
	<title>登陆验证</title>
</head>
<body>

<%
	//接收表单参数
	String userid=request.getParameter("userid");
	String password=request.getParameter("password");
	
	//加载数据库驱动
	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	}catch(ClassNotFoundException e){
		out.print(e);
	}
	
	try{
			//获取当前站点的绝对路径
		String strDirPath=getServletContext().getRealPath("/");   
			//将“\”替换为“/”  即：D:/WebTest
		strDirPath=strDirPath.replace('\\','/');  
			//数据库连接字符串
		String url = "jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ="+strDirPath+"student.mdb";
    
			//建立ODBC数据源连接
		Connection conn = DriverManager.getConnection(url);
			//创建查询数据库的对象
		Statement stmt=conn.createStatement();   	
		String sql ="SELECT * FROM tb_denglu";
			//得到表tb_denglu查询的结果集
		ResultSet rs=stmt.executeQuery(sql);
			
			while(rs.next()){
				String n=rs.getString("name");
				String p=rs.getString("password");
				
				if(userid.equals(n)&&password.equals(p)){
					flag=true;
				}
			}
		
		rs.close();
		stmt.close();
		conn.close();
	}catch(Exception ex){	}
%>
<%
	if(flag){
%>
	<jsp:forward page="ok.jsp"/>
%>
<%
	}else{
%>
	<jsp:forward page="no.jsp"/>
<%	
	}
%>	

</body>
</html>