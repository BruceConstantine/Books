<%@ page contentType="text/html; charset=gb2312" import="java.sql.*" %>
<%
	boolean flag=false;              //���õ�½�ɹ���ʧ�ܵı��
%>
<html>
<head>
	<title>��½��֤</title>
</head>
<body>

<%
	//���ձ�����
	String userid=request.getParameter("userid");
	String password=request.getParameter("password");
	
	//�������ݿ�����
	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	}catch(ClassNotFoundException e){
		out.print(e);
	}
	
	try{
			//��ȡ��ǰվ��ľ���·��
		String strDirPath=getServletContext().getRealPath("/");   
			//����\���滻Ϊ��/��  ����D:/WebTest
		strDirPath=strDirPath.replace('\\','/');  
			//���ݿ������ַ���
		String url = "jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ="+strDirPath+"student.mdb";
    
			//����ODBC����Դ����
		Connection conn = DriverManager.getConnection(url);
			//������ѯ���ݿ�Ķ���
		Statement stmt=conn.createStatement();   	
		String sql ="SELECT * FROM tb_denglu";
			//�õ���tb_denglu��ѯ�Ľ����
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