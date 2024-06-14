<%@ page import="com.itextpdf.text.Document" %>
<%@ page import="com.itextpdf.text.pdf.PdfWriter" %>
<%@ page import="com.itextpdf.text.Paragraph" %>
<%@ page import="com.itextpdf.text.pdf.BaseFont" %>
<%@ page import="com.itextpdf.text.Font" %>
<%@ page import="com.itextpdf.text.PageSize" %>
<%@ page import="com.itextpdf.text.Element" %>
<%@ page import="com.itextpdf.text.pdf.PdfPTable" %>
<%@ page import="com.itextpdf.text.pdf.PdfPCell" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.DataOutput" %>
<%@ page import="java.io.DataOutputStream" %>

<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>生成PDF</title>
</head>
<body>
<%
    // 设置响应内容类型为PDF
    response.setContentType("application/pdf");
    // 设置响应头，指明文件下载时的文件名
    response.addHeader("Content-Disposition", "attachment;filename=report.pdf");

    // 从请求参数中获取学生信息
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String major = request.getParameter("major");
    String database = request.getParameter("database");
    String android = request.getParameter("android");
    String jsp = request.getParameter("jsp");

    try {
        // 创建一个文档对象，设置页面大小为A4
        Document doc = new Document(PageSize.A4);
        // 创建一个缓冲输出流
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        // 将文档和缓冲流关联
        PdfWriter.getInstance(doc, buffer);

        // 创建BaseFont对象，用于支持中文字体
        BaseFont bf = BaseFont.createFont(
                request.getSession().getServletContext().getRealPath("/") + "resources/font/msyh.ttf",
                BaseFont.IDENTITY_H,
                BaseFont.NOT_EMBEDDED
        );
        // 创建字体对象
        Font font = new Font(bf, 15, Font.NORMAL);

        // 打开文档
        doc.open();

        // 添加标题段落，并设置为居中对齐
        Paragraph paragraph = new Paragraph("成绩单", font);
        paragraph.setAlignment(Element.ALIGN_CENTER);
        doc.add(paragraph);
        // 添加空行
        doc.add(new Paragraph(" "));

        // 创建一个6列的表格，并设置表格宽度为100%
        PdfPTable table = new PdfPTable(6);
        table.setWidthPercentage(100);
        table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
        table.getDefaultCell().setVerticalAlignment(Element.ALIGN_CENTER);

        // 创建表格单元格，并添加内容
        PdfPCell cell;

        // 学号
        cell = new PdfPCell(new Paragraph("学号", font));
        cell.setRowspan(2);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_CENTER);
        table.addCell(cell);

        // 姓名
        cell = new PdfPCell(new Paragraph("姓名", font));
        cell.setRowspan(2);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(cell);

        // 专业
        cell = new PdfPCell(new Paragraph("专业", font));
        cell.setRowspan(2);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(cell);

        // 成绩标题
        cell = new PdfPCell(new Paragraph("成绩", font));
        cell.setColspan(3);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.addCell(cell);

        // 成绩的具体科目
        table.addCell(new Paragraph("数据库", font));
        table.addCell("Android");
        table.addCell("JavaWeb");

        // 学生信息和成绩
        table.addCell(id);
        table.addCell(new Paragraph(name, font));
        table.addCell(new Paragraph(major, font));
        table.addCell(database);
        table.addCell(android);
        table.addCell(jsp);

        // 将表格添加到文档中
        doc.add(table);
        // 关闭文档
        doc.close();

        // 将文档内容写到响应输出流中
        DataOutput output = new DataOutputStream(response.getOutputStream());
        byte[] bytes = buffer.toByteArray();
        response.setContentLength(bytes.length);
        for (int i = 0; i < bytes.length; i++) {
            output.writeByte(bytes[i]);
        }
    } catch (Exception e) {
        // 输出异常信息
        out.print(e);
    }
%>
</body>
</html>
<%--**<%@ page import="com.itextpdf.text.*" %>**：导入iText库中的各种类，用于创建和操作PDF文档。
**<%@ page import="java.io.*" %>**：导入Java IO库中的类，用于处理输入输出流。
HTML 标记：
**<html>**：HTML文档的根元素。
**<head>**：包含文档的元数据，如标题。
**<body>**：包含文档的主要内容。
JSP 脚本元素：
**<%@ page language="java" pageEncoding="UTF-8" %>**：设置页面的语言为Java，编码为UTF-8。
设置响应内容类型和头信息：
**response.setContentType("application/pdf");**：设置响应的内容类型为PDF。
**response.addHeader("Content-Disposition", "attachment;filename=report.pdf");**：设置响应头，指明文件下载时的文件名为report.pdf。
从请求中获取学生信息：
**String id = request.getParameter("id");**：获取学生ID。
**String name = request.getParameter("name");**：获取学生姓名。
**String major = request.getParameter("major");**：获取学生专业。
**String database = request.getParameter("database");**：获取数据库课程成绩。
**String android = request.getParameter("android");**：获取Android课程成绩。
**String jsp = request.getParameter("jsp");**：获取JSP课程成绩。
创建和操作PDF文档：
**Document doc = new Document(PageSize.A4);**：创建一个PDF文档对象，页面大小为A4。
**ByteArrayOutputStream buffer = new ByteArrayOutputStream();**：创建一个缓冲输出流，用于存储PDF内容。
**PdfWriter.getInstance(doc, buffer);**：将文档和缓冲流关联。
**BaseFont bf = BaseFont.createFont(request.getSession().getServletContext().getRealPath("/") + "resources/font/msyh.ttf", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);**：创建支持中文字体的BaseFont对象。
**Font font = new Font(bf, 15, Font.NORMAL);**：创建字体对象。
**doc.open();**：打开文档。
**Paragraph paragraph = new Paragraph("成绩单", font);**：创建段落对象，用于标题文本。
**doc.add(paragraph);**：将段落添加到文档中。
**doc.add(new Paragraph(" "));**：添加一个空行。
创建表格并填充数据（包括标题和内容），设置单元格的对齐方式。
将生成的PDF写入响应输出流：
**DataOutput output = new DataOutputStream(response.getOutputStream());**：获取响应的输出流。
将缓冲流中的字节数组写入响应输出流。
这个JSP页面用于生成学生成绩单的PDF，并将PDF文件提供给客户端下载。--%>