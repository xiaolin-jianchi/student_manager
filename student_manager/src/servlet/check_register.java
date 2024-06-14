package servlet;

import dao.TeacherD;
import vo.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

// 使用注解方式定义Servlet，处理/check_register路径的请求
@WebServlet("/check_register")
public class check_register extends HttpServlet {

    // 处理POST请求
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置响应内容类型和字符编码
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        // 设置请求字符编码
        request.setCharacterEncoding("utf-8");

        // 获取表单参数
        String email = request.getParameter("email");
        String user = request.getParameter("user");
        String password = request.getParameter("password1");
        String code = request.getParameter("code");

        // 获取输出流，用于向客户端输出信息
        PrintWriter out = response.getWriter();
        // 获取会话对象
        HttpSession session = request.getSession();

        // 从会话中获取验证码
        String randStr = (String) session.getAttribute("randStr");

        // 检查验证码是否正确
        if (!code.equals(randStr)) {
            // 如果验证码错误，提示用户并重定向到注册页面
            out.print("<script>alert(\"验证码错误！\");location.href = \"register.jsp\";</script>");
        } else {
            // 验证码正确，进行用户注册操作

            // 创建TeacherD对象用于访问数据库
            TeacherD teacherD = new TeacherD();
            Teacher teacher = null;

            try {
                // 插入教师记录
                teacher = teacherD.insertTeacher(user, password, email);
            } catch (Exception e) {
                // 输出异常信息
                out.print(e);
            }

            if (teacher != null) {
                // 如果教师对象不为空，说明注册成功
                // 向会话对象中添加用户信息
                session.setAttribute("info", teacher);
                // 重定向到学生页面
                response.sendRedirect("one_page_student");
            } else {
                // 如果教师对象为空，说明用户已存在，提示用户并重定向到注册页面
                out.print("<script>alert(\"此用户已经注册！\");location.href = \"register.jsp\";</script>");
            }
        }
    }

    // 处理GET请求（这里未实现具体逻辑）
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 处理GET请求的逻辑可以根据需要实现
    }
}
//代码解释
//        类上的@WebServlet注解：
//@WebServlet("/check_register")：指明该Servlet的访问路径是/check_register。
//        doPost方法：
//        设置响应内容类型和字符编码：确保正确处理中文等多字节字符。
//        设置请求字符编码：确保从请求中获取的参数不会出现乱码。
//        获取表单参数：包括邮箱（email）、用户名（user）、密码（password1）和验证码（code）。
//        获取输出流：用于向客户端输出信息。
//        获取会话对象：从请求中获取HttpSession对象，通过它可以在服务器端存储和获取用户信息。
//        从会话中获取验证码：获取会话中存储的验证码字符串。
//        检查验证码是否正确：如果验证码不匹配，输出错误信息并重定向到注册页面。
//        创建TeacherD对象：用于插入教师记录。
//        插入教师记录：如果插入成功，将教师对象存储到会话中，并重定向到学生页面；否则，输出错误信息并重定向到注册页面。
//        会话和cookie处理：
//        会话（session）：用于在用户会话期间存储用户信息。
//        cookie：用于在客户端存储用户信息（如保持登录状态），并在未来的请求中带回服务器。
//        doGet方法：
//        由于注册操作通常使用POST请求，这里未实现具体逻辑。可以根据需要添加GET请求的处理逻辑。