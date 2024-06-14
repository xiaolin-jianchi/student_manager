package servlet;

import dao.ScoreD;
import dao.StudentD;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/add_student")
public class add_student extends HttpServlet {
    // 处理POST请求（将Post请求转发到doGet方法）
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 调用doGet方法处理POST请求
        this.doGet(request, response);
    }

    // 处理GET请求
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 设置响应内容类型和编码
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        // 设置请求编码
        request.setCharacterEncoding("utf-8");

        // 获取响应输出对象
        PrintWriter out = response.getWriter();

        // 创建学生和成绩的DAO对象
        StudentD studentD = new StudentD();
        ScoreD scoreD = new ScoreD();

        // 从请求中获取参数
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String major = request.getParameter("major");
        String school_date = request.getParameter("school_date");

        try {
            // 插入学生记录
            studentD.insertStudent(id, name, sex, school_date, major);
            // 插入成绩记录
            scoreD.insertScore(id);
        } catch (Exception e) {
            // 如果出现异常，打印异常信息
            out.print(e);
        }

        // 重定向到one_page_student页面
        response.sendRedirect("one_page_student");
    }
}
/**类上的@WebServlet注解：
 @WebServlet("/add_student")：指明该Servlet的访问路径是/add_student。
 doPost方法：
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
 该方法处理HTTP POST请求。
 通常用于处理表单数据或其他需要通过POST方式发送的数据。
 这里调用doGet方法，将POST请求重定向到GET请求的处理方法。
 doGet方法：
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
 该方法处理HTTP GET请求。
 通常用于处理浏览器地址栏中的请求、超级链接和表单提交。
 响应设置：
 response.setContentType("text/html;charset=utf-8");：设置响应的内容类型为HTML，并指定字符编码为UTF-8。
 response.setCharacterEncoding("utf-8");：设置响应的字符编码为UTF-8。
 请求设置：
 request.setCharacterEncoding("utf-8");：设置请求的字符编码为UTF-8，确保从请求中获取的参数不会出现乱码。
 获取PrintWriter对象：
 PrintWriter out = response.getWriter();：获取响应输出流，用于向客户端输出文本内容。
 创建DAO对象：
 StudentD studentD = new StudentD();：创建StudentD对象，用于操作学生数据。
 ScoreD scoreD = new ScoreD();：创建ScoreD对象，用于操作成绩数据。
 获取请求参数：
 从请求中获取学生的ID、姓名、性别、专业和入学日期等参数。*/