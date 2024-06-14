<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>注册</title>
    <!-- 引入Bootstrap和自定义CSS样式 -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link href="resources/css/register.css" type="text/css" rel="stylesheet" />
</head>
<body>
<script>
    // 表单验证脚本
    function check(form){
        if (form.user.value === "") {
            alert("请输入账号！");
            return false;
        }
        if (form.password1.value === "") {
            alert("请输入密码！");
            return false;
        }
        return true;
    }

    // 刷新验证码
    function refresh() {
        var i = Math.random();
        document.getElementById("image").src = "code.jsp?a=" + i;
    }
</script>
<h1 style="margin: 50px 80px; color: darkgray; font-family: cursive;">欢迎来到教务系统</h1>
<div class="main">
    <h5 class="title">
        <a href="login.jsp" id="login">登录</a>
        <b>&nbsp;·&nbsp;</b>
        <a href="register.jsp" id="register">注册</a>
    </h5>
    <!-- 注册表单 -->
    <form action="check_register" method="post" onsubmit="return check(this)">
        <div class="form-group">
            <input type="email" name="email" class="form-control email" placeholder="安全邮箱">
            <input type="text" name="user" class="form-control user" placeholder="用户名">
            <input type="password" name="password1" class="form-control password1" placeholder="密码">
            <input type="text" name="code" placeholder="验证码" class="code">
            <img src="code.jsp" id="image" style="float: right; width: 90px;height: 50px; margin-top: 10px" onclick="refresh()">
            <input type="submit" value="注册" class="btn btn-primary btn-lg btn-block we" />
        </div>
    </form>
</div>
<!-- 引入jQuery、Popper.js和Bootstrap的JS文件 -->
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
<%--页面指令：
设置页面内容类型：
jsp
Copy
     <%@ page contentType="text/html;charset=UTF-8" language="java" %>
HTML 声明：
定义文档类型为HTML5：
html
Copy
     <!DOCTYPE html>
     <html>
头部元素：
包含文档的元数据如标题和链接到CSS文件：
jsp
Copy
     <head>
         <meta charset="utf-8" />
         <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
         <title>注册</title>
         <link rel="stylesheet" href="resources/css/bootstrap.min.css">
         <link href="resources/css/register.css" type="text/css" rel="stylesheet" />
     </head>
表单验证脚本：
JavaScript表单验证函数：
javascript
Copy
     <script>
         function check(form){
             if (form.user.value === "") {
                 alert("请输入账号！");
                 return false;
             }
             if (form.password1.value === "") {
                 alert("请输入密码！");
                 return false;
             }
             return true;
         }

         // 刷新验证码
         function refresh() {
             var i = Math.random();
             document.getElementById("image").src = "code.jsp?a=" + i;
         }
     </script>
主体元素：
页面标题：
jsp
Copy
     <body>
     <h1 style="margin: 50px 80px; color: darkgray; font-family: cursive;">欢迎来到教务系统</h1>
主要内容：
jsp
Copy
     <div class="main">
         <h5 class="title">
             <a href="login.jsp" id="login">登录</a>
             <b>&nbsp;·&nbsp;</b>
             <a href="register.jsp" id="register">注册</a>
         </h5>
注册表单：
表单元素：
jsp
Copy
     <form action="check_register" method="post" onsubmit="return check(this)">
         <div class="form-group">
             <input type="email" name="email" class="form-control email" placeholder="安全邮箱">
             <input type="text" name="user" class="form-control user" placeholder="用户名">
             <input type="password" name="password1" class="form-control password1" placeholder="密码">
             <input type="text" name="code" placeholder="验证码" class="code">
             <img src="code.jsp" id="image" style="float: right; width: 90px;height: 50px; margin-top: 10px" onclick="refresh()">
             <input type="submit" value="注册" class="btn btn-primary btn-lg btn-block we" />
         </div>
     </form>
邮箱输入框：允许用户输入安全邮箱。
用户名输入框：允许用户输入用户名。
密码输入框：允许用户输入密码。
验证码输入框和图片：用户输入验证码，并提供刷新功能来生成新验证码。
注册按钮：提交表单，将请求发送到check_register。
外部JS文件：
引入jQuery、Popper.js 和 Bootstrap JS：
jsp
Copy
     <script src="resources/js/jquery-3.2.1.min.js"></script>
     <script src="resources/js/popper.min.js"></script>
     <script src="resources/js/bootstrap.min.js"></script>
关闭HTML标签：
jsp
Copy
    </body>
    </html>
这个JSP页面用于用户注册。它包含一个注册表单，用户输入邮箱、用户名、密码和验证码，然后提交表单进行验证。页面还包含一个刷新验证码的功能和表单验证脚本--%>