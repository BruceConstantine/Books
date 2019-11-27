<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*"%>
<%
	request.setAttribute("name","ÐÄÄ§");
	request.setAttribute("date",new Date());
%>
<jsp:forward page="request02.jsp"/>