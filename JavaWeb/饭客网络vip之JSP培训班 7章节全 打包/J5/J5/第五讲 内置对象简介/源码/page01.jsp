<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*"%>

<%
	pageContext.setAttribute("name","��ħ");
	pageContext.setAttribute("date",new Date());
%>

<h1>������<%=pageContext.getAttribute("name")%></h1>
<br>
<h1>���ڣ�<%=pageContext.getAttribute("date")%></h1>