<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="sidebar" data-color="grow" data-image="${pageContext.request.contextPath}/images/sidebar-5.jpg">
    <div class="sidebar-wrapper">
        <div class="logo">
            <a href="#" class="simple-text">
                <img src="${pageContext.request.contextPath}/images/logo.png">
            </a>
        </div>

        <ul class="nav">
            <li>
                <a href="/webTest01/home.jsp">
                    <i class="pe-7s-graph"></i>
                    <p>管理员首页</p>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/user/index">
                    <i class="pe-7s-user"></i>
                    <p>个人信息</p>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/product/proList">
                    <i class="pe-7s-news-paper"></i>
                    <p>商品列表</p>
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/user/userlist">
                    <i class="pe-7s-note2"></i>
                    <p>用户列表</p>
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/category/category">
                    <i class="pe-7s-bell"></i>
                    <p>一级类目管理</p>
                </a>
            </li>

            <li>
                <a href="${pageContext.request.contextPath}/category/categorySecond?pagenow=1">
                    <i class="pe-7s-map-marker"></i>
                    <p>二级类目管理</p>
                </a>
            </li>



            <li>
                <a href="${pageContext.request.contextPath}/user/ok">
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
