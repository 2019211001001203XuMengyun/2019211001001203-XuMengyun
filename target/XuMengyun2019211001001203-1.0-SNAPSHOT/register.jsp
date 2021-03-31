<%--
  Created by IntelliJ IDEA.
  User: 徐梦云
  Date: 2021/3/14
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@include file="header.jsp"%>
<form method="post" action="register">
    <h2>This is my register JSP page.</h2>
<br/>
    <br/>
    id :<input type="text" name="id" style="color:deeppink;background:pink"/><br/>
    username :<input type="text" name="username" style="color:deeppink;background:pink"/><br/>
    passwork :<input type="password" name="passwork"style="color:deeppink;background:pink"/><br/>
    email :<input type="text" name="email"style="color:deeppink;background:pink"/><br/>
    Gender:<input type="radio" name="gender" value="male">Male <input type="radio" name="gender" value="female">Female<br/>
    Date of birth :<input type="date" name="birthdate"  placeholder="Date of birth(yyyy-mm-dd)" style="color:deeppink;background:pink"/><br/>
    <input type="submit" value="Register"style="color:deeppink"/>
</form>

<%@include file="footer.jsp"%>

