<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*"%>

<%
	pageContext.setAttribute("name","��ħ");
	pageContext.setAttribute("date",new Date());
%>

<h3><jsp:forward page="page03.jsp"/></h3>