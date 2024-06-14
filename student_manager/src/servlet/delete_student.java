package servlet;

import dao.ScoreD;
import dao.StudentD;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/delete_student")
public class delete_student extends HttpServlet {

    // 处理POST请求（在此例中未实现具体逻辑）
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 将POST请求转发到doGet方法进行处理
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

        // 创建StudentD和ScoreD对象，用于访问数据库
        StudentD studentD = new StudentD();
        ScoreD scoreD = new ScoreD();

        // 从请求中获取学生ID
        String id = request.getParameter("id");

        try {
            // 删除学生记录
            studentD.deleteStudent(id);
            // 删除对应的成绩记录
            scoreD.deleteScore(id);
            // 重定向到one_page_student页面
            response.sendRedirect("one_page_student");
        } catch (Exception e) {
            // 如果出现异常，打印异常信息
            out.print(e);
        }
    }
}

//        类上的@WebServlet注解：
//@WebServlet("/delete_student")：指明该Servlet的访问路径是/delete_student。
//        doPost方法：
//protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
//        在当前例子中未实现具体逻辑。
//        如果需要处理POST请求，可以调用doGet方法，确保GET和POST请求的处理逻辑一致。
//        doGet方法：
//protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
//        该方法处理HTTP GET请求。
//        通常用于处理浏览器地址栏中的请求、超级链接和表单提交。
//        响应和请求的编码设置：
//        **response.setContentType("text/html;charset=utf-8");**：设置响应的内容类型为HTML，并指定字符编码为UTF-8。
//        **response.setCharacterEncoding("utf-8");**：设置响应的字符编码为UTF-8。
//        **request.setCharacterEncoding("utf-8");**：设置请求的字符编码为UTF-8，确保从请求中获取的参数不会出现乱码。
//        获取PrintWriter对象：
//        **PrintWriter out = response.getWriter();**：获取响应输出流，用于向客户端输出文本内容。
//        创建数据库访问对象：
//        **StudentD studentD = new StudentD();**：创建StudentD对象，用于操作学生数据。
//        **ScoreD scoreD = new ScoreD();**：创建ScoreD对象，用于操作成绩数据。
//        获取请求参数：
//        **String id = request.getParameter("id");**：从请求中获取学生的ID。
//        删除学生记录和成绩记录：
//        **studentD.deleteStudent(id);**：调用StudentD的deleteStudent方法，删除指定ID的学生记录。
//        **scoreD.deleteScore(id);**：调用ScoreD的deleteScore方法，删除指定ID的成绩记录。
//        重定向到student页面：
//        **response.sendRedirect("one_page_student");**：成功删除之后，重定向到目标页面。
//        异常处理：
//        **catch (Exception e)**：捕获异常。
//        **out.print(e);**：打印异常信息到客户端。