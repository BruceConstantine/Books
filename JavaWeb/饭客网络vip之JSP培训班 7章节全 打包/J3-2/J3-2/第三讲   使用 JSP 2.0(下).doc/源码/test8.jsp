<%@page contentType="text/html; charset=GB2312"%>
  

<h1>这是主页面</h1>

<jsp:include page="content.jsp">

<jsp:param name="aa" value="Hello  World"/>
<jsp:param name="bb" value="www.baidu.com"/>

</jsp:include>