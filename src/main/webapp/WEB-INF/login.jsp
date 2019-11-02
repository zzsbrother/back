<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
    <meta charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <meta name="keywords" content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
    <link href="${pageContext.request.contextPath}/css/style.css" rel='stylesheet' type='text/css' />
    <title>用户登录</title>

</head>
<body>
<script type="text/javascript">

</script>

<!--SIGN UP-->
<h1 style="font-family:'管理员登录'; color: #0e4277;">管理员登录</h1>
<div class="login-form">
    <div class="close"> </div>
    <div class="head-info">
        <label class="lbl-1"> </label>
        <label class="lbl-2"> </label>
        <label class="lbl-3"> </label>
    </div>
    <div class="clear"> </div>
    <div class="avtar">
        <img src="${pageContext.request.contextPath}/images/avtar.png" />
    </div>

    <form action="${pageContext.request.contextPath}/user/gologin" method="post">


        <input type="text" class="text"
               name="username"
               id="usernames"
               value="${cookie.username1.value}">
        <div class="key">
            <input type="password"  name="password" id="password" value="${cookie.password1.value}">
        </div>
        <input type="checkbox" class="text" id="remembers" name="remenber" checked="checked" value="1" /><i style="color:#9199aa;">一周内免登陆</i>
        <div class="signin">
            <input type="submit" value="Login" >
        </div>
    </form>
</div>
<div class="copy-rights">
    <p>Copyright &copy; 2015.Company name All rights reserved.More Templates <a href=# target="_blank" title="#">#</a> - Collect from <a href=# title=# target="_blank">#</a></p>
</div>

</body>
</html>
