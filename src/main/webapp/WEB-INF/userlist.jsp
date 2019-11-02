<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="icon" type="${pageContext.request.contextPath}/image/png"
          href="img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>管理页面</title>

    <meta
            content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
            name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
          rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="${pageContext.request.contextPath}/css/animate.min.css"
          rel="stylesheet" />

    <!--  Light Bootstrap Table core CSS    -->
    <link
            href="${pageContext.request.contextPath}/css/light-bootstrap-dashboard.css"
            rel="stylesheet" />


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${pageContext.request.contextPath}/css/demo.css"
          rel="stylesheet" />


    <!--     Fonts and icons     -->

    <link href="${pageContext.request.contextPath}/css/pe-icon-7-stroke.css"
          rel="stylesheet" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[name='updata']").click(function () {
                var uid=$(this).parent().children("[name='uid']").val();
                var statics =$(this).parent().prev().children("[name='statics']").val();
                var oldstate=$(this).next().val();
                alert(oldstate)
                if(oldstate==statics){
                    return;
                }
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/updata",
                    data:{
                        "uid":uid,
                        "statics":statics
                    },
                    dataType:"text",
                    success:function (data) {
                        if(data=="ok"){
                            alert("修改成功")
                        }
                    }
                })
            })
        })
    </script>
</head>
<body>

<div class="wrapper">




    <%@include file="left.jsp"%>


    <div class="main-panel">

        <%@include file="head.jsp"%>



        <div class="content">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">用户管理</h4>
                                <p class="category">Here is a subtitle for this table</p>
                                <form action="${pageContext.request.contextPath}/user/userlist" method="post">
                                    <div style="float:left;  width: 130px;">
                                        <input type="hidden" name="skip" value="selUser">
                                        <input type="hidden" name="pagenow" value="1">
                                    </div>
                                    <div style="float:left; margin:0 2px; width: 130px;">
                                        <input type="text" class="form-control" placeholder="查询姓名" size=8  name="uname"  value="${uname}">
                                    </div>
                                    <div style="float:left; margin:0 2px; width: 65px;">
                                        <button type="submit"  class="btn btn-info btn-fill pull-right">查询</button>
                                    </div>
                                </form>

                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                    <th>ID</th>
                                    <th>用户名</th>
                                    <th>真实姓名</th>
                                    <th>邮箱</th>
                                    <th>电话</th>
                                    <th>地址</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${page.users}" var="u" >
                                        <tr  height="35px">
                                            <td>${u.uid}</td>
                                            <td>${u.username}</td>
                                            <td>${u.name}</td>
                                            <td>${u.email}</td>
                                            <td>${u.phone}</td>
                                            <td>${u.addr}</td>
                                            <td>
                                                <select id="orderbynum" name="statics" class="form-control" style="width: 130px;">
                                                    <c:if test="${u.state==1}">
                                                        <option selected="selected" value="1">普通用户</option>
                                                        <option value="2">违规用户</option>
                                                    </c:if>
                                                    <c:if test="${u.state!=1}">
                                                        <option value="1">普通用户</option>
                                                        <option selected="selected" value="2">违规用户</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                            <td style="font-size: 12px">
                                                <input type="hidden" name="uid" value="${u.uid}">
                                                <a href="#" name="updata">修改</a>
                                                <input type="hidden" value="${u.state}">
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                            </div>
                            <div style=" margin: 0 0 0px 50px;padding:0 0 20px 0; width: 70%;">

                                <%--分页--%>
                                <div style=" margin: 0 0 0px 50px;padding:0 0 20px 0; width: 70%;">
                                    <c:if test="${page.total!=0}">
                                    <c:if test="${page.paging.lastone!=0}">
                                        <a href="${pageContext.request.contextPath}/user/userlist?uname=${page.username}">【1】</a>&nbsp;&nbsp;
                                        <a href="${pageContext.request.contextPath}/user/userlist?uname=${page.username}">【...】</a>&nbsp;&nbsp;
                                    </c:if>
                                    <c:forEach items="${page.paging.groupList}" var="i">
                                        <c:if test="${i==page.pagenow}">
                                            <a style="color: red" href="${pageContext.request.contextPath}/user/userlist?uname=${page.username}">【${i}】</a>&nbsp;&nbsp;
                                        </c:if>
                                        <c:if test="${i!=page.pagenow}">
                                            <a href="${pageContext.request.contextPath}/user/userlist?uname=${page.username}">【${i}】</a>&nbsp;&nbsp;
                                        </c:if>


                                    </c:forEach>
                                    <c:if test="${page.paging.next!=0}">
                                        <a href="${pageContext.request.contextPath}/user/userlist?uname=${page.username}">【...】</a>&nbsp;&nbsp;
                                        <a href="${pageContext.request.contextPath}/user/userlist?uname=${page.username}">【${page.totalpage}】</a>&nbsp;&nbsp;
                                    </c:if>

                                    <div>
                                            <%--<form method="post" action="${pageContext.request.contextPath}/product/proList">
                                                <div >
                                                    <input type="number" id="goPage" name="goPage" value="${goPage}"/>页
                                                </div>
                                                <input type="hidden" name="cid1" value="0">
                                                <input type="hidden" name="csid1" value="0">
                                                <input type="hidden" id="productName" name="productName">
                                                <button type="submit" id="go" class="f-l" onclick="goPages()">确定</button>
                                            </form>--%>
                                        </c:if>
                                    </div>








                                </div>

                                <form action="manage/SkipAction?skip=selUser&selname=&selDep=-1" method="post">
                                    <div style=" float: right; margin:-50px 80px 0 0; width: 60px; height: 40px">
                                        <input type="number" id="skipNum" class="form-control" placeholder="页面" size=2  name="pageNow" >
                                    </div>
                                    <div style="float: right; margin:-50px 10px 0 0; width: 60px; height: 40px">
                                        <button type="submit" id="skipBut"  class="btn btn-info btn-fill pull-right">跳转</button>
                                    </div>
                                </form>


                            </div>
                        </div>














                    </div>

                    <footer class="footer">
                        <div class="container-fluid">
                            <nav class="pull-left">
                                <ul>
                                    <li>
                                        <a href="#">
                                            浏览效果界面
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            Company
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://localhost:8080/">
                                            Tomcat管理页
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            微博
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                            <p class="copyright pull-right">
                                &copy; 2017  当前累计登陆访问次数 ： <a href="#" target="_blank" title="联系我们"> 623</a> - 统计来自 <a href="#" title="爱尚实训" target="_blank">爱尚教育</a>
                            </p>
                        </div>
                    </footer>
                </div>
            </div>
        </div>
    </div>


</body>

<!--   Core JS Files   -->
<script src="js/jquery-1.10.2.js"
        type="text/javascript"></script>
<script src="js/bootstrap.min.js"
        type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script
        src="js/bootstrap-checkbox-radio-switch.js"></script>

<!--  Charts Plugin -->
<script src="js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="js/bootstrap-notify.js"></script>


<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script
        src="js/light-bootstrap-dashboard.js"></script>

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src="js/demo.js"></script>


</html>
