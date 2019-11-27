<%!
     //定义方法
     public static int add(int  i,  int  j){
	return i+j;
     }
     public String name = "心魔";
%>

<h1>  <%=  add(20,30) %>  </h1>
<h1>  <%=  name %>  </h1>
<h1>  <%=  "我是直接被输出的字符串" %>  </h1>