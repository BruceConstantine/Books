<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*"%>
<%
	session.setAttribute("name","��ħ");
	session.setAttribute("date",new Date());
%>
<jsp:forward page="session02.jsp"/>