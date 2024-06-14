package servlet;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

// 使用注解方式定义Servlet，用于处理"/upload_studentImg"路径的请求
@WebServlet("/upload_studentImg")
public class upload_studentImg extends HttpServlet {

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

        // 创建SmartUpload对象，用于处理文件上传
        SmartUpload smartUpload = new SmartUpload();

        // 获取请求对象
        Request rq = smartUpload.getRequest();

        // 获取Servlet配置对象
        ServletConfig config = this.getServletConfig();

        // 初始化SmartUpload对象
        smartUpload.initialize(config, request, response);

        try {
            // 上传文件
            smartUpload.upload();

            // 获取表单中的学生ID参数
            String id = rq.getParameter("id");

            // 获取上传的文件对象
            File smartFile = smartUpload.getFiles().getFile(0);

            // 将文件保存到指定位置，并重命名为学生ID.jpeg
            smartFile.saveAs("/userImg/" + id + ".jpeg");

            // 上传成功，弹出成功提示，并重定向到学生的个人页面
            out.print("<script>alert(\"上传成功!\");window.location.href='student/personal.jsp';</script>");
        } catch (Exception e) {
            // 如果出现异常，打印异常信息到客户端
            out.print(e);
        }
    }
}
/**类上的@WebServlet注解：
 @WebServlet("/upload_studentImg")：指明该Servlet的访问路径是/upload_studentImg。
 doPost方法：
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
 在当前例子中，将POST请求转发到doGet方法，确保GET和POST请求的处理逻辑一致。
 doGet方法：
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
 主要功能是处理文件上传请求。
 响应和请求的编码设置：
  **response.setContentType("text/html;charset=utf-8");**：设置响应的内容类型为HTML，并指定字符编码为UTF-8。
  **response.setCharacterEncoding("utf-8");**：设置响应的字符编码为UTF-8。
  **request.setCharacterEncoding("utf-8");**：设置请求的字符编码为UTF-8，确保从请求中获取的参数不会出现乱码。
 获取PrintWriter对象：
  **PrintWriter out = response.getWriter();**：获取响应输出流，用于向客户端输出文本内容。
 创建SmartUpload对象：
  **SmartUpload smartUpload = new SmartUpload();**：创建SmartUpload对象，用于处理文件上传。
 获取请求对象：
  **Request rq = smartUpload.getRequest();**：获取SmartUpload的请求对象，用于检索表单数据。
 获取Servlet配置对象：
  **ServletConfig config = this.getServletConfig();**：获取Servlet的配置对象。
 初始化SmartUpload对象：
  **smartUpload.initialize(config, request, response);**：初始化SmartUpload对象，传递ServletConfig、HttpServletRequest和HttpServletResponse对象。
 上传文件：
 try-catch块：
 try 块：
  **smartUpload.upload();**：执行文件上传操作。
  **String id = rq.getParameter("id");**：从请求中获取学生ID。
  **File smartFile = smartUpload.getFiles().getFile(0);**：获取上传的文件对象。
  **smartFile.saveAs("/userImg/" + id + ".jpeg");**：将文件保存到指定目录，并重命名为学生ID.jpeg。
  **out.print("<script>alert("上传成功!");window.location.href='student/personal.jsp';</script>");**：如果上传成功，弹出提示信息并重定向到学生的个人页面。
 catch (Exception e) 块：
  **out.print(e);**：如果出现异常，打印异常信息到客户端。
 这个Servlet处理文件上传请求，并在成功上传后将用户重定向到学生的个人页面。*/