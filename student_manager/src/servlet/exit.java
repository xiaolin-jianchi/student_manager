package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// 使用注解方式定义Servlet，处理"/exit"路径的请求
@WebServlet("/exit")
public class exit extends HttpServlet {

    // 处理POST请求（在此例中未实现具体逻辑）
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 可以根据需要实现具体的POST请求逻辑
    }

    // 处理GET请求
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 清除cookie并跳转到起始页

        // 获取请求中的所有cookie
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            // 遍历所有cookie
            for (Cookie c : cookies) {
                // 获取cookie的名称
                String cookieName = c.getName();
                // 如果cookie名称为"name"，则将其删除
                if ("name".equals(cookieName)) {
                    // 将cookie的过期时间设置为0，表示删除该cookie
                    c.setMaxAge(0);
                    // 将删除的cookie添加到响应中
                    response.addCookie(c);
                }
            }
        }
        // 重定向到起始页（index.jsp）
        response.sendRedirect("index.jsp");
    }
}
/**类上的@WebServlet注解：
 @WebServlet("/exit")：指明该Servlet的访问路径是/exit。
 doPost方法：
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
 在当前例子中未实现具体逻辑。
 如果需要处理POST请求，可以调用doGet或根据需要实现具体的处理逻辑。
 doGet方法：
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException：
 该方法处理HTTP GET请求。
 通常用于处理浏览器地址栏中的请求、超级链接和表单提交。
 获取请求中的所有cookie：
  **Cookie[] cookies = request.getCookies();**：获取请求中的所有cookie数组。如果请求中包含cookie，则返回包含这些cookie的数组；否则返回null。
 遍历所有cookie并删除指定cookie：
  **for (Cookie c : cookies)**：如果cookies不为空，遍历所有cookie。
  **String cookieName = c.getName();**：获取cookie的名称。
  **if ("name".equals(cookieName))**：判断cookie名称是否为"name"，如果是，则需要删除。
  **c.setMaxAge(0);**：将cookie的过期时间设置为0，表示删除该cookie。
  **response.addCookie(c);**：将删除的cookie添加到响应中，这样浏览器端的cookie也会被删除。
 重定向到起始页：
  **response.sendRedirect("index.jsp");**：成功删除cookie后，重定向到index.jsp页面，这通常是应用的起始页。
 小结：
 这个Servlet处理用户退出操作，通过删除特定的cookie（在这里是名称为"name"的cookie），然后将用户重定向到起始页index.jsp。这种方法常用于实现用户的退出和清除登录状态的信息*/