<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>请登陆</title>
    <!-- 引入Bootstrap和自定义CSS样式 -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link href="resources/css/login.css" type="text/css" rel="stylesheet" />
</head>
<body>
<script>
    // 表单验证脚本
    function check(form){
        if (form.user.value === "") {
            alert("请输入账号！");
            return false;
        }
        if (form.password.value === "") {
            alert("请输入密码！");
            return false;
        }
        return true;
    }

</script>
<h1 style="margin: 50px 80px; color: darkgray; font-family: cursive;">欢迎来到教务系统</h1>
<div class="main">
    <h5 class="title">
        <a href="login.jsp" id="login">登录</a>
        <b>&nbsp;·&nbsp;</b>
        <a href="register.jsp" id="register">注册</a>
    </h5>
    <!-- 登录表单 -->
    <form action="check_login" method="post" onsubmit="return check(this)">
        <div class="form-group">
            <input type="text" name="user" class="form-control user" placeholder="请输入用户名">
            <input type="password" name="password" class="form-control password" placeholder="请输入密码">
            <div class="remember-btn">
                <input type="checkbox" name="remember" value="true">
                <span>记住我</span>
            </div>
            <a href="forget.jsp" class="help">登录遇到问题？</a>
            <input type="submit" value="登录" class="btn btn-primary btn-lg btn-block" />
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
         <title>请登陆</title>
         <link rel="stylesheet" href="resources/css/bootstrap.min.css">
         <link href="resources/css/login.css" type="text/css" rel="stylesheet" />
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
             if (form.password.value === "") {
                 alert("请输入密码！");
                 return false;
             }
             return true;
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
登录表单：
表单元素：
jsp
Copy
     <form action="check_login" method="post" onsubmit="return check(this)">
         <div class="form-group">
             <input type="text" name="user" class="form-control user" placeholder="请输入用户名">
             <input type="password" name="password" class="form-control password" placeholder="请输入密码">
             <div class="remember-btn">
                 <input type="checkbox" name="remember" value="true">
                 <span>记住我</span>
             </div>
             <a href="forget.jsp" class="help">登录遇到问题？</a>
             <input type="submit" value="登录" class="btn btn-primary btn-lg btn-block" />
         </div>
     </form>
用户名输入框：允许用户输入用户名。
密码输入框：允许用户输入密码。
记住我：复选框，允许用户选择是否记住登录状态。
帮助链接：如果用户遇到登录问题，提供帮助链接。
提交按钮：提交表单，将请求发送到check_login。
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
功能总结：
这个JSP页面用于用户登录。它包含一个登录表单，用户输入用户名和密码，然后提交表单进行验证。页面还包含一个记住我功能和忘记密码的帮助链接。--%>