<%@ page import="dao.StudentD" %>
<%@ page import="vo.Student" %>
<%@ page import="dao.ScoreD" %>
<%@ page import="vo.Score" %>
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
    <title>main</title>
    <link href="../resources/css/default.css" rel="stylesheet"/>
</head>
<body>
<%
    // 从session中获取学生信息
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
                <li><a href="personal.jsp">个人信息</a></li>
                <li class="current_page_item"><a href="main.jsp">成绩信息</a></li>
                <li><a onclick="return confirm('确认退出?');" href="../exit">退出登录</a></li>
            </ul>
        </div>
    </div>
    <div id="main">
        <div class="top">
            <!-- 成绩信息标题 -->
            <h2>成绩信息</h2>
            <hr/>
        </div>
        <div class="table">
            <table width="800" frame="box" align="center">
                <tr>
                    <!-- 表头 -->
                    <th height="35">学号</th>
                    <th>姓名</th>
                    <th>专业</th>
                    <th>数据库</th>
                    <th>Android</th>
                    <th>JavaWeb</th>
                    <th>操作</th>
                </tr>
                <%
                    try {
                        // 实例化ScoreD和StudentD对象
                        ScoreD scoD = new ScoreD();
                        StudentD stuD = new StudentD();

                        // 根据学生ID获取成绩信息和学生信息
                        Score stu = scoD.findWithId(student.getId());
                        String name = stuD.findWithId(student.getId()).getName();
                        String major = stuD.findWithId(student.getId()).getMajor();
                %>
                <tr>
                    <!-- 表格内容 -->
                    <td height="35"><%=stu.getId()%></td>
                    <td><%=name%></td>
                    <td><%=major%></td>
                    <td><%=stu.getDatabase()%></td>
                    <td><%=stu.getAndroid()%></td>
                    <td><%=stu.getJsp()%></td>
                    <!-- 链接到生成PDF的页面 -->
                    <td><a href="pdf.jsp?id=<%=stu.getId()%>&name=<%=name%>&major=<%=major%>&database=<%=stu.getDatabase()%>&android=<%=stu.getAndroid()%>&jsp=<%=stu.getJsp()%>">PDF</a></td>
                </tr>
                <%
                    } catch (Exception e) {
                        // 输出异常信息
                        out.print(e);
                    }
                %>
            </table>
        </div>
    </div>
</div>
</body>
</html>
<%--**<%@ page import="dao.StudentD" %>**：导入dao.StudentD类。
**<%@ page import="vo.Student" %>**：导入vo.Student类。
**<%@ page import="dao.ScoreD" %>**：导入dao.ScoreD类。
**<%@ page import="vo.Score" %>**：导入vo.Score类。
**<%@ page contentType="text/html;charset=UTF-8" language="java" %>**：设置页面的内容类型为HTML，字符编码为UTF-8，语言为Java。
HTML 标记：
**<!DOCTYPE html>**：定义文档类型为HTML 5。
**<html>**：HTML文档的根元素。
**<head>**：包含文档的元数据，如标题和样式表。
**<title>**：文档的标题，为main。
**<link>**：链接到外部CSS样式表。
JSP 脚本元素：
**<% Student student = (Student) session.getAttribute("info"); %>**：从会话中获取info属性，并将其转换为Student对象。
页面结构：
**<div id="page" class="container">**：定义页面的主要容器。
**<div id="header">**：定义页面头部区域。
**<div id="logo">**：显示学生头像和姓名。
**<div id="menu">**：定义导航菜单。
**<div id="main">**：定义主要内容区域。
**<div class="top">**：显示成绩信息标题和分隔线。
**<div class="table">**：定义成绩表格。
**<table>**：成绩表格的结构。
**<tr>**：表格的行。
**<th>**：表格头部的每个单元格。
JSP 脚本元素：
<% 和 **%>**：包含Java代码的脚本片段。
数据获取和展示：
try 块：
实例化ScoreD和StudentD对象。
根据学生ID获取成绩和相关学生信息。
使用循环展示每个学生的成绩信息。
catch (Exception e) 块：
捕获异常，输出异常信息。
生成PDF：
**<a href="pdf.jsp?...">PDF</a>**：链接到生成PDF的页面，并传递必要的数据作为查询参数。--%>