<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.Student" %>
<%@ page import="vo.Teacher" %>
<%--
  Created by IntelliJ IDEA.
  User: 007
  Date: 2018/11/1
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 引入CSS和JS文件 -->
    <link rel="stylesheet" href="../resources/css/jquery-ui-1.10.4.custom.min.css">
    <script src="../resources/js/jquery-1.10.2.js"></script>
    <script src="../resources/js/jquery-ui-1.10.4.custom.min.js"></script>
    <title>main</title>
    <link href="../resources/css/default.css" rel="stylesheet"/>
</head>
<body>
<%
    // 从session中获取教师信息和学生列表
    Teacher teacher = (Teacher) session.getAttribute("info");
    ArrayList<Student> stus = (ArrayList<Student>) session.getAttribute("onePageStudent");
    int sumIndex = (int) session.getAttribute("sumIndex");
%>
<div id="page" class="container">
    <div id="header">
        <div id="logo">
            <!-- 显示教师头像和ID -->
            <img src="../userImg/<%=teacher.getId()%>.jpeg"/>
            <h1><%=teacher.getId()%></h1>
        </div>
        <div id="menu">
            <ul>
                <!-- 导航菜单 -->
                <li><a href="personal.jsp">个人信息</a></li>
                <li class="current_page_item"><a href="../one_page_student">学生管理</a></li>
                <li><a href="../one_page_score">成绩管理</a></li>
                <li><a onclick="return confirm('确认退出?');" href="../exit">退出登录</a></li>
            </ul>
        </div>
    </div>
    <div id="main">
        <div class="top">
            <h2>学生信息管理</h2>
            <hr/>
            <!-- 添加学生按钮 -->
            <button class="btn-add">添加学生</button>
            <div class="find">
                <!-- 搜索学生表单 -->
                <form action="../one_page_student" method="post">
                    <input id="find-text" type="text" name="key" placeholder="输入学号或姓名搜索">
                    <input class="find-btn" type="submit" value="搜索">
                </form>
            </div>
        </div>
        <div class="table">
            <!-- 学生信息表 -->
            <table id="table" width="800" frame="box" align="center">
                <tr>
                    <!-- 表头 -->
                    <th height="35">学号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>入学日期</th>
                    <th>专业</th>
                    <th>操作</th>
                </tr>
                <%
                    // 遍历学生列表并生成表格行
                    for (Student stu : stus) {
                %>
                <tr>
                    <!-- 更新学生信息表单 -->
                    <form method="post" action="../update_student">
                        <td height="35"><%=stu.getId()%></td>
                        <td><input value="<%=stu.getName()%>" name="stuname" class="table-input"></td>
                        <td><input value="<%=stu.getSex()%>" name="stusex" class="table-input"></td>
                        <td><%=stu.getSchool_date()%></td>
                        <td><input value="<%=stu.getMajor()%>" name="stumajor" class="table-input" style="width: 110px"></td>
                        <input value="<%=stu.getId()%>" name="stuno" type="hidden">
                        <td>
                            <!-- 修改、删除和查看成绩按钮 -->
                            <input type="submit" class="update-btn" value="修改">&nbsp;
                            <a class="btn-delete" onclick="return confirm('确定要删除吗?');" href="../delete_student?id=<%=stu.getId()%>">删除</a>&nbsp;&nbsp;
                            <a href="../one_page_score?id=<%=stu.getId()%>">查看成绩</a>
                        </td>
                    </form>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <%
            // 如果学生记录超过一页，显示分页按钮
            if (sumIndex > 1) {
        %>
        <div id="index">
            <a href="../one_page_student?index=1">首页</a>
            <%
                for (int i = 1; i <= sumIndex; i++) {
            %>
            <a href="../one_page_student?index=<%=i%>">第<%=i%>页</a>
            <%
                }
            %>
            <a href="../one_page_student?index=<%=sumIndex%>">尾页</a>
        </div>
        <%
            }
        %>
    </div>
</div>

<%-- 添加学生信息对话框 --%>
<div id="add-dialog" title="添加学生信息">
    <form id="add-form" method="post">
        学号:<input name="id" type="text"><br>
        姓名:<input name="name" type="text"><br>
        性别:<input name="sex" type="text"><br>
        专业:<input name="major" type="text"><br>
        入学日期:<input name="school_date" type="month" style="width: 190px">
        <hr>
        <input style="float: right" type="submit" value="取消" onclick="function x() { $('#add-dialog').dialog('close'); }">
        <input style="float: right; margin-right: 25px" type="submit" value="确定" onclick="this.form.action='../add_student'">
    </form>
</div>

<style>
    .ui-dialog-titlebar-close {
        display: none
    }
</style>

<script>
    // 配置对话框属性
    $('#add-dialog').dialog({
        width: 310,
        autoOpen: false,
        draggable: false,
        modal: true,
        resizable: false
    });
    // 点击“添加学生”按钮打开对话框
    $('.btn-add').click(function () {
        $('#add-dialog').dialog('open');
    });
</script>
</body>
</html>
<%--
页面指令：
**<%@ page import="java.util.ArrayList" %>**：导入 ArrayList 类。
**<%@ page import="vo.Student" %>**：导入 Student 类。
**<%@ page import="vo.Teacher" %>**：导入 Teacher 类。
**<%@ page contentType="text/html;charset=UTF-8" language="java" %>**：设置页面的内容类型为HTML，字符编码为UTF-8，语言为Java。
HTML 声明：
**<!DOCTYPE html>**：定义文档类型为HTML5。
头部元素：
引入CSS和JS文件：使用 <link> 和 <script> 元素引入外部资源，包括jQuery、jQuery UI和自定义CSS样式。
获取教师信息和学生列表：
从session中获取教师信息和学生列表：
jsp
Copy
     Teacher teacher = (Teacher) session.getAttribute("info");
     ArrayList<Student> stus = (ArrayList<Student>) session.getAttribute("onePageStudent");
     int sumIndex = (int) session.getAttribute("sumIndex");
页面结构：
**<div id="page" class="container">**：定义页面的主要容器。
头部：
显示教师头像和ID。
导航菜单：包括“个人信息”、“学生管理”、“成绩管理”和“退出登录”。
主要内容：
显示标题和分隔线。
添加学生按钮。
搜索学生表单。
学生信息表：遍历学生列表并生成表格行，表格中包含“修改”、“删除”和“查看成绩”按钮。
分页导航：
生成分页按钮：
jsp
Copy
     if (sumIndex > 1) {
         <div id="index">
             <a href="../one_page_student?index=1">首页</a>
             for (int i = 1; i <= sumIndex; i++) {
                 <a href="../one_page_student?index=<%=i%>">第<%=i%>页</a>
             }
             <a href="../one_page_student?index=<%=sumIndex%>">尾页</a>
         </div>
     }
添加学生信息对话框 添加学生信息对话框 --%>
<%--<div id="add-dialog" title="添加学生信息">--%>
<%--    <form id="add-form" method="post">--%>
<%--        <!-- 输入学号 -->--%>
<%--        学号:<input name="id" type="text"><br>--%>
<%--        <!-- 输入姓名 -->--%>
<%--        姓名:<input name="name" type="text"><br>--%>
<%--        <!-- 输入性别 -->--%>
<%--        性别:<input name="sex" type="text"><br>--%>
<%--        <!-- 输入专业 -->--%>
<%--        专业:<input name="major" type="text"><br>--%>
<%--        <!-- 输入入学日期 -->--%>
<%--        入学日期:<input name="school_date" type="month" style="width: 190px">--%>
<%--        <hr>--%>
<%--        <!-- 取消按钮，关闭对话框 -->--%>
<%--        <input style="float: right" type="submit" value="取消" onclick="function x() { $('#add-dialog').dialog('close'); }">--%>
<%--        <!-- 确定按钮，提交表单 -->--%>
<%--        <input style="float: right; margin-right: 25px" type="submit" value="确定" onclick="this.form.action='../add_student'">--%>
<%--    </form>--%>
<%--</div>--%>

<%--<style>--%>
<%--    /* 隐藏对话框的关闭按钮 */--%>
<%--    .ui-dialog-titlebar-close {--%>
<%--        display: none;--%>
<%--    }--%>
<%--</style>--%>

<%--<script>--%>
<%--    // 配置“添加学生信息”对话框属性--%>
<%--    $('#add-dialog').dialog({--%>
<%--        width: 310,--%>
<%--        autoOpen: false,--%>
<%--        draggable: false,--%>
<%--        modal: true,--%>
<%--        resizable: false--%>
<%--    });--%>

<%--    // 点击“添加学生”按钮时打开对话框--%>
<%--    $('.btn-add').click(function () {--%>
<%--        $('#add-dialog').dialog('open');--%>
<%--    });--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>
<%--详细注释解释：--%>
<%--添加学生信息对话框：--%>
<%--**<div id="add-dialog" title="添加学生信息">**：定义一个对话框用于添加学生信息。--%>
<%--**<form id="add-form" method="post">**：表单，用于输入学生的相关信息，并提交到服务器。--%>
<%--**<input name="id" type="text">**：输入学生ID。--%>
<%--**<input name="name" type="text">**：输入学生姓名。--%>
<%--**<input name="sex" type="text">**：输入学生性别。--%>
<%--**<input name="major" type="text">**：输入学生专业。--%>
<%--**<input name="school_date" type="month" style="width: 190px">**：输入学生的入学日期，格式为月份。--%>
<%--**<input style="float: right" type="submit" value="取消" onclick="function x() { $('#add-dialog').dialog('close'); }">**：--%>
<%--“取消”按钮，点击后关闭对话框。--%>
<%--**<input style="float: right; margin-right: 25px" type="submit" value="确定" onclick="this.form.action='../add_student'">**：--%>
<%--“确定”按钮，提交表单，并将表单的action设置为../add_student。--%>
<%--样式：--%>
<%--**<style>**：页内样式，用于隐藏对话框的关闭按钮。--%>
<%--css--%>
<%--Copy--%>
<%--.ui-dialog-titlebar-close {--%>
<%--display: none;--%>
<%--}--%>
<%--脚本：--%>
<%--**<script>**：配置和控制对话框的显示与隐藏。--%>
<%--javascript--%>
<%--Copy--%>
<%--// 配置“添加学生信息”对话框属性--%>
<%--$('#add-dialog').dialog({--%>
<%--width: 310,--%>
<%--autoOpen: false,--%>
<%--draggable: false,--%>
<%--modal: true,--%>
<%--resizable: false--%>
<%--});--%>

<%--// 点击“添加学生”按钮时打开对话框--%>
<%--$('.btn-add').click(function () {--%>
<%--$('#add-dialog').dialog('open');--%>
<%--});--%>
<%--这个JSP页面展示学生信息表，并通过对话框允许教师添加新学生信息。它提供了搜索功能、表格操作（修改和删除）以及分页导航。--%>