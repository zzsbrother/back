<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="icon" type="${pageContext.request.contextPath}/image/png" href="img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>新闻审核</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="${pageContext.request.contextPath}/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="${pageContext.request.contextPath}/css/light-bootstrap-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${pageContext.request.contextPath}/css/demo.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/pe-icon-7-stroke.css" rel="stylesheet" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/XMLhttpRequest.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript">

        $(function(){
            $("[name='del']").click(function(){
                var trid = "tr"+this.value;
                $.ajax({
                    url:"manage/NewsAction?flag=delNewsType&typeID="+this.value,
                    success:function(data){

                        if(data == "true" ){
                            var deltr = document.getElementById(trid);
                            $(("#"+trid)).remove();
                            demo.initChartist();

                            $.notify({
                                icon: 'pe-7s-gift',
                                message: " <b>删除成功</b>"

                            },{
                                type: 'info',
                                timer: 4000


                            });
                        }else{
                            demo.initChartist();

                            $.notify({
                                icon: 'pe-7s-gift',
                                message: " <b>删除失败</b>"

                            },{
                                type: 'danger',
                                timer: 4000


                            });

                        }
                    }
                });
            });
            //  添加类目    
            $("#addcategory").click(function () {
                var csname=$("#addcsname").val();
                var cid=$("#addcid option:selected").val();
               /* alert(cid+"_"+csname);
                $.ajax({

                })*/
                $.ajax({
                    url:"${pageContext.request.contextPath}/addCategorySecond",
                    data:{
                        "cid":cid,
                        "csname":csname
                    },
                    dataType:"text",
                    success:function (data) {
                            alert(data)
                    }
                })
            })
            //修改
           $("[name='updataCategory']").click(function () {
                var cid=$(this).parent().prev().children("[name='CName']").val();
                var csid=$(this).parent().prev().prev().prev().children("[name='csid']").val();
                var CSecondName=$(this).parent().prev().prev().children("[name='CSecondName']").val();
                /*alert("cid:"+cid+",csid:"+csid+",CSecondName:"+CSecondName);*/
                $.ajax({
                    url:"${pageContext.request.contextPath}/updataCategory",
                    data:{
                        "cid":cid,
                        "csid":csid,
                        "CSecondName":CSecondName
                    },
                    dataType:"text",
                    success:function (data) {
                        alert(data)
                    }
                })
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
                    <div class="col-md-6" style="width: 900px;">
                        <div class="card ">
                            <div class="header">
                                <h4 class="title">类别管理</h4>
                                <p class="category">Backend development</p>
                            </div>
                            <div style="float:right; width: 150px; height:50px;  margin-right: 10px; margin-top: -30px;">



                                <!--  </div> -->

                            </div>
                            <div class="content">
                                <div class="table-full-width">
                                    <table class="table">
                                        <tbody>
                                        <tr>
                                            <div style="width: 100px"><td>类别ID</td></div>
                                            <div style="width: 100px"><td>类别名称</td></div>
                                            <div style="width: 100px"><td>一级类目</td></div>
                                            <div style="width: 130px"><td colspan=2 align="center">操作</td></div>
                                        </tr>

                                        <c:forEach items="${page.categorySecondList}" var="cs">
                                            <div>
                                                <form action="${pageContext.request.contextPath}/category/updataCategory" method="post">
                                                    <tr id="tr22">

                                                        <td>
                                                                <input type="text" width="30" class="form-control" readonly=true name="csid"  value="${cs.csid}">
                                                        </td>
                                                        <td>
                                                                <input type="text" class="form-control" id="CSecondName" name="CSecondName" placeholder="类别名称" value="${cs.csname}">
                                                        </td>
                                                        <td>
                                                                <select id="CName" name="CName" class="form-control" style="width: 130px;">
                                                                    <c:forEach items="${categoryList}" var="c" varStatus="i">
                                                                        <option  <c:if test="${c.cid==cs.cid}">selected = "selected"</c:if>
                                                                                 value="${c.cid}">${c.cname}</option>
                                                                    </c:forEach>
                                                                </select>
                                                        </td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" name="updataCategory" rel="tooltip" title="修改" class="btn btn-info btn-simple btn-xs" >
                                                                <i class="fa fa-edit"></i>
                                                            </button>
                                                </form>
                                                            <form action="${pageContext.request.contextPath}/category/delete" method="post">
                                                                <input type="hidden" name="pp" value="${page.pagenow}">
                                                                <button type="submit" rel="tooltip" title="删除" name="delete" value="${cs.csid}" class="btn btn-danger btn-simple btn-xs">
                                                                    <i class="fa fa-times"></i>
                                                                </button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                            </div>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div style=" margin: 0 0 0px 20px;padding:0 0 20px 0; width: 70%;">
                                    <c:if test="${page.total!=0}">
                                    <c:if test="${page.paging.lastone!=0}">
                                        <a href="${pageContext.request.contextPath}/category/categorySecond?pagenow=1">【1】</a>&nbsp;&nbsp;
                                        <a href="${pageContext.request.contextPath}/category/categorySecond?pagenow=${page.paging.lastone}">【...】</a>&nbsp;&nbsp;
                                    </c:if>
                                    <c:forEach items="${page.paging.groupList}" var="i">
                                        <c:if test="${i==page.pagenow}">
                                            <a style="color: red" href="${pageContext.request.contextPath}/category/categorySecond?pagenow=${i}">【${i}】</a>&nbsp;&nbsp;
                                        </c:if>
                                        <c:if test="${i!=page.pagenow}">
                                            <a href="${pageContext.request.contextPath}/category/categorySecond?pagenow=${i}">【${i}】</a>&nbsp;&nbsp;
                                        </c:if>


                                    </c:forEach>
                                    <c:if test="${page.paging.next!=0}">
                                        <a href="${pageContext.request.contextPath}/category/categorySecond?pagenow=${page.paging.next}">【...】</a>&nbsp;&nbsp;
                                        <a href="${pageContext.request.contextPath}/category/categorySecond?pagenow=${page.totalpage}">【${page.totalpage}】</a>&nbsp;&nbsp;
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
                            </div>
                            <%--//添加--%>
                            <div class="footer" style="width: 100%">
                                <hr>
                                <div class="stats">
                                    <i class="fa fa-history"></i>添加部门
                                    <form action="#" method="post">
                                        <table class="table" style="width:100%">
                                            <tr>
                                                <td>
                                                    <input  style=" width:280px;"type="text" class="form-control" id="addcsname" name="typeName" placeholder="类目名称" >
                                                </td>
                                                <td>
                                                    <div style=" width:280px;">
                                                        <select id="addcid" name="addcid" class="form-control" style="width: 100%;">
                                                            <c:forEach items="${categoryList}" var="c" varStatus="i">
                                                                <option  <c:if test="${i.count==1}">selected = "selected"</c:if>
                                                                         value="${c.cid}">${c.cname}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </td>

                                                <td class="td-actions text-right">

                                                    <button  style=" width:250px;"type="button" id="addcategory"  class="btn btn-info btn-fill pull-right" >添加部门</button>

                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
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


</body>

<!--   Core JS Files   -->
<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="${pageContext.request.contextPath}/js/bootstrap-checkbox-radio-switch.js"></script>

<!--  Charts Plugin -->
<script src="${pageContext.request.contextPath}/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/js/bootstrap-notify.js"></script>


<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script src="${pageContext.request.contextPath}/js/light-bootstrap-dashboard.js"></script>

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src="${pageContext.request.contextPath}/js/demo.js"></script>





</html>