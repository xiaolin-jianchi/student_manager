<%@ page import="dao.TeacherD" %>
<%@ page import="dao.StudentD" %>
<%@ page import="vo.Student" %>
<%@ page import="vo.Teacher" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="java.util.Date" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>验证码</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link href="resources/css/forget.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<h1 style="margin: 50px 80px; color: darkgray; font-family: cursive;">欢迎来到教务系统</h1>
<%
    // 获取用户输入的账号
    String id = request.getParameter("user");

    // 获取DAO实例
    TeacherD teacherD = new TeacherD();
    StudentD studentD = new StudentD();

    // 初始化Teacher和Student对象
    Teacher teacher = null;
    Student student = null;

    try {
        // 根据账号查询教师和学生信息
        teacher = teacherD.findWithId(id);
        student = studentD.findWithId(id);
    } catch (Exception e) {
        out.print(e);
    }

    // 如果是教师
    if (teacher != null) {
        if (teacher.getEmail() == null){
%>
<script>
    alert("该教师未设置安全邮箱!");
    window.location.href = 'login.jsp';
</script>
<%
} else {
    // 生成四位随机验证码
    int x = (int) (1000 + Math.random() * (9999 - 1000 + 1));
    String toMail = teacher.getEmail();
    String title = "验证码";
    String content = Integer.toString(x);

    try {
        // 配置邮件发送的属性
        Properties prop = new Properties();
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); // 开启TLS协议
        prop.put("mail.smtp.host", "smtp.163.com");
        prop.put("mail.smtp.port", "465"); // SSL加密端口
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); // 指定使用SSL加密

        Session s = Session.getInstance(prop, new javax.mail.Authenticator() {
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication("m18707503964@163.com", "DBLNQESTGNOMUSLO");
            }
        });

        // 创建MimeMessage对象
        MimeMessage message = new MimeMessage(s);
        message.setFrom(new InternetAddress("m18707503964@163.com"));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
        message.setSubject(title);
        message.setContent(content, "text/plain;charset=utf-8");
        message.setSentDate(new Date());
        message.saveChanges();

        // 发送邮件
        Transport transport = s.getTransport("smtp");
        transport.connect();
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();

        // 将验证码存入session
        session.setAttribute("reset", content);
%>
<script>
    alert("发送成功，请到邮箱\"<%=toMail%>\"查收验证码");
</script>
<div class="main">
    <form role="form" action="teacher/resetPassword.jsp" method="post">
        <div class="form-group" align="center">
            <input class="form-control" type="text" name="reset" placeholder="验证码"><br>
            <input type="hidden" name="id" value="<%=id%>">
            <input type="submit" class="btn btn-success" value="下一步">
            <input type="button" class="btn btn-info" value="取消" style="margin-left: 20px" onclick="window.location.href='login.jsp'">
        </div>
    </form>
</div>
<%
        } catch (Exception e) {
            out.print(e);
        }
    }
} else if (student != null) {
    if (student.getEmail() == null) {
%>
<script>
    alert("该学生未设置安全邮箱!");
    window.location.href = 'login.jsp';
</script>
<%
} else {
    // 生成四位随机验证码
    int x = (int) (1000 + Math.random() * (9999 - 1000 + 1));
    String toMail = student.getEmail();
    String title = "验证码";
    String content = Integer.toString(x);

    try {
        // 配置邮件发送的属性
        Properties prop = new Properties();
        prop.put("mail.smtp.auth", true);
        prop.put("mail.smtp.starttls.enable", "true"); //TLS协议
        prop.put("mail.smtp.host", "smtp.qq.com");
        prop.put("mail.smtp.port", "587");

        Session s = Session.getInstance(prop, new javax.mail.Authenticator() {
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication("434935656@qq.com", "ylwaxdtbeogbcacc");
            }
        });

        // 创建MimeMessage对象
        MimeMessage message = new MimeMessage(s);
        message.setFrom(new InternetAddress("434935656@qq.com"));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
        message.setSubject(title);
        message.setContent(content, "text/plain;charset=utf-8");
        message.setSentDate(new Date());
        message.saveChanges();

        // 发送邮件
        Transport transport = s.getTransport("smtp");
        transport.connect();
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();

        // 将验证码存入session
        session.setAttribute("reset", content);
%>
<script>
    alert("发送成功，请到邮箱\"<%=toMail%>\"查收验证码");
</script>
<div class="main">
    <form role="form" action="student/resetPassword.jsp" method="post">
        <div class="form-group" align="center">
            <input class="form-control" type="text" name="reset" placeholder="验证码"><br>
            <input type="hidden" name="id" value="<%=id%>">
            <input name="email" value="<%=toMail%>" type="hidden">
            <input type="submit" class="btn btn-success" value="下一步">
            <input type="button" class="btn btn-info" value="取消" style="margin-left: 20px" onclick="window.location.href='login.jsp'">
        </div>
    </form>
</div>
<%
        } catch (Exception e) {
            out.print(e);
        }
    }
} else {
%>
<script>
    alert("该用户不存在!");
    window.location.href = 'forget.jsp';
</script>
<%
    }
%>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
<%--页面指令：
导入类和包：
jsp
Copy
     <%@ page import="dao.TeacherD" %>
     <%@ page import="dao.StudentD" %>
     <%@ page import="vo.Student" %>
     <%@ page import="vo.Teacher" %>
     <%@ page import="java.util.Properties" %>
     <%@ page import="javax.mail.Session" %>
     <%@ page import="javax.mail.internet.MimeMessage" %>
     <%@ page import="javax.mail.internet.InternetAddress" %>
     <%@ page import="javax.mail.Message" %>
     <%@ page import="java.util.Date" %>
     <%@ page import="javax.mail.Transport" %>
设置页面内容类型：
jsp
Copy
     <%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
         <meta charset="UTF-8">
         <title>验证码</title>
         <link rel="stylesheet" href="resources/css/bootstrap.min.css">
         <link href="resources/css/forget.css" type="text/css" rel="stylesheet"/>
     </head>
主体元素：
页面标题：
jsp
Copy
     <body>
     <h1 style="margin: 50px 80px; color: darkgray; font-family: cursive;">欢迎来到教务系统</h1>
获取用户输入的账号：
jsp
Copy
     <%
         String id = request.getParameter("user");
     %>
获取DAO实例：
jsp
Copy
     TeacherD teacherD = new TeacherD();
     StudentD studentD = new StudentD();
初始化Teacher和Student对象：
jsp
Copy
     Teacher teacher = null;
     Student student = null;
根据账号查询教师和学生信息：
jsp
Copy
     try {
         teacher = teacherD.findWithId(id);
         student = studentD.findWithId(id);
     } catch (Exception e) {
         out.print(e）     }
处理教师和学生信息：
处理教师信息：
jsp
Copy
     // 如果是教师
     if (teacher != null) {
         if (teacher.getEmail() == null){
     %>
             <script>
                 alert("该教师未设置安全邮箱!");
                 window.location.href = 'login.jsp';
             </script>
     <%
         } else {
             // 生成四位随机验证码
             int x = (int) (1000 + Math.random() * (9999 - 1000 + 1));
             String toMail = teacher.getEmail();
             String title = "验证码";
             String content = Integer.toString(x);

             try {
                 // 配置邮件发送的属性
                 Properties prop = new Properties();
                 prop.put("mail.smtp.auth", true);
                 Session s = Session.getInstance(prop);

                 // 创建MimeMessage对象
                 MimeMessage message = new MimeMessage(s);
                 message.setFrom(new InternetAddress("434935656@qq.com"));
                 message.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
                 message.setSubject(title);
                 message.setContent(content, "text/plain;charset=utf-8");
                 message.setSentDate(new Date());
                 message.saveChanges();

                 // 发送邮件
                 Transport transport = s.getTransport("smtp");
                 transport.connect("smtp.qq.com", "434935656@qq.com", "ylwaxdtbeogbcacc");
                 transport.sendMessage(message, message.getAllRecipients());
                 transport.close();

                 // 将验证码存入session
                 session.setAttribute("reset", content);
     %>
                 <script>
                     alert("发送成功，请到邮箱\"<%=toMail%>\"查收验证码");
                 </script>
                 <div class="main">
                     <form role="form" action="teacher/resetPassword.jsp" method="post">
                         <div class="form-group" align="center">
                             <input class="form-control" type="text" name="reset" placeholder="验证码"><br>
                             <input type="hidden" name="id" value="<%=id%>">
                             <input type="submit" class="btn btn-success" value="下一步">
                             <input type="button" class="btn btn-info" value="取消" style="margin-left: 20px" onclick="window.location.href='login.jsp'">
                         </div>
                     </form>
                 </div>
     <%
             } catch (Exception e) {
                 out.print(e);
             }
         }
处理学生信息：
判断是否为学生：
jsp
Copy
     } else if (student != null) {
         if (student.getEmail() == null) {
     %>
             <script>
                 alert("该学生未设置安全邮箱!");
                 window.location.href = 'login.jsp';
             </script>
     <%
         } else {
             // 生成四位随机验证码
             int x = (int) (1000 + Math.random() * (9999 - 1000 + 1));
             String toMail = student.getEmail();
             String title = "验证码";
             String content = Integer.toString(x);

             try {
                 // 配置邮件发送的属性
                 Properties prop = new Properties();
                 prop.put("mail.smtp.auth", true);
                 Session s = Session.getInstance(prop);

                 // 创建MimeMessage对象
                 MimeMessage message = new MimeMessage(s);
                 message.setFrom(new InternetAddress("434935656@qq.com"));
                 message.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
                 message.setSubject(title);
                 message.setContent(content, "text/plain;charset=utf-8");
                 message.setSentDate(new Date());
                 message.saveChanges();

                 // 发送邮件
                 Transport transport = s.getTransport("smtp");
                 transport.connect("smtp.qq.com", "434935656@qq.com", "ylwaxdtbeogbcacc");
                 transport.sendMessage(message, message.getAllRecipients());
                 transport.close();

                 // 将验证码存入session
                 session.setAttribute("reset", content);
     %>
                 <script>
                     alert("发送成功，请到邮箱\"<%=toMail%>\"查收验证码");
                 </script>
                 <div class="main">
                     <form role="form" action="student/resetPassword.jsp" method="post">
                         <div class="form-group" align="center">
                             <input class="form-control" type="text" name="reset" placeholder="验证码"><br>
                             <input type="hidden" name="id" value="<%=id%>">
                             <input name="email" value="<%=toMail%>" type="hidden">
                             <input type="submit" class="btn btn-success" value="下一步">
                             <input type="button" class="btn btn-info" value="取消" style="margin-left: 20px" onclick="window.location.href='login.jsp'">
                         </div>
                     </form>
                 </div>
     <%
             } catch (Exception e) {
                 out.print(e);
             }
         }
处理用户不存在的情况：
用户不存在时显示提示信息并重定向到forget.jsp页面：
jsp
Copy
     } else {
     %>
         <script>
             alert("该用户不存在!");
             window.location.href = 'forget.jsp';
         </script>
     <%
     }
引入外部JS文件：
引入jQuery、Popper.js和Bootstrap的JS文件：
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
功能总结：
这个JSP页面用于处理忘记密码功能，具体步骤如下：
用户输入账号后，系统检查该账号是否是教师或学生。
如果是教师或学生且设置了安全邮箱，系统生成一个四位随机验证码，并通过邮件发送到用户的安全邮箱。
将验证码存入会话(session)中，并提示用户检查邮箱。
用户输入收到的验证码后，可以继续重置密码的步骤。
如果账号不存在或账号没有设置安全邮箱，系统提示用户相应的错误信息，并重定向到登录页面或忘记密码页面。--%>