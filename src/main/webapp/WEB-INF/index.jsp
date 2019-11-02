<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/images/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>个人信息</title>

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
<script type="text/javascript"
	src="js/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="js/XMLHttpRequest.js"></script>

	
</head>
<body>

<div class="wrapper">
    <%@include file="left.jsp"%>

		<div class="main-panel">

        <%@include file="head.jsp"%>

			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-8">
							<div class="card">
								<div class="header">
									<h4 class="title">修改信息</h4>
								</div>
								<div class="content">
									<form
										action="${pageContext.request.contextPath}/Modify?index=yes"
										method="post" >
										<input type='hidden' name='index' value='yes'/>


										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>名称</label> <input type="text" class="form-control"
														placeholder="真实姓名" id="userName" name="username"
														value="${sessionScope.usersback.username }"> <span id="recMsg"></span>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>密码</label> <input type="password"
														class="form-control" placeholder="不能为汉字" name="password"
														value="${sessionScope.usersback.password}">
												</div>
											</div>
										</div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>确认密码</label> <input type="password"
                                                                             class="form-control" placeholder="不能为汉字" name="password"
                                                                             value="${sessionScope.usersback.password}">
                                                </div>
                                            </div>
                                        </div>
										
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>真实姓名</label> <input type="text"
														class="form-control" placeholder="不能为汉字" name="code"
														value="${sessionScope.usersback.name}">
												</div>
											</div>
										</div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>邮箱</label> <input type="text"
                                                                               class="form-control" placeholder="不能为汉字" name="code"
                                                                               value="${sessionScope.usersback.email}">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>手机号</label> <input type="text"
                                                                               class="form-control" placeholder="不能为汉字" name="code"
                                                                               value="${sessionScope.usersback.phone}">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>地址</label> <input type="text"
                                                                               class="form-control" placeholder="不能为汉字" name="code"
                                                                               value="${sessionScope.usersback.addr}">
                                                </div>
                                            </div>
                                        </div>
											<button type="submit" id="sbb"
											class="btn btn-info btn-fill pull-right">修改</button>
										<div class="clearfix"></div>
									</form>
								</div>
							</div>
						</div>

						

<div class="col-md-4">
    <div class="card card-user">
        <div class="image">
            <img src="${pageContext.request.contextPath}/images/userleft.bg.jpg" alt="/newsSystem."/>
        </div>
        <div class="content">
            <div class="author">
                 <a href="#">
                 
                  	<img class="avatar border-gray" src="ICon\2018\09-25\e3b25415-a75c-49f1-9fcf-456091c4b2a7_001.gif" alt="/newsSystem."/>
                 
                  
               

                  <h4 class="title">admin<br />
                     <small>爱尚教育部</small>
                  </h4>
                </a>
            </div>
            <p class="description text-center"> admin是一位 <br>
                                18岁的女孩, 在<br>
                               	 爱尚教育部努力工作
            </p>
        </div>
        <hr>
        <div class="text-center">
            <button href="#" class="btn btn-simple"><i class="fa fa-facebook-square"></i></button>
            <button href="#" class="btn btn-simple"><i class="fa fa-twitter"></i></button>
            <button href="#" class="btn btn-simple"><i class="fa fa-google-plus-square"></i></button>

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
