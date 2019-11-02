
<%@ page contentType="text/html;charset=UTF-8" language="java" %>




<!DOCTYPE >
<html>
<head>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="img/favicon.ico">
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


        });




    </script>






</head>
<body>
<div class="wrapper">




    <div class="sidebar" data-color="grow" data-image="${pageContext.request.contextPath}/images/sidebar-5.jpg">
        <div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text">
                    <img src="${pageContext.request.contextPath}/images/logo.png">
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="manage/SkipAction?skip=index">
                        <i class="pe-7s-graph"></i>
                        <p>管理员首页</p>
                    </a>
                </li>
                <li>
                    <a href="manage/SkipAction?skip=II">
                        <i class="pe-7s-user"></i>
                        <p>个人信息</p>
                    </a>
                </li>
                <li>
                    <a href="manage/SkipAction?skip=Pend">
                        <i class="pe-7s-news-paper"></i>
                        <p>新闻列表</p>
                    </a>
                </li>

                <li>
                    <a href="manage/SkipAction?skip=selUser">
                        <i class="pe-7s-note2"></i>
                        <p>用户管理</p>
                    </a>
                </li>
                <li>
                    <a href="manage/SkipAction?skip=AddUser">
                        <i class="pe-7s-map-marker"></i>
                        <p>添加用户</p>
                    </a>
                </li>

                <li>
                    <a href="manage/SkipAction?skip=TypeManage">
                        <i class="pe-7s-bell"></i>
                        <p>类别管理</p>
                    </a>
                </li>


                <li>
                    <a href="manage/SkipAction?skip=Upload">
                        <i class="pe-7s-science"></i>
                        <p>新闻上传</p>
                    </a>
                </li>
                <li class="active-pro">
                    <a href="manage/">
                        <i class="pe-7s-rocket"></i>
                        <p>购买专业版</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>


    <div class="main-panel">

        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <!-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button> -->
                    <a class="navbar-brand" href="#">新闻管理系统</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-left">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="pe-7s-graph">消息</i>
                                <b class="caret"></b>
                                <span class="notification">5</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Notification 3</a></li>
                                <li><a href="#">Notification 4</a></li>
                                <li><a href="#">Another notification</a></li>
                            </ul>
                        </li>


                    </ul>

                    <ul class="nav navbar-nav navbar-right">

                        <li>
                            <a href="manage/UserAction?flag=clear">
                                安全退出
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6" style="width: 800px;">
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
                                            <td>类别ID</td>
                                            <td>类别名称</td>
                                            <td>类别排序</td>
                                            <td colspan=2 align="center">操作</td>
                                        </tr>


                                        <form action="manage/NewsAction?flag=upTypeSort" method="post">
                                            <tr id="tr22">

                                                <td>
                                                    <input type="text" class="form-control" readonly=true name="typeID"  value="22">
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="typeName" placeholder="类别名称" value="国家"   name="userName" onfocus="this.value = '';"
                                                           onblur="if (this.value == '') {this.value = '国家';}">
                                                </td>
                                                <td>
                                                    <div style=" width:130px;">
                                                        <input type="number" class="form-control" placeholder="类别优先级"   name="sort"  value="0">
                                                    </div>
                                                </td>
                                                <td class="td-actions text-right">
                                                    <button type="submit" rel="tooltip" title="修改" class="btn btn-info btn-simple btn-xs" >
                                                        <i class="fa fa-edit"></i>
                                                    </button>
                                                    <button type="button" rel="tooltip" title="删除" name="del" value="22" class="btn btn-danger btn-simple btn-xs" onclick=delNewsType() >
                                                       1111 <i class="fa fa-times"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </form>


                                        <form action="manage/NewsAction?flag=upTypeSort" method="post">
                                            <tr id="tr23">

                                                <td>
                                                    <input type="text" class="form-control" readonly=true name="typeID"  value="23">
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="typeName" placeholder="类别名称" value="经济"   name="userName" onfocus="this.value = '';"
                                                           onblur="if (this.value == '') {this.value = '经济';}">
                                                </td>
                                                <td>
                                                    <div style=" width:130px;">
                                                        <input type="number" class="form-control" placeholder="类别优先级"   name="sort"  value="0">
                                                    </div>
                                                </td>
                                                <td class="td-actions text-right">
                                                    <button type="submit" rel="tooltip" title="修改" class="btn btn-info btn-simple btn-xs" >
                                                        <i class="fa fa-edit"></i>
                                                    </button>
                                                    <button type="button" rel="tooltip" title="删除" name="del" value="23" class="btn btn-danger btn-simple btn-xs" onclick=delNewsType() >
                                                        <i class="fa fa-times"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </form>


                                        <form action="manage/NewsAction?flag=upTypeSort" method="post">
                                            <tr id="tr24">

                                                <td>
                                                    <input type="text" class="form-control" readonly=true name="typeID"  value="24">
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="typeName" placeholder="类别名称" value="军事"   name="userName" onfocus="this.value = '';"
                                                           onblur="if (this.value == '') {this.value = '军事';}">
                                                </td>
                                                <td>
                                                    <div style=" width:130px;">
                                                        <input type="number" class="form-control" placeholder="类别优先级"   name="sort"  value="0">
                                                    </div>
                                                </td>
                                                <td class="td-actions text-right">
                                                    <button type="submit" rel="tooltip" title="修改" class="btn btn-info btn-simple btn-xs" >
                                                        <i class="fa fa-edit"></i>
                                                    </button>
                                                    <button type="button" rel="tooltip" title="删除" name="del" value="24" class="btn btn-danger btn-simple btn-xs" onclick=delNewsType() >
                                                        <i class="fa fa-times"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </form>


                                        <form action="manage/NewsAction?flag=upTypeSort" method="post">
                                            <tr id="tr25">

                                                <td>
                                                    <input type="text" class="form-control" readonly=true name="typeID"  value="25">
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="typeName" placeholder="类别名称" value="商业"   name="userName" onfocus="this.value = '';"
                                                           onblur="if (this.value == '') {this.value = '商业';}">
                                                </td>
                                                <td>
                                                    <div style=" width:130px;">
                                                        <input type="number" class="form-control" placeholder="类别优先级"   name="sort"  value="0">
                                                    </div>
                                                </td>
                                                <td class="td-actions text-right">
                                                    <button type="submit" rel="tooltip" title="修改" class="btn btn-info btn-simple btn-xs" >
                                                        <i class="fa fa-edit"></i>
                                                    </button>
                                                    <button type="button" rel="tooltip" title="删除" name="del" value="25" class="btn btn-danger btn-simple btn-xs" onclick=delNewsType() >
                                                        <i class="fa fa-times"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </form>


                                        <form action="manage/NewsAction?flag=upTypeSort" method="post">
                                            <tr id="tr26">

                                                <td>
                                                    <input type="text" class="form-control" readonly=true name="typeID"  value="26">
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="typeName" placeholder="类别名称" value="娱乐"   name="userName" onfocus="this.value = '';"
                                                           onblur="if (this.value == '') {this.value = '娱乐';}">
                                                </td>
                                                <td>
                                                    <div style=" width:130px;">
                                                        <input type="number" class="form-control" placeholder="类别优先级"   name="sort"  value="0">
                                                    </div>
                                                </td>
                                                <td class="td-actions text-right">
                                                    <button type="submit" rel="tooltip" title="修改" class="btn btn-info btn-simple btn-xs" >
                                                        <i class="fa fa-edit"></i>
                                                    </button>
                                                    <button type="button" rel="tooltip" title="删除" name="del" value="26" class="btn btn-danger btn-simple btn-xs" onclick=delNewsType() >
                                                        <i class="fa fa-times"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </form>


                                        <form action="manage/NewsAction?flag=upTypeSort" method="post">
                                            <tr id="tr27">

                                                <td>
                                                    <input type="text" class="form-control" readonly=true name="typeID"  value="27">
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="typeName" placeholder="类别名称" value="哈尔滨"   name="userName" onfocus="this.value = '';"
                                                           onblur="if (this.value == '') {this.value = '哈尔滨';}">
                                                </td>
                                                <td>
                                                    <div style=" width:130px;">
                                                        <input type="number" class="form-control" placeholder="类别优先级"   name="sort"  value="0">
                                                    </div>
                                                </td>
                                                <td class="td-actions text-right">
                                                    <button type="submit" rel="tooltip" title="修改" class="btn btn-info btn-simple btn-xs" >
                                                        <i class="fa fa-edit"></i>
                                                    </button>
                                                    <button type="button" rel="tooltip" title="删除" name="del" value="27" class="btn btn-danger btn-simple btn-xs" onclick=delNewsType() >
                                                        <i class="fa fa-times"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </form>


                                        <form action="manage/NewsAction?flag=upTypeSort" method="post">
                                            <tr id="tr28">

                                                <td>
                                                    <input type="text" class="form-control" readonly=true name="typeID"  value="28">
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" name="typeName" placeholder="类别名称" value="科技"   name="userName" onfocus="this.value = '';"
                                                           onblur="if (this.value == '') {this.value = '科技';}">
                                                </td>
                                                <td>
                                                    <div style=" width:130px;">
                                                        <input type="number" class="form-control" placeholder="类别优先级"   name="sort"  value="0">
                                                    </div>
                                                </td>
                                                <td class="td-actions text-right">
                                                    <button type="submit" rel="tooltip" title="修改" class="btn btn-info btn-simple btn-xs" >
                                                        <i class="fa fa-edit"></i>
                                                    </button>
                                                    <button type="button" rel="tooltip" title="删除" name="del" value="28" class="btn btn-danger btn-simple btn-xs" onclick=delNewsType() >
                                                        <i class="fa fa-times"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </form>


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
                                                        <input type="text" class="form-control" readonly=true name="typeID">
                                                    </td>
                                                    <td>
                                                        <input type="text" class="form-control" name="typeName" placeholder="类目名称" >
                                                    </td>
                                                    <td>
                                                        <div style=" width:130px;">
                                                            <input type="text" class="form-control" placeholder="类目优先级"   name="sort"  >
                                                        </div>
                                                    </td>

                                                    <td class="td-actions text-right">

                                                        <button type="submit"  class="btn btn-info btn-fill pull-right" >添加部门</button>

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