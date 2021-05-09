<%--
  Created by IntelliJ IDEA.
  User: 徐梦云
  Date: 2021/4/24
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="header.jsp" %>
<head>
    <title>register</title>
    <script>
        function isPasswordValid() {
            var psw=document.getElementById("psw").value;
            if(psw.length<8) {
                alert("password lenth less than 8:，"+psw.length+"/8");
                document.getElementById("psw").style.color="red";
                return false;
            }
            document.getElementById("psw").style.color="green";
            return true;
        }
        function isMailValid(){
            var x=document.getElementById("email").value;
            var atpos=x.indexOf("@");
            var dotpos=x.lastIndexOf(".");
            if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length){
                alert("e-mail format wrong");
                document.getElementById("email").style.color="red";
                return false;
            }
            document.getElementById("email").style.color="green";
            return true;
        }
        function isDateValid() {
            var obj=document.getElementById("birthdate");
            var strDate = obj.value;
            console.log(strDate+"-<")
            var re = /^(\d{4})-(\d{2})-(\d{2})$/;
            if (re.test(strDate))//判断日期格式符合YYYY-MM-DD标准
            {
                var dateElement = new Date(RegExp.$1, parseInt(RegExp.$2, 10) - 1, RegExp.$3);
                if (!((dateElement.getFullYear() == parseInt(RegExp.$1)) && ((dateElement.getMonth() + 1) == parseInt(RegExp.$2, 10)) && (dateElement.getDate() == parseInt(RegExp.$3))))//判断日期逻辑
                {
                    alert("You can only input Date.(YYYY-MM-DD) !");
                    document.getElementById("birth").style.color="red";
                    return false;
                }
            } else {
                alert("You can only input Date.(YYYY-MM-DD)!");
                document.getElementById("birthdate").style.color="red";
                return false;
            }
            document.getElementById("birthdate").style.color="green";
            return true;
        }
        function checkAll() {
            if(isDateValid()&&isMailValid()&&isPasswordValid()&&document.getElementById("username").value!=null&&document.getElementById("gender").value!=null) {
                alert("update complete")
                return true;
            }
            alert("update failed")
            return false;
        }
    </script>
</head>
<body>
<h1>User update!</h1>
<form action="updateUser" method="post" onsubmit="checkAll()">
    <input type="hidden" id="id" name="id" value="<%=user.getID()%>">
    Username:<input type="text" id="username" name="username" value="<%=user.getUsername()%>"><br>
    Password:<input type="text" id="psw" name="password" onchange="isPasswordValid()" value="<%=user.getPassword()%>"><br>
    E-mail:<input type="email" id="email" name="email" onchange="isMailValid()" value="<%=user.getEmail()%>"><br>
    Gender:<input type="radio" name="gender" value="male" <%=user.getGender().trim().equals("male")?"checked":""%>>male
    <input type="radio" name="gender" value="female" <%=user.getGender().trim().equals("female")?"checked":""%>>female<br>
    Birth:<input type="text" id="birthdate" name="birthdate" onchange="isDateValid()" value="<%=user.getBirthdate()%>"><br>
    <input type="submit" value="Update">
</form>
</body>
</html>
<%@ include file="footer.jsp"%>
