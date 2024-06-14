<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>重置密码</title>
    <!-- 引入Bootstrap CSS和自定义CSS文件 -->
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
    <link href="../resources/css/forget.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<!-- 页面标题 -->
<h1 style="margin: 50px 80px; color: darkgray; font-family: cursive;">欢迎来到教务系统</h1>
<%
    // 获取请求参数
    String id = request.getParameter("id");
    String email = request.getParameter("email");
    String reset = request.getParameter("reset");
    String code = (String) session.getAttribute("reset"); // 从会话中获取验证码

    // 验证码不匹配，显示错误信息并重定向
    if (!reset.equals(code)) {
%>
<script>alert("验证码错误!");window.location.href='../forget.jsp';</script>
<%
} else {
%>
<!-- 主内容区域 -->
<div class="main">
    <!-- 重置密码表单 -->
    <form role="form" action="../update_student_security" method="post">
        <div class="form-group" align="center">
            <input class="form-control" type="text" name="password" placeholder="新密码"><br>
            <input type="hidden" name="id" value="<%=id%>">
            <input type="hidden" name="email" value="<%=email%>">
            <input type="submit" class="btn btn-success" value="提交">
            <input type="button" class="btn btn-info" value="取消" style="margin-left: 20px" onclick="window.location.href='../login.jsp'">
        </div>
    </form>
</div>
<%
    }
%>
<!-- 引入jQuery、Popper.js和Bootstrap JS文件 -->
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
**<head>**：包含文档的元数据，如标题、CSS文件和JS文件。
**<title>**：定义文档的标题。
**<link>**：引入外部CSS文件，包括Bootstrap和自定义CSS forget.css。
页面标题：
**<h1>**：包含页面标题，设置了一些内联样式。
JSP 脚本元素：
获取请求参数（ID、邮箱和验证码），并从会话中获取存储的验证码。
验证码不匹配：
使用 <script> 显示错误信息的弹出窗口，并重定向回到 forget.jsp 页面。
如果验证码匹配：
显示重置密码的表单。
表单内容：
**<div class="main">**：定义主内容区域。
**<form role="form" action="../update_student_security" method="post">**：包含提交重置密码的表单。
表单字段：
**<input class="form-control" type="text" name="password" placeholder="新密码">**：输入新密码。
隐藏字段：
**<input type="hidden" name="id" value="<%=id%>">**：隐藏字段，传递学生ID。
**<input type="hidden" name="email" value="<%=email%>">**：隐藏字段，传递学生邮箱。
提交和取消按钮：
**<input type="submit" class="btn btn-success" value="提交">**：提交表单，执行密码重置。
**<input type="button" class="btn btn-info" value="取消" style="margin-left: 20px" onclick="window.location.href='../login.jsp'">**：取消按钮，重定向到 login.jsp 页面。
引入JS文件：
**<script src="../resources/js/jquery-3.2.1.min.js"></script>**：引入jQuery库。
**<script src="../resources/js/popper.min.js"></script>**：引入Popper.js库。
**<script src="../resources/js/bootstrap.min.js"></script>**：引入Bootstrap JS库。
这个JSP页面用于重置学生的密码，并在表单提交后将请求转发给 update_student_security Servlet 处理实际的密码更新操作。--%>