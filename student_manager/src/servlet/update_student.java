package servlet;

import dao.StudentD;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

// 使用注解方式定义Servlet，处理"/update_student"路径的请求
@WebServlet("/update_student")
public class update_student extends HttpServlet {

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
        String stuno = request.getParameter("stuno");  // 获取学生ID
        String stuname = request.getParameter("stuname");  // 获取学生姓名
        String stusex = request.getParameter("stusex");  // 获取学生性别
        String stumajor = request.getParameter("stumajor");  // 获取学生专业

        try {
            // 更新学生信息
            studentD.updateStudentInfo(stuno, stuname, stusex, stumajor);
        } catch (Exception e) {
            // 如果出现异常，打印异常信息到客户端
            out.print(e);
        }
        // 更新完成后，重定向到学生分页显示页面
        response.sendRedirect("one_page_student");
    }
}
/**类上的@WebServlet注解：
 @WebServlet("/update_student")：指明该Servlet的访问路径是/update_student。
 doPost方法：
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
 在当前例子中，将POST请求转发到doGet方法，确保GET和POST请求的处理逻辑一致。
 doGet方法：
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
 该方法处理HTTP GET请求，主要功能是根据表单提交的数据，更新学生信息记录。
 响应和请求的编码设置：
  **response.setContentType("text/html;charset=utf-8");**：设置响应的内容类型为HTML，并指定字符编码为UTF-8。
  **response.setCharacterEncoding("utf-8");**：设置响应的字符编码为UTF-8。
  **request.setCharacterEncoding("utf-8");**：设置请求的字符编码为UTF-8，确保从请求中获取的参数不会出现乱码。
 获取PrintWriter对象：
  **PrintWriter out = response.getWriter();**：获取响应输出流，用于向客户端输出文本内容。
 创建数据库访问对象：
  **StudentD studentD = new StudentD();**：创建StudentD对象，用于操作学生数据。
 获取请求参数：
  **String stuno = request.getParameter("stuno");**：从请求中获取学生的ID。
  **String stuname = request.getParameter("stuname");**：从请求中获取学生的姓名。
  **String stusex = request.getParameter("stusex");**：从请求中获取学生的性别。
  **String stumajor = request.getParameter("stumajor");**：从请求中获取学生的专业。
 更新学生信息：
 try-catch块：
 try 块：
  **studentD.updateStudentInfo(stuno, stuname, stusex, stumajor);**：调用StudentD的updateStudentInfo方法，更新学生信息。
 catch (Exception e) 块：
  **out.print(e);**：如果出现异常，打印异常信息到客户端。
 重定向到学生分页显示页面：
  **response.sendRedirect("one_page_student");**：更新完成后，重定向到学生分页显示页面。*/