<%@ page contentType="text/html; charset=gb2312" import="java.sql.*" %>
<html>
<head>
<title>ACCESS���Ӳ���</title>
</head>

<body>

<%
	try{
	
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		
	}catch(ClassNotFoundException e){
	
		out.print(e);
	}
	
	//�������ݿ�
	try{
    
	//��ȡ��ǰվ��ľ���·��
	String strDirPath=getServletContext().getRealPath("/");   
	  
	//����\���滻Ϊ��/��  ����D:/WebTest
	strDirPath=strDirPath.replace('\\','/');  
	
	//���ݿ������ַ���
	String url = "jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ="+strDirPath+"student.mdb";
  
  
	//����ODBC����Դ����
	Connection conn = DriverManager.getConnection(url);
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("SELECT * FROM chengjibiao");              //ȡ��chengjibiao���еļ�¼
	
	out.println("ѧ��\t����"+"<br>");
	
	//�����ѯ���
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