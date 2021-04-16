<%--
  Created by IntelliJ IDEA.
  User: 徐梦云
  Date: 2021/3/31
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@include file="header.jsp"%>
<form method="post" action="login">
    <h2>Login</h2>
    <%
        if(!(request.getAttribute("message")==null)) {
            out.println("<h3>"+request.getAttribute("message")+"<h3>");
        }
    %>
<br/>
    <br/>
    username :<input type="text" name="username" style="color:deeppink;background:pink"/><br/>
    password :<input type="password" name="password"style="color:deeppink;background:pink"/><br/>
    <input type="submit" value="Login"style="color:deeppink"/>
</form>
<%@include file="footer.jsp"%>