<%@ page contentType="text/html;charset=GBK" %>
<%@page import="java.util.*"%>
<%
	request.setAttribute("name","��ħ");
	request.setAttribute("date",new Date());
%>
<jsp:forward page="request02.jsp"/>