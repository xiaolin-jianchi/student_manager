<%@ page import="dao.TeacherD" %>
<%@ page import="dao.StudentD" %>
<%@ page import="vo.Teacher" %>
<%@ page import="vo.Student" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>检查Cookie</title>
</head>
<body>
<%
    // 创建Data Access Object (DAO) 实例
    TeacherD teacherD = new TeacherD();
    StudentD studentD = new StudentD();

    // 初始化Teacher和Student对象
    Teacher teacher = null;
    Student student = null;

    // 获取请求中的Cookie数组
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            String cookieName = c.getName();
            // 检查Cookie名称是否为"name"
            if ("name".equals(cookieName)) {
                String user = c.getValue();
                try {
                    // 查询教师和学生信息
                    teacher = teacherD.findWithId(user);
                    student = studentD.findWithId(user);
                } catch (Exception e) {
                    out.print(e);
                }
                // 如果查询到教师信息，设置会话属性并重定向到教师页面
                if (teacher != null) {
                    session.setAttribute("info", teacher);
                    response.sendRedirect("one_page_student");
                    return;
                }
                // 如果查询到学生信息，设置会话属性并重定向到学生页面
                else if(student != null){
                    session.setAttribute("info", student);
                    response.sendRedirect("student/main.jsp");
                    return;
                }
            }
        }
    }
    // 如果没有匹配的Cookie，重定向到登录页面
    response.sendRedirect("login.jsp");
%>
</body>
</html>
<%--页面指令：
导入类和包：
jsp
Copy
     <%@ page import="dao.TeacherD" %>
     <%@ page import="dao.StudentD" %>
     <%@ page import="vo.Teacher" %>
     <%@ page import="vo.Student" %>
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
包含文档的元数据如标题：
jsp
Copy
     <head>
         <title>检查Cookie</title>
     </head>
主体元素：
定义文档的主体部分：
jsp
Copy
     <body>
创建DAO实例：
实例化教师和学生的DAO对象：
jsp
Copy
     TeacherD teacherD = new TeacherD();
     StudentD studentD = new StudentD();
初始化教师和学生对象：
jsp
Copy
   Teacher teacher = null;
   Student student = null;
获取请求中的Cookies：
jsp
Copy
   Cookie[] cookies = request.getCookies();
   if (cookies != null) {
       for (Cookie c : cookies) {
           String cookieName = c.getName();
           // 检查Cookie名称是否为"name"
           if ("name".equals(cookieName)) {
               String user = c.getValue();
               try {
                   // 查询教师和学生信息
                   teacher = teacherD.findWithId(user);
                   student = studentD.findWithId(user);
               } catch (Exception e) {
                   out.print(e);
               }
               // 如果查询到教师信息，设置会话属性并重定向到教师页面
               if (teacher != null) {
                   session.setAttribute("info", teacher);
                   response.sendRedirect("one_page_student");
                   return;
               }
               // 如果查询到学生信息，设置会话属性并重定向到学生页面
               else if(student != null){
                   session.setAttribute("info", student);
                   response.sendRedirect("student/main.jsp");
                   return;
               }
           }
       }
   }
处理重定向：
如果没有匹配的Cookie，重定向到登录页面：
jsp
Copy
     response.sendRedirect("login.jsp");
关闭HTML标签：
关闭body 和 html标签：
jsp
Copy
     </body>
     </html>
这个JSP页面用于检查客户端发送的Cookie，验证其中是否包含名为"name"的Cookie。如果找到，则使用该Cookie的值查询教师或学生信息，并将信息存储在会话中，并根据角色类型重定向到相应的页面。如果没有找到匹配的Cookie，页面将重定向到登录页面。--%>