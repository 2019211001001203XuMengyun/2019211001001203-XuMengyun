<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="header.jsp"%>
<h1><%= "Welcome to my home page." %>
</h1>
<br/>
<form method="get" target="_blank" action="search">
    <input type="text" name="txt" size="50">
    <select name="search">
        <option value="baidu">Baidu</option>
        <option value="bing">Bing</option>
        <option value="google">Google</option>
    </select>
    <input type="submit" value="Search">
</form>
<%@include file="footer.jsp"%>
