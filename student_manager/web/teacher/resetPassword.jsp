<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>重置密码</title>
    <!-- 引入Bootstrap和自定义CSS样式 -->
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
    <link href="../resources/css/forget.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<!-- 页面标题 -->
<h1 style="margin: 50px 80px; color: darkgray; font-family: cursive;">欢迎来到教务系统</h1>
<%
    // 获取请求参数
    String id = request.getParameter("id");
    String reset = request.getParameter("reset");

    // 从会话中获取验证码
    String code = (String) session.getAttribute("reset");

    // 验证验证码是否正确
    if (!reset.equals(code)){
%>
<!-- 验证码错误的处理 -->
<script>alert("验证码错误!");window.location.href='../forget.jsp';</script>
<%
} else {
%>
<!-- 显示重置密码的表单 -->
<div class="main">
    <form role="form" action="../update_teacher_password" method="post">
        <div class="form-group" align="center">
            <!-- 新密码输入框 -->
            <input type="text" class="form-control" name="password" placeholder="新密码"><br>
            <!-- 隐藏的教师ID -->
            <input type="hidden" name="id" value="<%=id%>">
            <!-- 提交按钮 -->
            <input type="submit" class="btn btn-success" value="提交">
            <!-- 取消按钮 -->
            <input type="button" class="btn btn-info" value="取消" style="margin-left: 20px" onclick="window.location.href='../login.jsp'">
        </div>
    </form>
</div>
<%
    }
%>
<!-- 引入jQuery、Popper.js和Bootstrap的JS文件 -->
<script src="../resources/js/jquery-3.2.1.min.js"></script>
<script src="../resources/js/popper.min.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
</body>
</html>
<%--页面指令：
**<%@ page contentType="text/html;charset=UTF-8" language="java" %>**：设置页面的内容类型为HTML，字符编码为UTF-8，语言为Java。
HTML 声明：
**<!DOCTYPE html>**：定义文档类型为HTML5。
**<html>**：HTML文档的根元素。
头部元素：
**<title>**：定义文档的标题。
**<link rel="stylesheet" href="../resources/css/bootstrap.min.css">**：引入Bootstrap CSS文件。
**<link href="../resources/css/forget.css" type="text/css" rel="stylesheet"/>**：引入自定义CSS样式文件forget.css。
主体：
**<body>**：定义文档的主体部分。
页面标题：
jsp
Copy
     <h1 style="margin: 50px 80px; color: darkgray; font-family: cursive;">欢迎来到教务系统</h1>
获取请求参数和会话中的验证码：
jsp
Copy
   String id = request.getParameter("id");
   String reset = request.getParameter("reset");
   String code = (String) session.getAttribute("reset");
验证验证码：
如果验证码不匹配：
jsp
Copy
     if (!reset.equals(code)){
     %>
         <script>alert("验证码错误!");window.location.href='../forget.jsp';</script>
     <%
     } else {
显示验证码错误的弹出窗口，并重定向到 forget.jsp 页面。
如果验证码匹配：
jsp
Copy
     <div class="main">
         <form role="form" action="../update_teacher_password" method="post">
             <div class="form-group" align="center">
                 <input type="text" class="form-control" name="password" placeholder="新密码"><br>
                 <input type="hidden" name="id" value="<%=id%>">
                 <input type="submit" class="btn btn-success" value="提交">
                 <input type="button" class="btn btn-info" value="取消" style="margin-left: 20px" onclick="window.location.href='../login.jsp'">
             </div>
         </form>
     </div>
显示重置密码的表单。
表单包含：
新密码输入框：<input type="text" class="form-control" name="password" placeholder="新密码">。
隐藏字段教师ID：<input type="hidden" name="id" value="<%=id%>">。
提交按钮：<input type="submit" class="btn btn-success" value="提交">。
取消按钮：<input type="button" class="btn btn-info" value="取消" style="margin-left: 20px" onclick="window.location.href='../login.jsp'">，点击后重定向到 login.jsp 页面。
引入外部JS文件：
jQuery：<script src="../resources/js/jquery-3.2.1.min.js"></script>。
Popper.js：<script src="../resources/js/popper.min.js"></script>。
Bootstrap JS：<script src="../resources/js/bootstrap.min.js"></script>。
这个JSP页面用于显示重置教师密码的表单。它首先验证请求中提供的验证码是否匹配会话中的验证码，如果匹配则显示新密码的输入表单，否则显示错误提示并重定向回到忘记密码页面。--%>