<%--
  Created by IntelliJ IDEA.
  User: 徐梦云
  Date: 2021/3/14
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="register">
    username :<input type="text" name="username" style="color:deeppink;background:pink"/><br/>
    password :<input type="password" name="password"style="color:deeppink;background:pink"/><br/>
    email :<input type="text" name="email"style="color:deeppink;background:pink"/><br/>
    Gender:<input type="radio" name="gender" value="male">Male <input type="radio" name="gender" value="female">Female<br/>
    Date of birth :<input type="date" name="birthDate"  placeholder="Date of birth(yyyy-mm-dd)" style="color:deeppink;background:pink"/><br/>
    <input type="submit" value="Register"style="color:deeppink"/>
    
</form>
</body>
</html>
