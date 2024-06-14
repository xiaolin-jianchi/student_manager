<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="javax.imageio.ImageIO" %>

<%@ page contentType="image/JPEG;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
    <head>
        <title>验证码</title>
    </head>
    <body>
        <%
            // 设置响应字符编码为UTF-8
            response.setCharacterEncoding("utf-8");

            // 设置HTTP响应头，告知浏览器不要缓存生成的验证码图像
            response.setHeader("Cache-Control", "no-cache");

            // 创建一个60x20像素的图像对象
            int width = 60, height = 20;
            BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

            // 获取图像的画笔对象
            Graphics g = image.getGraphics();

            // 设定背景色为灰色，并填充整个图像
            g.setColor(new Color(200, 200, 200));
            g.fillRect(0, 0, width, height);

            // 随机产生四位数字的验证码
            Random rnd = new Random();
            int randNum = rnd.nextInt(8999) + 1000;
            String randStr = String.valueOf(randNum);

            // 将生成的验证码存入session中
            session.setAttribute("randStr", randStr);

            // 设置字体颜色为黑色，并将验证码显示到图像中
            g.setColor(Color.BLACK);
            g.setFont(new Font("", Font.PLAIN, 20));
            g.drawString(randStr, 10, 17);

            // 随机产生100个干扰点
            for (int i = 0; i < 100; i++) {
                int x = rnd.nextInt(width);
                int y = rnd.nextInt(height);
                g.drawOval(x, y, 1, 1);
            }

            // 将生成的图像写入响应的输出流中
            ImageIO.write(image, "jpeg", response.getOutputStream());

            // 清除页面输出缓冲区
            out.clear();
            out = pageContext.pushBody();
        %>
    </body>
</html>
<%--页面指令：
导入必要的类和包：
jsp
Copy
     <%@ page import="java.awt.image.BufferedImage" %>
     <%@ page import="java.awt.*" %>
     <%@ page import="java.util.Random" %>
     <%@ page import="javax.imageio.ImageIO" %>
设置页面内容类型：
jsp
Copy
     <%@ page contentType="image/JPEG;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
HTML 声明：
定义文档类型为HTML5：
jsp
Copy
     <!DOCTYPE html>
     <html>
     <head>
         <title>验证码</title>
     </head>
主体：
定义文档的主体部分，包含生成并输出验证码图像的逻辑：
jsp
Copy
     <body>
设置响应字符编码：
设置响应字符编码为UTF-8：
jsp
Copy
     <%
         response.setCharacterEncoding("utf-8");
     %>
设置HTTP响应头：
设置响应头，以告知浏览器不要缓存生成的验证码图像：
jsp
Copy
     <%
         response.setHeader("Cache-Control", "no-cache");
     %>
创建图像对象：
创建一个60x20像素的图像对象：
jsp
Copy
     <%
         int width = 60, height = 20;
         BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
     %>
获取图像的画笔对象：
获取图像的画笔对象，用于在图像上绘制内容：
jsp
Copy
     <%
         Graphics g = image.getGraphics();
     %>
设定背景色并填充整个图像：
设置颜色为灰色，并填充整个图像：
jsp
Copy
     <%
         g.setColor(new Color(200, 200, 200));
         g.fillRect(0, 0, width, height);
     %>
随机产生四位数字的验证码：
随机生成一个四位数字的验证码：
jsp
Copy
     <%
         Random rnd = new Random();
         int randNum = rnd.nextInt(8999) + 1000;
         String randStr = String.valueOf(randNum);
     %>
将验证码存入session中：
将生成的验证码存入session中，以便后续验证用户输入：
jsp
Copy
      <%
          session.setAttribute("randStr", randStr);
      %>
显示验证码：
设置字体颜色为黑色，并将验证码显示在图像中：
jsp
Copy
      <%
          g.setColor(Color.BLACK);
          g.setFont(new Font("", Font.PLAIN, 20));
          g.drawString(randStr, 10, 17);
      %>
随机产生干扰点：
随机产生100个干扰点，增加验证码的复杂性：
jsp
Copy
      <%
          for (int i = 0; i < 100; i++) {
              int x = rnd.nextInt(width);
              int y = rnd.nextInt(height);
              g.drawOval(x, y, 1, 1);
          }
      %>
将图像写入响应输出流：
将生成的图像写入响应输出流，以便在浏览器中显示：
jsp
Copy
      <%
          ImageIO.write(image, "jpeg", response.getOutputStream());
      %>
清除页面输出缓冲区：
清除页面输出缓冲区，确保图像正确输出：
jsp
Copy
      <%
          out.clear();
          out = pageContext.pushBody();
      %>
关闭HTML标签：
jsp
Copy
    </body>
    </html>
这个JSP页面用于生成验证码图像，并将其显示在浏览器中。它首先随机生成一个四位数字的验证码，将其存入session中，然后用图像画笔绘制验证码和100个干扰点，最后输出生成的验证码图像。--%>