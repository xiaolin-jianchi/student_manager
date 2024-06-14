package servlet;

import dao.ScoreD;
import dao.StudentD;
import vo.Score;
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

@WebServlet("/one_page_score")
public class one_page_score extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String key = request.getParameter("id");

        if (key == null) {

            int currentIndex, count, size = 10;
            String index = request.getParameter("index");
            if (index == null)
                index = "1";
            currentIndex = Integer.parseInt(index);

            try {
                ScoreD scoD = new ScoreD();
                count = scoD.getScoreCount();
                ArrayList<Score> stus = scoD.getOnePage(currentIndex, size);
                int sumIndex = count % size == 0 ? count / size : count / size + 1;
                session.setAttribute("onePageScore", stus);
                session.setAttribute("sumScoreIndex", sumIndex);
                response.sendRedirect("teacher/score.jsp");
            } catch (Exception e) {
                out.print(e);
            }
        }
        else {
            ScoreD scoreD = new ScoreD();
                try {
                    Score score = scoreD.findWithId(key);
                    ArrayList<Score> scores = new ArrayList<>();
                    scores.add(score);
                    session.setAttribute("onePageScore", scores);
                    session.setAttribute("sumScoreIndex", 1);
                    response.sendRedirect("teacher/score.jsp");
                } catch (Exception e) {
                    out.print(e);
                }
            }
        }
}
/**类上的@WebServlet注解：
 @WebServlet("/one_page_score")：指明该Servlet的访问路径是/one_page_score。
 doPost方法：
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
 在当前例子中，将POST请求转发到doGet方法，确保GET和POST请求的处理逻辑一致。
 doGet方法：
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
 该方法处理HTTP GET请求，主要功能是根据页面索引分页显示成绩记录，或根据学生ID查找成绩记录。
 响应和请求的编码设置：
  **response.setContentType("text/html;charset=utf-8");**：设置响应的内容类型为HTML，并指定字符编码为UTF-8。
  **response.setCharacterEncoding("utf-8");**：设置响应的字符编码为UTF-8。
  **request.setCharacterEncoding("utf-8");**：设置请求的字符编码为UTF-8，确保从请求中获取的参数不会出现乱码。
 获取PrintWriter对象：
  **PrintWriter out = response.getWriter();**：获取响应输出流，用于向客户端输出文本内容。
 获取会话对象：
  **HttpSession session = request.getSession();**：获取或创建一个新的会话对象。
 获取请求参数：
  **String key = request.getParameter("id");**：从请求中获取学生的ID key。
 分页处理：
 如果没有提供关键字（学生ID），则进行分页逻辑处理：
  **int currentIndex, count, size = 10;**：初始化分页参数，每页显示10条记录。
  **String index = request.getParameter("index");**：从请求中获取分页索引（如果没有提供，默认当前页为第一页）。
  **currentIndex = Integer.parseInt(index);**：将分页索引转换为整数。
 try-catch块：
  **ScoreD scoD = new ScoreD();**：创建ScoreD对象，用于操作成绩数据。
  **count = scoD.getScoreCount();**：获取总记录数。
  **ArrayList<Score> stus = scoD.getOnePage(currentIndex, size);**：获取当前页的成绩记录。
  **int sumIndex = count % size == 0 ? count / size : count / size + 1;**：计算总页数。
  **session.setAttribute("onePageScore", stus);**：将当前页的成绩记录存储到会话中。
  **session.setAttribute("sumScoreIndex", sumIndex);**：将总页数存储到会话中。
  **response.sendRedirect("teacher/score.jsp");**：重定向到成绩显示页面。
 查找处理：
 如果提供了关键字（学生ID），则根据关键字查找成绩记录：
  **ScoreD scoreD = new ScoreD();**：创建ScoreD对象，用于操作成绩数据。
 try-catch块：
  **Score score = scoreD.findWithId(key);**：根据学生ID查找成绩。
  **ArrayList<Score> scores = new ArrayList<>();**：创建成绩列表。
  **scores.add(score);**：将找到的成绩记录添加到列表中。
  **session.setAttribute("onePageScore", scores);**：将查找到的成绩记录存储到会话中。
  **session.setAttribute("sumScoreIndex", 1);**：设置总页数为1。
  **response.sendRedirect("teacher/score.jsp");**：重定向到成绩显示页面。*/
