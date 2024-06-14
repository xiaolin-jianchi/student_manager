<%@ page import="vo.Student" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>main</title>
    <!-- 引入CSS和JS文件 -->
    <link rel="stylesheet" href="../resources/css/jquery-ui-1.10.4.custom.min.css">
    <script src="../resources/js/jquery-1.10.2.js"></script>
    <script src="../resources/js/jquery-ui-1.10.4.custom.min.js"></script>
    <link href="../resources/css/default.css" rel="stylesheet"/>
</head>
<body>
<%
    // 从session获取学生信息
    Student student = (Student) session.getAttribute("info");
%>
<div id="page" class="container">
    <div id="header">
        <div id="logo">
            <!-- 显示学生头像 -->
            <img src="../userImg/<%=student.getId()%>.jpeg"/>
            <!-- 显示学生姓名 -->
            <h1><%=student.getName()%></h1>
        </div>
        <div id="menu">
            <ul>
                <!-- 导航菜单 -->
                <li class="current_page_item"><a href="personal.jsp">个人信息</a></li>
                <li><a href="main.jsp">成绩信息</a></li>
                <li><a onclick="return confirm('确认退出?');" href="../exit">退出登录</a></li>
            </ul>
        </div>
    </div>
    <div id="main">
        <div class="top">
            <h2>个人信息</h2>
            <hr/>
        </div>
        <div class="info">
            <img src="../userImg/<%=student.getId()%>.jpeg" class="personalImg"><br>
            <!-- 上传头像表单 -->
            <form action="../upload_studentImg" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="<%=student.getId()%>">
                <input type="file" name="img">
                <input type="submit" value="上传头像">
            </form>

            <!-- 更新邮箱表单 -->
            <form action="../update_student_email" method="post">
                <table width="400" frame="box" align="center" style="margin-top: 30px;">
                    <tr>
                        <td style="font-size: 25px;font-weight: bold">学号</td>
                        <td style="font-size: 25px;font-weight: bold"><%=student.getId()%></td>
                    </tr>
                    <tr>
                        <td style="font-size: 25px;font-weight: bold">姓名</td>
                        <td style="font-size: 25px;font-weight: bold"><%=student.getName()%></td>
                    </tr>
                    <tr>
                        <td style="font-size: 25px;font-weight: bold">性别</td>
                        <td style="font-size: 25px;font-weight: bold"><%=student.getSex()%></td>
                    </tr>
                    <tr>
                        <td style="font-size: 25px;font-weight: bold">专业</td>
                        <td style="font-size: 25px;font-weight: bold"><%=student.getMajor()%></td>
                    </tr>
                </table>
            </form>
            <!-- 修改安全信息按钮 -->
            <button class="password-btn" style="margin-top: 30px; height: 40px">修改安全信息</button>
        </div>
    </div>
</div>

<!-- 修改密码对话框 -->
<div id="password-dialog" title="修改安全信息">
    <form id="password-form" method="post">
        <input type="hidden" name="id" value="<%=student.getId()%>">
        邮箱: &nbsp;&nbsp;<input type="email" name="email" value="<%=student.getEmail()%>"><br><br>
        新密码:<input type="password" name="password"><br>
        <hr>
        <input style="float: right" type="submit" value="取消" onclick="function x() {
          $('#add-dialog').dialog('close');
        }">
        <input style="float: right; margin-right: 25px" type="submit" value="保存"
               onclick="this.form.action='../update_student_security'">
    </form>
</div>

<script>
    // 配置修改密码对话框
    $('#password-dialog').dialog({
        width: 340,
        autoOpen: false,
        draggable: false,
        modal: true,
        resizable: false
    });
    // 打开修改密码对话框
    $('.password-btn').click(function () {
        $('#password-dialog').dialog('open');
    });
</script>

<style>
    .ui-dialog-titlebar-close {
        display: none
    }
</style>
</body>
</html>
<%--**<%@ page import="vo.Student" %>**：导入Student类。
HTML 声明：
**<!DOCTYPE html>**：定义文档类型为HTML5。
**<html>**：HTML文档的根元素。
**<head>**：包含文档的元数据，如标题、CSS和JS文件。
**<title>**：定义文档的标题。
**<link>和<script>**：引入外部CSS和JS文件。
JSP 脚本元素：
**<% Student student = (Student) session.getAttribute("info"); %>**：从会话中获取学生信息并赋值给变量 student。
页面结构：
**<div id="page" class="container">**：定义页面的主要容器。
**<div id="header">**：定义页面头部。
**<div id="logo">**：显示学生头像和姓名。
**<img src="../userImg/<%=student.getId()%>.jpeg"/>**：显示学生头像。
**<h1><%=student.getName()%></h1>**：显示学生姓名。
**<div id="menu">**：定义导航菜单。
列表项包括“个人信息”、“成绩信息”和“退出登录”。
**<div id="main">**：定义主要内容区域。
**<div class="top">**：显示标题和分隔线。
**<div class="info">**：显示个人信息和表单。
**<form>**：用于上传头像的表单。
**<form>**：用于更新邮箱的表单。
**<button>**：修改安全信息按钮。
修改密码对话框：
**<div id="password-dialog" title="修改安全信息">**：定义修改密码的对话框。
**<form>**：包含表单字段，用于提交新密码。
**<input>**：表单元素，包括隐藏字段、邮箱输入框和密码输入框。
**<hr>**：分隔线。
**<input>**：提交按钮和取消按钮。
脚本和样式：
**<script>**：
配置对话框的属性。
添加点击事件处理器，使按钮点击时打开对话框。
**<style>**：
隐藏对话框的关闭按钮。
这个JSP页面显示学生的个人信息，并允许学生上传头像和修改安全信息。--%>