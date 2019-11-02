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
            $("#addCategory").click(function () {
                var cname=$("#typeCName").val()
                if(cname==null || cname==""){
                    alert("类别名不可为空")
                    return
                }
                $.ajax({
                    url:"${pageContext.request.contextPath}/addCategory",
                    data:{
                        "cname":cname
                    },
                    dataType:"text",
                    success:function (data) {
                        alert(data)
                        if(data=="添加成功"){
                            window.location.reload();
                        }
                    }
                })
            })
            //修改
            $("[name='updataInform']").click(function () {
                var order=$(this).parent().prev().children("[name='orderbynum']").val();
                var cid=$(this).parent().prev().prev().prev().children("[name='typeID']").val();
                var cname=$(this).parent().prev().prev().children("[name='typeName']").val();
                var oldorder=$(this).parent().children("[name='oldorder']").val();
                var oldname=$(this).parent().children("[name='oldname']").val();
                if(oldorder==order && oldname==cname){
                    return;
                }
                alert("order:"+order+",cid:"+cid+",cname:"+cname+",oldorder"+oldorder);
                $.ajax({
                    url:"${pageContext.request.contextPath}/updataCategoryOne",
                    data:{
                        "order":order,
                        "cid":cid,
                        "cname":cname,
                        "oldorder":oldorder
                    },
                    dataType:"text",
                    success:function (data) {
                        alert(data)
                        if(data=="修改成功"){
                            window.location.reload();
                        }
                    }
                })
            })
            //删除
            $("[name='deleteCategory']").click(function () {
                var cid=$(this).parent().children("[name='deletecid']").val();
                alert(cid)
                $.ajax({
                    url:"${pageContext.request.contextPath}/deleteByCid",
                    data:{
                        "cid":cid
                    },
                    dataType:"text",
                    success:function (data) {
                        window.location.reload();
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
                                <h4 class="title">一级类目管理</h4>
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
                                            <div style="width: 130px"><td>类别ID</td></div>
                                            <div style="width: 130px"><td>类别名称</td></div>
                                            <div style="width: 130px"><td>前台板块显示顺序</td></div>
                                            <div style="width: 130px"><td colspan=2 align="center">操作</td></div>
                                        </tr>

                                        <c:forEach items="${categoryList}" var="c">
                                            <div>
                                                <form action="manage/NewsAction?flag=upTypeSort" method="post">
                                                    <tr id="tr22">

                                                        <td>
                                                            <input type="text" width="30" class="form-control" readonly=true name="typeID"  value="${c.cid}">
                                                        </td>
                                                        <td>
                                                            <input type="text" class="form-control" name="typeName" placeholder="类别名称" value="${c.cname}">
                                                        </td>
                                                        <td>
                                                            <select id="orderbynum" name="orderbynum" class="form-control" style="width: 130px;">
                                                                <c:if test="${c.order==100}">
                                                                    <option value="100">未在前台显示</option>
                                                                </c:if>
                                                                <c:forEach begin="1" end="8" var="x" >
                                                                    <option  <c:if test="${c.order==x}">selected = "selected"</c:if>
                                                                             value="${x}">排在第${x}位</option>
                                                                </c:forEach>
                                                            </select>
                                                        </td>
                                                        <td class="td-actions text-right">
                                                            <button type="button" rel="tooltip" name="updataInform" title="修改" class="btn btn-info btn-simple btn-xs" >
                                                                <i class="fa fa-edit"></i>
                                                            </button>
                                                            <input type="hidden" name="oldorder" value="${c.order}">
                                                            <input type="hidden" name="oldname" value="${c.cname}">
                                                            <c:if test="${c.order==100}">
                                                                <button type="button" rel="tooltip" title="删除" name="deleteCategory" value="23" class="btn btn-danger btn-simple btn-xs" onclick=delNewsType() >
                                                                    <i class="fa fa-times"></i>
                                                                </button>
                                                                <input type="hidden" name="deletecid" value="${c.cid}">
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </form>
                                            </div>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="footer">
                                    <hr>
                                    <div class="stats">
                                        <i class="fa fa-history"></i>添加部门
                                        <form action="manage/NewsAction?flag=AddNewsType" method="post">
                                            <table class="table">
                                                <tr>
                                                    <td>
                                                        <input type="text" class="form-control" id="typeCName" name="typeName" placeholder="类目名称" >
                                                    </td>

                                                    <td class="td-actions text-right">

                                                        <button type="button" id="addCategory"  class="btn btn-info btn-fill pull-right" >添加部门</button>

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