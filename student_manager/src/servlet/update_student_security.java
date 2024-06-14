package servlet;

import dao.StudentD;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

// 使用注解方式定义Servlet，处理"/update_student_security"路径的请求
@WebServlet("/update_student_security")
public class update_student_security extends HttpServlet {

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
        // 设置请求字符编码，避免从请求中获取的参数出现乱码
        request.setCharacterEncoding("utf-8");

        // 获取输出流，用于向客户端输出信息
        PrintWriter out = response.getWriter();
        // 创建StudentD对象，用于访问和操作学生数据
        StudentD studentD = new StudentD();

        // 从请求中获取学生记录的各个字段值
        String id = request.getParameter("id");  // 获取学生ID
        String email = request.getParameter("email");  // 获取学生邮箱
        String password = request.getParameter("password");  // 获取学生密码

        try {
            // 更新学生的安全信息（邮箱和密码）
            studentD.updateStudentSecurity(id, email, password);
            // 更新成功，弹出成功提示，并重定向到登录页面
            out.print("<script>alert(\"修改成功\");window.location.href='login.jsp';</script>");
        } catch (Exception e) {
            // 如果出现异常，打印异常信息到客户端
            out.print(e);
        }
    }
}
/**类上的@WebServlet注解：
 @WebServlet("/update_student_security")：指明该Servlet的访问路径是/update_student_security。
 doPost方法：
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
 将POST请求转发到doGet方法，确保GET和POST请求的处理逻辑一致。
 doGet方法：
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
 主要功能是处理更新学生安全信息（邮箱和密码）的请求。
 响应和请求的编码设置：
  **response.setContentType("text/html;charset=utf-8");**：设置响应的内容类型为HTML，并指定字符编码为UTF-8。
  **response.setCharacterEncoding("utf-8");**：设置响应的字符编码为UTF-8。
  **request.setCharacterEncoding("utf-8");**：设置请求的字符编码为UTF-8，确保从请求中获取的参数不会出现乱码。
 获取PrintWriter对象：
  **PrintWriter out = response.getWriter();**：获取响应输出流，用于向客户端输出文本内容。
 创建数据库访问对象：
  **StudentD studentD = new StudentD();**：创建StudentD对象，用于操作学生数据。
 获取请求参数：
  **String id = request.getParameter("id");**：从请求中获取学生的ID。
  **String email = request.getParameter("email");**：从请求中获取学生的邮箱。
  **String password = request.getParameter("password");**：从请求中获取学生的密码。
 更新学生安全信息：
 try-catch块：
 try 块：
  **studentD.updateStudentSecurity(id, email, password);**：调用StudentD的updateStudentSecurity方法，更新学生的安全信息（邮箱和密码）。
  **out.print("<script>alert("修改成功");window.location.href='login.jsp';</script>");**：更新成功后，弹出"修改成功"的提示信息，并重定向到登录页面。
 catch (Exception e) 块：
  **out.print(e);**：如果出现异常，打印异常信息到客户端。*/