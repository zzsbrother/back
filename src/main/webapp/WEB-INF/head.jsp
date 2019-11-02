<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-default navbar-fixed">
    <div class="container-fluid">
        <div class="navbar-header">
            <!-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button> -->
            <a class="navbar-brand" href="#">后台管理系统</a>
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
