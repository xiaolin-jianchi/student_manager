<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>找回密码</title>
    <!-- 引入Bootstrap和自定义CSS样式 -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link href="resources/css/forget.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<!-- 页面标题 -->
<h1 style="margin: 50px 80px; color: darkgray; font-family: cursive;">欢迎来到教务系统</h1>
<div class="main">
    <!-- 找回密码表单 -->
    <form role="form" action="sendCode.jsp" method="post">
        <div class="form-group" align="center">
            <!-- 用户名输入框 -->
            <input class="form-control" type="text" name="user" placeholder="输入用户名"><br>
            <!-- 提交按钮 -->
            <input type="submit" class="btn btn-success" value="下一步">
            <!-- 取消按钮 -->
            <input type="button" class="btn btn-info" value="取消" style="margin-left: 20px" onclick="window.location.href='login.jsp'">
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
jsp
Copy
     <!DOCTYPE html>
     <html>
头部元素：
包含文档的元数据如标题和链接到CSS文件：
jsp
Copy
     <head>
         <title>找回密码</title>
         <link rel="stylesheet" href="resources/css/bootstrap.min.css">
         <link href="resources/css/forget.css" type="text/css" rel="stylesheet"/>
     </head>
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
         <form role="form" action="sendCode.jsp" method="post">
             <div class="form-group" align="center">
                 <input class="form-control" type="text" name="user" placeholder="输入用户名"><br>
                 <input type="submit" class="btn btn-success" value="下一步">
                 <input type="button" class="btn btn-info" value="取消" style="margin-left: 20px" onclick="window.location.href='login.jsp'">
             </div>
         </form>
     </div>
找回密码表单：
表单元素：
jsp
Copy
     <form role="form" action="sendCode.jsp" method="post">
         <div class="form-group" align="center">
             <!-- 用户名输入框 -->
             <input class="form-control" type="text" name="user" placeholder="输入用户名"><br>
             <!-- 提交按钮 -->
             <input type="submit" class="btn btn-success" value="下一步">
             <!-- 取消按钮 -->
             <input type="button" class="btn btn-info" value="取消" style="margin-left: 20px" onclick="window.location.href='login.jsp'">
         </div>
     </form>
输入框、提交按钮、取消按钮解释：
用户名输入框：允许用户输入用户名。
提交按钮：提交表单，将请求发送到sendCode.jsp页面。
取消按钮：取消操作，返回到login.jsp页面。
引入外部JS文件：
jQuery、Popper.js 和 Bootstrap JS：
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
这个JSP页面用于用户找回密码。当用户提交用户名后，表单将请求发送到sendCode.jsp页面以继续找回密码的流程。页面还包含一个取消按钮，允许用户返回到登录页面。--%>