package servlet;

import dao.StudentD;
import dao.TeacherD;
import vo.Student;
import vo.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

// 使用注解方式定义Servlet，处理/check_login路径的请求
@WebServlet("/check_login")
public class check_login extends HttpServlet {

    // 处理POST请求
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 将POST请求转发到doGet方法进行处理
        this.doGet(request, response);
    }

    // 处理GET请求
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置响应内容类型和字符编码
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        // 获取输出流，用于向客户端输出信息
        PrintWriter out = response.getWriter();

        // 获取会话对象
        HttpSession session = request.getSession();

        // 获取请求参数：用户名、密码和是否记住登录状态
        String user = request.getParameter("user");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        // 创建DAO对象，用于访问数据库
        TeacherD teacherD = new TeacherD();
        StudentD studentD = new StudentD();
        Teacher teacher = null;
        Student student = null;

        try {
            // 判断用户身份，通过用户名和密码在数据库中查找相应的记录
            teacher = teacherD.checkAccount(user, password);
            student = studentD.checkAccount(user, password);
        } catch (Exception e) {
            // 输出异常信息
            out.print(e);
        }

        // 如果用户是教师
        if (teacher != null) {
            // 向会话对象中添加教师信息
            session.setAttribute("info", teacher);

            // 检查用户是否需要保持登录状态
            if (remember != null) {
                // 创建cookie，并将用户名存入cookie
                Cookie userCookie = new Cookie("name", user);
                // 设置cookie的生存时间（这里设置为10秒）
                userCookie.setMaxAge(10);
                // 添加cookie到响应中
                response.addCookie(userCookie);
            }
            // 重定向到教师页面
            response.sendRedirect("one_page_student");
        } else if (student != null) {
            // 向会话对象中添加学生信息
            session.setAttribute("info", student);

            // 检查用户是否需要保持登录状态
            if (remember != null) {
                // 创建cookie，并将用户名存入cookie
                Cookie userCookie = new Cookie("name", user);
                // 设置cookie的生存时间（这里设置为10秒）
                userCookie.setMaxAge(10);
                // 添加cookie到响应中
                response.addCookie(userCookie);
            }
            // 重定向到学生页面
            response.sendRedirect("student/main.jsp");
        } else {
            // 用户名或密码错误，向客户端输出提示信息
            out.print("<script>alert(\"用户名或密码错误！\");</script>");
        }
    }
}
/**
 * 代码解释
 * doPost方法：处理POST请求，简化为调用doGet方法，确保GET和POST请求的处理逻辑一致。
 * doGet方法：主要处理登录逻辑，包括以下步骤：
 * 设置响应内容类型和字符编码：确保正确处理中文等多字节字符。
 * 获取输出流：用于向客户端输出信息。
 * 获取会话对象：从请求中获取HttpSession对象，通过它可以在服务器端存储和获取用户信息。
 * 获取请求参数：包括用户名（user）、密码（password）以及是否记住登录状态（remember）。
 * 创建数据库访问对象：通过TeacherD和StudentD分别访问教师和学生数据库。
 * 判断用户身份：通过用户名和密码在数据库中查找相应的记录。若找到，则设置相应的用户对象。
 * 处理教师登录：若用户为教师，将教师信息存入会话，设置cookie并重定向到教师页面。
 * 处理学生登录：若用户为学生，将学生信息存入会话，设置cookie并重定向到学生页面。
 * 处理登录失败：若用户名或密码错误，向客户端输出提示信息。
 * 会话和cookie处理：
 * 会话（session）：用于在用户会话期间存储用户信息。
 * cookie：用于在客户端存储用户信息（如保持登录状态），并在未来的请求中带回服务器。
 */
