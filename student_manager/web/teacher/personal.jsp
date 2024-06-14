<%@ page import="vo.Teacher" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>main</title>
    <link href="../resources/css/default.css" rel="stylesheet"/> <!-- 引入默认的CSS样式 -->
</head>
<body>
<%
    // 从session中获取教师信息
    Teacher teacher = (Teacher) session.getAttribute("info");
%>
<div id="page" class="container">
    <div id="header">
        <div id="logo">
            <!-- 显示教师的头像和ID -->
            <img src="../userImg/<%=teacher.getId()%>.jpeg"/>
            <h1><%=teacher.getId()%></h1>
        </div>
        <div id="menu">
            <ul>
                <!-- 导航菜单 -->
                <li class="current_page_item"><a href="personal.jsp">个人信息</a></li>
                <li><a href="../one_page_student">学生管理</a></li>
                <li><a href="../one_page_score">成绩管理</a></li>
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
            <!-- 显示教师的头像 -->
            <img src="../userImg/<%=teacher.getId()%>.jpeg" class="personalImg"><br>
            <!-- 上传头像表单 -->
            <form action="../upload_teacherImg" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="<%=teacher.getId()%>">
                <input type="file" name="img">
                <input type="submit" value="上传头像">
            </form>
            <!-- 更新教师信息表单 -->
            <form method="post" action="../update_teacher" class="personalForm">
                <input name="uid" value="<%=teacher.getId()%>" type="hidden">
                姓名: <input type="text" name="name" value="<%=teacher.getName()%>" class="personalInput"><br>
                性别: <input type="text" name="sex" value="<%=teacher.getSex()%>" class="personalInput"><br>
                邮箱: <input type="text" name="email" value="<%=teacher.getEmail()%>" class="personalInput"><br>
                密码: <input type="text" name="password" value="<%=teacher.getPassword()%>" class="personalInput"><br>
                <input type="submit" value="保存" style="width: 100px; height: 30px; margin-top: 20px">
            </form>
        </div>
    </div>
</div>
</body>
</html>
<%--页面指令：
**<%@ page import="vo.Teacher" %>**：导入 Teacher 类。
设置页面内容类型：
**<%@ page contentType="text/html;charset=UTF-8" language="java" %>**：设置页面的内容类型为HTML，字符编码为UTF-8，语言为Java。
HTML 声明：
**<!DOCTYPE html>**：定义文档类型为HTML5。
**<html>**：HTML文档的根元素。
头部元素：
**<head>**：包含文档的元数据，如标题和链接到CSS文件。
**<link href="../resources/css/default.css" rel="stylesheet"/>**：链接到默认的CSS样式文件。
主体：
**<body>**：定义文档的主体部分。
获取教师信息：
**<% Teacher teacher = (Teacher) session.getAttribute("info"); %>**：从session中获取教师信息，并赋值给变量 teacher。
页面主体结构：
**<div id="page" class="container">**：定义页面的主要容器。
头部：
**<div id="header">**：定义页面的头部。
**<div id="logo">**：显示教师的头像和ID。
jsp
Copy
         <img src="../userImg/<%=teacher.getId()%>.jpeg"/>
         <h1><%=teacher.getId()%></h1>
导航菜单：
jsp
Copy
         <div id="menu">
             <ul>
                 <li class="current_page_item"><a href="personal.jsp">个人信息</a></li>
                 <li><a href="../one_page_student">学生管理</a></li>
                 <li><a href="../one_page_score">成绩管理</a></li>
                 <li><a onclick="return confirm('确认退出?');" href="../exit">退出登录</a></li>
             </ul>
         </div>
主要内容：
**<div id="main">**：定义主要内容区域。
标题和分隔线：
jsp
Copy
         <div class="top">
             <h2>个人信息</h2>
             <hr/>
         </div>
个人信息区域：
显示教师的头像：
jsp
Copy
     <img src="../userImg/<%=teacher.getId()%>.jpeg" class="personalImg"><br>
上传头像表单：
jsp
Copy
     <form action="../upload_teacherImg" method="post" enctype="multipart/form-data">
         <input type="hidden" name="id" value="<%=teacher.getId()%>">
         <input type="file" name="img">
         <input type="submit" value="上传头像">
     </form>
更新教师信息表单：
jsp
Copy
     <form method="post" action="../update_teacher" class="personalForm">
         <input name="uid" value="<%=teacher.getId()%>" type="hidden">
         姓名: <input type="text" name="name" value="<%=teacher.getName()%>" class="personalInput"><br>
         性别: <input type="text" name="sex" value="<%=teacher.getSex()%>" class="personalInput"><br>
         邮箱: <input type="text" name="email" value="<%=teacher.getEmail()%>" class="personalInput"><br>
         密码: <input type="text" name="password" value="<%=teacher.getPassword()%>" class="personalInput"><br>
         <input type="submit" value="保存" style="width: 100px; height: 30px; margin-top: 20px">
     </form>
这个JSP页面用于显示教师的个人信息，并提供上传头像和更新教师信息的功能--%>