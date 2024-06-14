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

// 使用注解方式定义Servlet，处理"/update_teacher"路径的请求
@WebServlet("/update_teacher")
public class update_teacher extends HttpServlet {

    // 处理POST请求
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置响应内容类型和字符编码
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        // 获取输出流，用于向客户端输出信息
        PrintWriter out = response.getWriter();
        // 获取会话对象
        HttpSession session = request.getSession();

        // 创建TeacherD对象，用于访问和操作教师数据
        TeacherD teacherD = new TeacherD();

        // 从请求中获取教师记录的各个字段值
        String uid = request.getParameter("uid");  // 获取教师ID
        String name = request.getParameter("name");  // 获取教师姓名
        String sex = request.getParameter("sex");  // 获取教师性别
        String email = request.getParameter("email");  // 获取教师邮箱
        String password = request.getParameter("password");  // 获取教师密码

        try {
            // 更新教师信息
            Teacher teacher = teacherD.updateTeacher(uid, name, sex, email, password);
            // 将更新后的教师信息存储到会话中
            session.setAttribute("info", teacher);
            // 更新成功后，弹出成功提示，并重定向到教师个人页面
            out.print("<script>alert(\"保存成功！\");location.href = \"teacher/personal.jsp\";</script>");
        } catch (Exception e) {
            // 如果出现异常，打印异常信息到客户端
            out.print(e);
        }
    }

    // 处理GET请求（在此例中未实现具体逻辑）
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 处理GET请求的逻辑可以根据需要实现
    }
}
/**
 * 类上的@WebServlet注解：
 * @WebServlet("/update_teacher")：指明该Servlet的访问路径是/update_teacher。
 * doPost方法：
 * protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
 * 处理POST请求，在当前例子中，将POST请求的具体实现逻辑直接写在doPost方法中。
 * 响应和请求的编码设置：
 * **response.setContentType("text/html;charset=utf-8");**：设置响应的内容类型为HTML，并指定字符编码为UTF-8。
 * **response.setCharacterEncoding("utf-8");**：设置响应的字符编码为UTF-8。
 * **request.setCharacterEncoding("utf-8");**：设置请求的字符编码为UTF-8，确保从请求中获取的参数不会出现乱码。
 * 获取PrintWriter对象：
 * **PrintWriter out = response.getWriter();**：获取响应输出流，用于向客户端输出文本内容。
 * 创建数据库访问对象：
 * **TeacherD teacherD = new TeacherD();**：创建TeacherD对象，用于操作教师数据。
 * 获取会话对象：
 * **HttpSession session = request.getSession();**：获取或创建一个新的会话对象。
 * 获取请求参数：
 * **String uid = request.getParameter("uid");**：从请求中获取教师的ID。
 * **String name = request.getParameter("name");**：从请求中获取教师的姓名。
 * **String sex = request.getParameter("sex");**：从请求中获取教师的性别。
 * **String email = request.getParameter("email");**：从请求中获取教师的邮箱。
 * **String password = request.getParameter("password");**：从请求中获取教师的密码。
 * 更新教师信息：
 * try-catch块：
 * try 块：
 * **Teacher teacher = teacherD.updateTeacher(uid, name, sex, email, password);**：调用TeacherD的updateTeacher方法，更新教师信息。
 * **session.setAttribute("info", teacher);**：将更新后的教师信息存储到会话中。
 * **out.print("<script>alert("保存成功！");location.href = "teacher/personal.jsp";</script>");**：更新成功后，弹出"保存成功"的提示信息，并重定向到教师个人页面。
 * catch (Exception e) 块：
 * **out.print(e);**：如果出现异常，打印异常信息到客户端。
 * 处理GET请求：
 * protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
 * 在当前例子中未实现具体逻辑，如果需要处理GET请求，可以在此方法中实现。*/