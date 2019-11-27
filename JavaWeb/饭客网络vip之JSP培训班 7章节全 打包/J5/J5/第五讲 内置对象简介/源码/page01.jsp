<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*"%>

<%
	pageContext.setAttribute("name","心魔");
	pageContext.setAttribute("date",new Date());
%>

<h1>姓名：<%=pageContext.getAttribute("name")%></h1>
<br>
<h1>日期：<%=pageContext.getAttribute("date")%></h1>