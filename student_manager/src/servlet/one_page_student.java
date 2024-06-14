package servlet;

import dao.StudentD;
import vo.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.regex.Pattern;

// 使用注解方式定义Servlet，处理/one_page_student路径的请求
@WebServlet("/one_page_student")
public class one_page_student extends HttpServlet {

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
        // 获取会话对象
        HttpSession session = request.getSession();

        // 获取请求参数：关键字（学生ID或姓名）
        String key = request.getParameter("key");

        if (key == null || key.equals("")) { // 如果没有提供关键字，进行分页处理
            int currentIndex, count, size = 10; // 初始化分页参数，每页显示10条记录
            String index = request.getParameter("index");
            if (index == null) {
                index = "1"; // 如果没有提供分页索引，默认当前页为第一页
            }
            currentIndex = Integer.parseInt(index); // 将分页索引转换为整数

            try {
                StudentD sdao = new StudentD();
                ArrayList<Student> stus = sdao.getOnePage(currentIndex, size); // 获取当前页的学生记录
                count = sdao.getStudentCount(); // 获取总记录数
                int sumIndex = count % size == 0 ? count / size : count / size + 1; // 计算总页数
                session.setAttribute("onePageStudent", stus); // 将当前页的学生记录存储到会话中
                session.setAttribute("sumIndex", sumIndex); // 将总页数存储到会话中
                response.sendRedirect("teacher/main.jsp"); // 重定向到学生显示页面
            } catch (Exception e) {
                out.print(e); // 输出异常信息
            }
        } else { // 如果提供了关键字，根据关键字查找学生记录
            StudentD studentD = new StudentD();
            String pattern = "^\\d+"; // 正则表达式，匹配数字
            boolean isMatch = Pattern.matches(pattern, key); // 判断关键字是否为数字
            if (isMatch) { // 如果关键字是数字
                try {
                    Student student = studentD.findWithId(key); // 根据学生ID查找学生
                    ArrayList<Student> students = new ArrayList<>();
                    students.add(student); // 将找到的学生记录添加到列表中
                    session.setAttribute("onePageStudent", students); // 将查找到的学生记录存储到会话中
                    session.setAttribute("sumIndex", 1); // 设置总页数为1
                    response.sendRedirect("teacher/main.jsp"); // 重定向到学生显示页面
                } catch (Exception e) {
                    out.print(e); // 输出异常信息
                }
            } else { // 如果关键字不是数字
                try {
                    ArrayList<Student> stus = studentD.findWithName(key); // 根据学生姓名查找学生
                    session.setAttribute("onePageStudent", stus); // 将查找到的学生记录存储到会话中
                    session.setAttribute("sumIndex", 1); // 设置总页数为1
                    response.sendRedirect("teacher/main.jsp"); // 重定向到学生显示页面
                } catch (Exception e) {
                    out.print(e); // 输出异常信息
                }
            }
        }
    }
}
/**类上的@WebServlet注解：
 @WebServlet("/one_page_student")：指明该Servlet的访问路径是/one_page_student。
 doPost方法：
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
 在当前例子中，将POST请求转发到doGet方法，确保GET和POST请求的处理逻辑一致。
 doGet方法：
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
 该方法处理HTTP GET请求，主要功能是根据页面索引分页显示学生记录，或根据学生ID或姓名查找学生记录。
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
 获取会话对象：
  **HttpSession session = request.getSession();**：
 获取或创建一个新的会话对象。
 获取请求参数：
  **String key = request.getParameter("key");**：
 从请求中获取学生的关键字（ID或姓名）。
 分页处理：
 如果没有提供关键字，则进行分页处理：
  **int currentIndex, count, size = 10;**：初始化分页参数，每页显示10条记录。
  **String index = request.getParameter("index");**：
 从请求中获取分页索引（如果没有提供，默认当前页为第一页）。
  **currentIndex = Integer.parseInt(index);**：
 将分页索引转换为整数。
 try-catch块：
  **StudentD sdao = new StudentD();**：
 创建StudentD对象，用于操作学生数据。
  **ArrayList<Student> stus = sdao.getOnePage(currentIndex, size);**：
 获取当前页的学生记录。
  **count = sdao.getStudentCount();**：
 获取总记录数。
  **int sumIndex = count % size == 0 ? count / size : count / size + 1;**：
 计算总页数。
  **session.setAttribute("onePageStudent", stus);**：
 将当前页的学生记录存储到会话中。
  **session.setAttribute("sumIndex", sumIndex);**：
 将总页数存储到会话中。
  **response.sendRedirect("teacher/main.jsp");**：
 重定向到学生显示页面。
 查找处理：
 如果提供了关键字，通过关键字查找学生记录：
  **String pattern = "^\d+";**：
 定义正则表达式，匹配数字。
  **boolean isMatch = Pattern.matches(pattern, key);**：
 判断关键字是否为数字。
  **if (isMatch)**：
 如果关键字是数字，认为是学生ID：
 try-catch块：
  **Student student = studentD.findWithId(key);**：
 根据学生ID查找学生。
 将找到的学生记录添加到列表：
  **ArrayList<Student> students = new ArrayList<>();**：
 创建空的学生列表。
  **students.add(student);**：
 将找到的学生记录添加到列表中。
  **session.setAttribute("onePageStudent", students);**：
 将学生记录存储到会话中。
  **session.setAttribute("sumIndex", 1);**：
 设置总页数为1。
  **response.sendRedirect("teacher/main.jsp");**：
 重定向到学生显示页面。
 else：
 如果关键字不是数字，认为是学生姓名：
 try-catch块：
  **ArrayList<Student> stus = studentD.findWithName(key);**：
 根据学生姓名查找学生。
  **session.setAttribute("onePageStudent", stus);**：
 将学生记录存储到会话中。
  **session.setAttribute("sumIndex", 1);**：
 设置总页数为1。
  **response.sendRedirect("teacher/main.jsp");**：
 重定向到学生显示页面。*/