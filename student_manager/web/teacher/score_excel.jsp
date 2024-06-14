<%@ page import="dao.ScoreD" %>
<%@ page import="vo.Score" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.StudentD" %>

<%@ page contentType="application/msexcel" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>main</title>
    </head>
    <body>
        <%
            out.clearBuffer();
            response.setHeader("Content-Disposition", "attachment;filename=excel.xls");
        %>
        <table align="center" border="1">
            <tr>
                <th height="35">学号</th>
                <th>姓名</th>
                <th>专业</th>
                <th>数据库</th>
                <th>Android</th>
                <th>JavaWeb</th>
            </tr>
            <%
                try {
                    ScoreD scoD = new ScoreD();
                    StudentD stuD = new StudentD();
                    ArrayList<Score> stus = scoD.getOnePage(1, 10000);
                    for (Score stu : stus) {
                        String name = stuD.findWithId(stu.getId()).getName();
                        String major = stuD.findWithId(stu.getId()).getMajor();
            %>
            <tr>
                <td align="center"><%=stu.getId()%></td>
                <td align="center"><%=name%></td>
                <td align="center"><%=major%></td>
                <td align="center"><%=stu.getDatabase()%></td>
                <td align="center"><%=stu.getAndroid()%></td>
                <td align="center"><%=stu.getJsp()%></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </body>
</html>

<%--页面指令：
导入类和包：
jsp
Copy
     <%@ page import="dao.ScoreD" %>
     <%@ page import="vo.Score" %>
     <%@ page import="java.util.ArrayList" %>
     <%@ page import="dao.StudentD" %>
设置页面内容类型：
jsp
Copy
     <%@ page contentType="application/msexcel" language="java" pageEncoding="UTF-8" %>
HTML 声明：
**<!DOCTYPE html>**：定义文档类型为HTML5。
**<html>**：HTML文档的根元素。
头部元素：
**<title>**：定义文档的标题。
jsp
Copy
     <head>
         <title>生成成绩Excel</title>
     </head>
主体：
**<body>**：定义文档的主体部分。
设置响应头以生成Excel文件：
jsp
Copy
     <%
         out.clearBuffer();
         response.setHeader("Content-Disposition", "attachment;filename=excel.xls");
     %>
**out.clearBuffer();**：清除缓冲区。
**response.setHeader("Content-Disposition", "attachment;filename=excel.xls");**：设置响应头，指明文件的下载名为 excel.xls。
生成表格：
表头：
jsp
Copy
     <table align="center" border="1">
         <tr>
             <th height="35">学号</th>
             <th>姓名</th>
             <th>专业</th>
             <th>数据库</th>
             <th>Android</th>
             <th>JavaWeb</th>
         </tr>
获取学生成绩：
jsp
Copy
   <%
       try {
           // 实例化ScoreD和StudentD对象
           ScoreD scoD = new ScoreD();
           StudentD stuD = new StudentD();

           // 获取所有学生成绩（假设最多有10000条记录）
           ArrayList<Score> stus = scoD.getOnePage(1, 10000);

           // 遍历成绩列表，生成表格行
           for (Score stu : stus) {
               String name = stuD.findWithId(stu.getId()).getName();
               String major = stuD.findWithId(stu.getId()).getMajor();
   %>
生成表格行：
创建表格行并填充数据：
jsp
Copy
     <tr>
         <!-- 学生信息和成绩 -->
         <td align="center"><%=stu.getId()%></td>
         <td align="center"><%=name%></td>
         <td align="center"><%=major%></td>
         <td align="center"><%=stu.getDatabase()%></td>
         <td align="center"><%=stu.getAndroid()%></td>
         <td align="center"><%=stu.getJsp()%></td>
     </tr>
捕获异常：
捕获并打印异常：
jsp
Copy
     <%
             }
         } catch (Exception e) {
             e.printStackTrace();
         }
     %>
关闭标签：
关闭表格、主体和HTML：
jsp
Copy
     </table>
     </body>
     </html>--%>