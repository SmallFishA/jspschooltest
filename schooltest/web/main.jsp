<%--
  Created by IntelliJ IDEA.
  User: JiangXi_WuYanZu
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
    .main{
        width: 1000px;
        height: 450px;
        margin:auto;
        border: 2px solid deepskyblue;
        display: flex;
        justify-content: space-between;
    }
    .login{
        height: 450px;
        width: 30%;
        border-right: 2px solid deepskyblue;
    }
    .logintop{
        background: deepskyblue;
    }
    .button{
        width: 110px;
        height: auto;
        margin: auto;
    }
    p{
        text-align: center;
        margin:0;
        padding: 0;
    }
    ul{
        margin: auto;
        padding: 0;
        text-align: center;
        list-style-type: none;
        letter-spacing:6px;
    }
    .page1{
        width: 70%;
        height: 450px;
        color: red;
        text-align: center;
        font-size: 30px;
    }
    .box1{
        width: 100%;
        height: 250px;
    }
    </style>
</head>
<body>
<div class="main">

<div class="login">
    <div class="box1">
        <div class="logintop"><p>会员登录</p></div>

        <div>
        <form action="loginServlet" method="post">
            用户名：<input type="text" id= "username" name="username"><br>
            密码：<input type="password" id="password" name="password"><br>
            <div class="button"><button>登录</button>&nbsp&nbsp&nbsp<button>注册</button></div>
        </form>
            <c:if test="${not empty error}">
                <p style="color:red;">${error}</p>
            </c:if>
        </div>

    </div>

    <div>
        <div class="logintop"><p>图书类别</p></div>
        <ul>
            <li>程序设计</li>
            <li>网站开发</li>
            <li>软件工程</li>
            <li>图像处理</li>
            <li>网络应用</li>
        </ul>
    </div>

    <div>
        <div class="logintop"><p>图书搜索</p></div>
        关键词：<input type="text" name="search"><br>
        <div class="button"><button>搜索</button></div>
    </div>


</div>

    <div class="page1">上架最新图书</div>

</div>
</body>
</html>
