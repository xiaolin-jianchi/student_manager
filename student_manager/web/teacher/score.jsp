<%@ page import="vo.Teacher" %>
<%@ page import="vo.Score" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.StudentD" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>main</title>
    <link href="../resources/css/default.css" rel="stylesheet"/> <!-- 引入默认的CSS样式 -->
</head>
<body>
<%
    // 从session中获取教师信息和学生成绩列表
    Teacher teacher = (Teacher) session.getAttribute("info");
    ArrayList<Score> stus = (ArrayList<Score>) session.getAttribute("onePageScore");
    int sumIndex = (int) session.getAttribute("sumScoreIndex");
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
                <li><a href="personal.jsp">个人信息</a></li>
                <li><a href="../one_page_student">学生管理</a></li>
                <li class="current_page_item"><a href="../one_page_score">成绩管理</a></li>
                <li><a onclick="return confirm('确认退出?');" href="../exit">退出登录</a></li>
            </ul>
        </div>
    </div>
    <div id="main">
        <div class="top">
            <h2>学生成绩管理</h2>
            <hr/>
        </div>
        <form method="post" action="../update_score" style="height: 525px; margin-top: 20px">
            <!-- 导出EXCEL按钮 -->
            <input type="button" class="btn-add" onclick="location.href='score_excel.jsp';" value="导出EXCEL">
            <!-- 修改按钮 -->
            <input type="submit" class="btn-add" style="float: right;margin-bottom: 30px" value="修改">
            <div class="table" style="margin-top: 20px; height: 525px">
                <table id="table" width="800" frame="box" align="center">
                    <tr>
                        <!-- 表头 -->
                        <th height="35">学号</th>
                        <th>姓名</th>
                        <th>专业</th>
                        <th>数据库</th>
                        <th>Android</th>
                        <th>JavaWeb</th>
                    </tr>
                    <%
                        // 遍历学生成绩列表并生成表格行
                        try {
                            StudentD stuD = new StudentD();
                            for (Score stu : stus) {
                                String name = stuD.findWithId(stu.getId()).getName();
                                String major = stuD.findWithId(stu.getId()).getMajor();
                    %>
                    <tr>
                        <td height="35"><%=stu.getId()%></td>
                        <td><%=name%></td>
                        <td><%=major%></td>
                        <td><input value="<%=stu.getDatabase()%>" name="database" class="table-input"></td>
                        <td><input value="<%=stu.getAndroid()%>" name="android" class="table-input"></td>
                        <td><input value="<%=stu.getJsp()%>" name="jsp" class="table-input"></td>
                        <input value="<%=stu.getId()%>" name="id" type="hidden">
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </table>

            </div>
        </form>

        <%
            // 如果成绩记录超过一页，显示分页按钮
            if (sumIndex > 1){
        %>
        <div id="index">
            <a href="../one_page_score?index=1">首页</a>
            <%
                for (int i = 1; i <= sumIndex; i++) {
            %>
            <a href="../one_page_score?index=<%=i%>">第<%=i%>页</a>
            <%
                }
            %>
            <a href="../one_page_score?index=<%=sumIndex%>">尾页</a>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
<%--页面指令：
导入类和包：
jsp
Copy
     <%@ page import="vo.Teacher" %>
     <%@ page import="vo.Score" %>
     <%@ page import="java.util.ArrayList" %>
     <%@ page import="dao.StudentD" %>
     <%@ page contentType="text/html;charset=UTF-8" language="java" %>
HTML 声明：
**<!DOCTYPE html>**：定义文档类型为HTML5。
**<html>**：HTML文档的根元素。
头部元素：
引入CSS文件：
jsp
Copy
     <head>
         <title>main</title>
         <link href="../resources/css/default.css" rel="stylesheet"/>
     </head>
获取教师信息和学生成绩列表：
jsp
Copy
   <%
       Teacher teacher = (Teacher) session.getAttribute("info");
       ArrayList<Score> stus = (ArrayList<Score>) session.getAttribute("onePageScore");
       int sumIndex = (int) session.getAttribute("sumScoreIndex");
   %>
页面结构：
**<div id="page" class="container">**：定义页面的主要容器。
头部：
jsp
Copy
       <div id="header">
           <div id="logo">
               <img src="../userImg/<%=teacher.getId()%>.jpeg"/>
               <h1><%=teacher.getId()%></h1>
           </div>
           <div id="menu">
               <ul>
                   <li><a href="personal.jsp">个人信息</a></li>
                   <li><a href="../one_page_student">学生管理</a></li>
                   <li class="current_page_item"><a href="../one_page_score">成绩管理</a></li>
                   <li><a onclick="return confirm('确认退出?');" href="../exit">退出登录</a></li>
               </ul>
           </div>
       </div>
主要内容：
jsp
Copy
       <div id="main">
           <div class="top">
               <h2>学生成绩管理</h2>
               <hr/>
           </div>
成绩管理表单：
表单元素：
jsp
Copy
     <form method="post" action="../update_score" style="height: 525px; margin-top: 20px">
         <input type="button" class="btn-add" onclick="location.href='score_excel.jsp';" value="导出EXCEL">
         <input type="submit" class="btn-add" style="float: right;margin-bottom: 30px" value="修改">
         <div class="table" style="margin-top: 20px; height: 525px">
             <table id="table" width="800" frame="box" align="center">
                 <tr>
                     <th height="35">学号</th>
                     <th>姓名</th>
                     <th>专业</th>
                     <th>数据库</th>
                     <th>Android</th>
                     <th>JavaWeb</th>
                 </tr>
遍历学生成绩列表并生成表格行：
jsp
Copy
   <%
       try {
           StudentD stuD = new StudentD();
           for (Score stu : stus) {
               String name = stuD.findWithId(stu.getId()).getName();
               String major = stuD.findWithId(stu.getId()).getMajor();
   %>
   <tr>
       <td height="35"><%=stu.getId()%></td>
       <td><%=name%></td>
       <td><%=major%></td>
       <td><input value="<%=stu.getDatabase()%>" name="database" class="table-input"></td>
       <td><input value="<%=stu.getAndroid()%>" name="android" class="table-input"></td>
       <td><input value="<%=stu.getJsp()%>" name="jsp" class="table-input"></td>
       <input value="<%=stu.getId()%>" name="id" type="hidden">
   </tr>
   <%
           }
       } catch (Exception e) {
           e.printStackTrace();
       }
   %>
分页导航：
生成分页按钮：
jsp
Copy
     <%
         if (sumIndex > 1){
     %>
             <div id="index">
                 <a href="../one_page_score?index=1">首页</a>
                 <%
                     for (int i = 1; i <= sumIndex; i++) {
                 %>
                 <a href="../one_page_score?index=<%=i%>">第<%=i%>页</a>
                 <%
                     }
                 %>
                 <a href="../one_page_score?index=<%=sumIndex%>">尾页</a>
             </div>
     <%
         }
     %>
    </div>
</div>
</body>
</html>
详细注释解释：
分页导航：
显示分页按钮：
jsp
Copy
     <%
         if (sumIndex > 1){
     %>
             <div id="index">
                 <a href="../one_page_score?index=1">首页</a>
                 <%
                     for (int i = 1; i <= sumIndex; i++) {
                 %>
                 <a href="../one_page_score?index=<%=i%>">第<%=i%>页</a>
                 <%
                     }
                 %>
                 <a href="../one_page_score?index=<%=sumIndex%>">尾页</a>
             </div>
     <%
         }
     %>
分页导航解释：
如果 sumIndex 大于 1，则表示学生成绩分页。
**<a href="../one_page_score?index=1">首页</a>**：导航到首页。
使用 for 循环生成页面链接：
jsp
Copy
       <%
           for (int i = 1; i <= sumIndex; i++) {
       %>
       <a href="../one_page_score?index=<%=i%>">第<%=i%>页</a>
       <%
           }
       %>
**<a href="../one_page_score?index=<%=sumIndex%>">尾页</a>**：导航到尾页。
关闭标签：
关闭主要内容区域的 div 标签：
jsp
Copy
          </div>
关闭页面的 div 标签：
jsp
Copy
      </div>
关闭 body 和 html 标签：
jsp
Copy
      </body>
      </html>
这个JSP页面用于显示和管理学生的成绩，包括分页显示、成绩修改和导出Excel功能。此外，还提供了导航菜单，允许教师在不同功能页面之间切换。--%>