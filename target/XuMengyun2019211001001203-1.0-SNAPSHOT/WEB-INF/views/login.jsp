<%--
  Created by IntelliJ IDEA.
  User: 徐梦云
  Date: 2021/3/31
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@include file="header.jsp"%>
<form method="post" action="login">
    <body>
    <h2>Login</h2>
    <%
        if(!(request.getAttribute("message")==null)) {
            out.println("<h3>"+request.getAttribute("message")+"<h3>");
        }
    %>
    <%
        Cookie[] allCookies=request.getCookies();
        String username = "",password="",rememerMeVal="";
        if(allCookies != null) {
            for(Cookie c:allCookies) {
                if(c.getName().equals("cUsername")) {
                    username=c.getValue();
                }
                if(c.getName().equals("cPassword")) {
                    password=c.getValue();
                }if(c.getName().equals("rememberMeVal")) {
                    rememerMeVal=c.getValue();
                }
            }
        }
    %>
<br/>
    <br/>
    username :<input type="text" name="username" style="color:deeppink;background:pink" value="<%=username%>"/><br/>
    password :<input type="password" name="password"style="color:deeppink;background:pink" value="<%=password%>"/><br/>
    <input type="checkbox" name="rememberMe" value="1" <%= rememerMeVal.equals("1")?"checked":""%>/>Remember Me<br/>
    <input type="submit" value="Login"style="color:deeppink"/>

</body>
</form>
<%@include file="footer.jsp"%>