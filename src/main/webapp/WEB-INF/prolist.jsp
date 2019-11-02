<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="icon" type="${pageContext.request.contextPath}/image/png" href="img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>管理页面</title>

    <meta
            content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
            name='viewport' />
    <meta name="viewport" content="width=device-width" />


<%--<script type="text/javascript">
        $(function () {
            alert("ok")
            var cid=$("[name='cid']");
            alert(cid)
            cid.onchange(function () {
                alert("ok")
                cid=cid.val();
                alert(cid)
                $.ajax({
                    url:"${pageContext.request.contextPath}/category/getCategorySecond",
                    data:{
                        "cid":cid,
                    },
                    dataType:"text",
                    success:function (data) {

                    }
                })
            })
        })
    </script>&ndash;%&gt;--%>

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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            /*alert("123");*/
            var csid=$("#CategorySecond");
            var cids=$("#Category option:selected").val();
            /*alert(cids)*/
            $.ajax({
                url:"${pageContext.request.contextPath}/getCategorySecond",
                data:{
                    "cids":cids
                },
                dataType:"json",
                success:function (data) {
                    csid.empty();
                    csid.append("<option value='-1'>二级类目</option>")
                    x=${csid};
                    /*alert(x)*/
                    console.log(data)
                    var arr = data;
                    for(var x in arr){
                        if(x==arr[x].csid){
                            csid.append("<option selected = 'selected' value='"+arr[x].csid+"'>"+arr[x].csname+"</option>")
                        }else {
                            csid.append("<option value='" + arr[x].csid + "'>" + arr[x].csname + "</option>")
                        }
                    }
                }
            });
           $("#Category").change(function () {
                var options=$("#Category option:selected");
                var cids=options.val();
                $.ajax({
                    url:"${pageContext.request.contextPath}/getCategorySecond",
                    data:{
                        "cids":cids
                    },
                    dataType:"json",
                    success:function (data) {
                        csid.empty();
                        csid.append("<option value='-1'>二级类目</option>")
                        console.log(data)
                        var arr = data;
                        for(var x in arr){

                                csid.append("<option  value='"+arr[x].csid+"'>"+arr[x].csname+"</option>")

                        }
                    }
                });
            })
        });
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
                                <h4 class="title">商品管理</h4>
                                <p class="category">Here is a subtitle for this table</p>
                                <form action="${pageContext.request.contextPath}/product/proList?pagenow=1" method="get">
                                    <div style="float:left;  width: 130px;">
                                    <input type="hidden" name="skip" value="selUser">
                                    <select id="Category" name="cid" class="form-control" style="width: 130px;">
                                        <option  value="-1" >一级类目
                                        </option>
                                        <c:forEach items="${categoryList}" var="c" varStatus="i">
                                            <option  <c:if test="${c.cid==cids}">selected = "selected"</c:if>
                                                     value="${c.cid}">${c.cname}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                    <div style="float:left;  width: 130px;">
                                        <input type="hidden" name="skip" value="selUser">
                                        <select id="CategorySecond" name="csid" class="form-control" style="width: 130px;">
                                            <option  value="-1" >二级类目
                                            </option>
                                            <c:forEach items="${categorySecondList}" var="c" varStatus="i">
                                            <option  <c:if test="${c.cid==cids}">selected = "selected"</c:if>
                                                     value="${c.csid}">${c.csname}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div style="float:left; margin:0 2px; width: 130px;">
                                        <input type="text" class="form-control" placeholder="查询姓名" size=8  name="pnames"  value="${pname}">
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
                                    <th>商品名</th>
                                    <th>原价</th>
                                    <th>售价</th>
                                    <th>一级类目</th>
                                    <th>二级类目</th>
                                    <th>操作</th>
                                    <th>操作</th>




                                    </thead>
                                    <tbody>
                                    <c:forEach items="${page.productExtList}" var="p" >
                                        <tr  height="35px">
                                            <td>${p.pid}</td>
                                            <td>${p.pname}</td>
                                            <td>${p.marketprice}</td>
                                            <td>${p.shopprice}</td>
                                            <td>${p.category.cname}</td>
                                            <td>${p.categorySecond.csname}</td>
                                            <td style="font-size: 12px"><a
                                                    href="#">修改</a></td>
                                            <td style="font-size: 12px"><a
                                                    href="${pageContext.request.contextPath}">删除</a></td>
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
                                        <a href="${pageContext.request.contextPath}/product/proList?cid=${page.cid}&csid=${page.csid}&pagenow=1&pnames=${page.pname}">【1】</a>&nbsp;&nbsp;
                                        <a href="${pageContext.request.contextPath}/product/proList?cid=${page.cid}&csid=${page.csid}&pagenow=${page.paging.lastone}&pnames=${page.pname}">【...】</a>&nbsp;&nbsp;
                                    </c:if>
                                    <c:forEach items="${page.paging.groupList}" var="i">
                                        <c:if test="${i==page.pagenow}">
                                            <a style="color: red" href="${pageContext.request.contextPath}/product/proList?cid=${page.cid}&csid=${page.csid}&pagenow=${i}&pnames=${page.pname}">【${i}】</a>&nbsp;&nbsp;
                                        </c:if>
                                        <c:if test="${i!=page.pagenow}">
                                            <a href="${pageContext.request.contextPath}/product/proList?cid=${page.cid}&csid=${page.csid}&pagenow=${i}&pnames=${page.pname}">【${i}】</a>&nbsp;&nbsp;
                                        </c:if>


                                    </c:forEach>
                                    <c:if test="${page.paging.next!=0}">
                                        <a href="${pageContext.request.contextPath}/product/proList?cid=${page.cid}&csid=${page.csid}&pagenow=${page.paging.next}&pnames=${page.pname}">【...】</a>&nbsp;&nbsp;
                                        <a href="${pageContext.request.contextPath}/product/proList?cid=${page.cid}&csid=${page.csid}&pagenow=${page.totalpage}&pnames=${page.pname}">【${page.totalpage}】</a>&nbsp;&nbsp;
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
