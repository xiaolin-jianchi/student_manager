package servlet;

import dao.ScoreD;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

// 使用注解方式定义Servlet，处理"/update_score"路径的请求
@WebServlet("/update_score")
public class update_score extends HttpServlet {

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
        // 创建ScoreD对象，用于访问和操作成绩数据
        ScoreD scoreD = new ScoreD();

        // 从请求中获取成绩记录的各个字段值
        String[] id = request.getParameterValues("id");
        String[] database = request.getParameterValues("database");
        String[] android = request.getParameterValues("android");
        String[] jsp = request.getParameterValues("jsp");

        try {
            // 遍历多个成绩记录并更新每个记录
            for (int i = 0; i < id.length; i++) {
                // 更新每个成绩记录的信息
                scoreD.updateScoreInfo(id[i], database[i], android[i], jsp[i]);
            }
            // 更新完成后，重定向到成绩分页显示页面
            response.sendRedirect("one_page_score");
        } catch (Exception e) {
            // 如果出现异常，打印异常信息到客户端
            out.print(e);
        }
    }
}
/**类上的@WebServlet注解：
 @WebServlet("/update_score")：指明该Servlet的访问路径是/update_score。
 doPost方法：
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
 在当前例子中，将POST请求转发到doGet方法，确保GET和POST请求的处理逻辑一致。
 doGet方法：
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
 该方法处理HTTP GET请求，主要功能是根据表单提交的数据，更新多个成绩记录。
 响应和请求的编码设置：
  **response.setContentType("text/html;charset=utf-8");**：
 设置响应的内容类型为HTML，并指定字符编码为UTF-8。
  **response.setCharacterEncoding("utf-8");**：
 设置响应的字符编码为UTF-8。
  **request.setCharacterEncoding("utf-8");**：
 设置请求的字符编码为UTF-8，确保从请求中获取的参数不会出现乱码。
 获取PrintWriter对象：
  **PrintWriter out = response.getWriter();**：
 获取响应输出流，用于向客户端输出文本内容。
 创建数据库访问对象：
  **ScoreD scoreD = new ScoreD();**：
 创建ScoreD对象，用于操作成绩数据。
 获取请求参数：
  **String[] id = request.getParameterValues("id");**：
 从请求中获取多个成绩记录的ID值。
  **String[] database = request.getParameterValues("database");**：
 从请求中获取多个成绩记录的database值。
  **String[] android = request.getParameterValues("android");**：
 从请求中获取多个成绩记录的android值。
  **String[] jsp = request.getParameterValues("jsp");**：
 从请求中获取多个成绩记录的jsp值。
 更新成绩记录：
 try-catch块：
  **for (int i = 0; i < id.length; i++)**：
 遍历多个成绩记录，为每个记录更新相关信息。
  **scoreD.updateScoreInfo(id[i], database[i], android[i], jsp[i]);**：
 更新每个成绩记录的信息。
  **response.sendRedirect("one_page_score");**：
 更新完成后，重定向到成绩分页显示页面。
 异常处理：
  **catch (Exception e)**：
 捕获异常，并使用out.print(e)将异常信息打印到客户端。*/