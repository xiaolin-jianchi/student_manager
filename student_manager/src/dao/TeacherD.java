package dao;

import vo.Teacher;

import java.sql.*;

public class TeacherD {
    // JDBC 数据库连接对象
    private Connection conn = null;

    // 检查教师账户
    public Teacher checkAccount(String id, String password) throws Exception {
        // 初始化数据库连接
        initConnection();
        // 创建Statement对象
        Statement stat = conn.createStatement();
        // SQL 查询语句
        String sql = "select * from teacher where id = '" + id + "' and password = '" + password + "'";
        // 执行查询操作
        ResultSet rs = stat.executeQuery(sql);
        // 获取教师对象
        Teacher tea = getTeacher(rs);
        // 关闭数据库连接
        closeConnection();
        // 返回教师对象
        return tea;
    }

    // 根据ID查找教师记录
    public Teacher findWithId(String id) throws Exception {
        // 初始化数据库连接
        initConnection();
        // 创建Statement对象
        Statement stat = conn.createStatement();
        // SQL 查询语句
        String sql = "select * from teacher where id = '" + id + "'";
        // 执行查询操作
        ResultSet rs = stat.executeQuery(sql);
        // 获取教师对象
        Teacher tea = getTeacher(rs);
        // 关闭数据库连接
        closeConnection();
        // 返回教师对象
        return tea;
    }

    // 插入教师记录
    public Teacher insertTeacher(String id, String password, String email) throws Exception {
        // 初始化数据库连接
        initConnection();
        // SQL 插入语句
        String sql = "insert into teacher(id, password, email) values(?, ?, ?)";
        // 创建PreparedStatement对象
        PreparedStatement ps = conn.prepareStatement(sql);
        // 设置参数
        ps.setString(1, id);
        ps.setString(2, password);
        ps.setString(3, email);
        // 执行插入操作
        ps.executeUpdate();
        // 根据ID查找插入的教师记录
        Teacher teacher = findWithId(id);
        // 关闭数据库连接
        closeConnection();
        // 返回教师对象
        return teacher;
    }

    // 更新教师信息
    public Teacher updateTeacher(String id, String name, String sex, String email, String password) throws Exception {
        // 初始化数据库连接
        initConnection();
        // SQL 更新语句
        String sql = "update teacher set name=?, sex=?, email=?, password=? where id=?";
        // 创建PreparedStatement对象
        PreparedStatement ps = conn.prepareStatement(sql);
        // 设置参数
        ps.setString(1, name);
        ps.setString(2, sex);
        ps.setString(3, email);
        ps.setString(4, password);
        ps.setString(5, id);
        // 执行更新操作
        ps.executeUpdate();
        // 根据ID查找更新后的教师记录
        Teacher teacher = findWithId(id);
        // 关闭数据库连接
        closeConnection();
        // 返回教师对象
        return teacher;
    }

    // 更新教师密码
    public void updateTeacherPassword(String id, String password) throws Exception {
        // 初始化数据库连接
        initConnection();
        // SQL 更新语句
        String sql = "update teacher set password=? where id=?";
        // 创建PreparedStatement对象
        PreparedStatement ps = conn.prepareStatement(sql);
        // 设置参数
        ps.setString(1, password);
        ps.setString(2, id);
        // 执行更新操作
        ps.executeUpdate();
        // 关闭数据库连接
        closeConnection();
    }

    // 从ResultSet中获取单个教师对象
    private Teacher getTeacher(ResultSet rs) throws SQLException {
        Teacher tea = null;
        if (rs.next()) {
            tea = new Teacher();
            tea.setId(rs.getString("id"));
            tea.setPassword(rs.getString("password"));
            tea.setName(rs.getString("name"));
            tea.setEmail(rs.getString("email"));
            tea.setSex(rs.getString("sex"));
        }
        return tea;
    }

    // 初始化数据库连接
    private void initConnection() throws Exception {
        // 加载JDBC驱动
        Class.forName("com.mysql.jdbc.Driver");
        // 建立连接
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_manager?useSSL=false", "root", "1234");
    }

    // 关闭数据库连接
    private void closeConnection() throws Exception {
        // 关闭连接
        conn.close();
    }
}
/**
 * checkAccount方法：
 * **initConnection()**：初始化数据库连接。
 * **Statement stat = conn.createStatement()**：创建一个用于执行SQL查询的Statement对象。
 * **String sql = "select * from teacher where id = '" + id + "' and password = '" + password + "'"**：构建SQL查询语句，通过教师的ID和密码进行查询。
 * **ResultSet rs = stat.executeQuery(sql)**：执行查询，并返回结果集。
 * **Teacher tea = getTeacher(rs)**：从结果集中获取教师对象。
 * **closeConnection()**：关闭数据库连接。
 * **return tea**：返回教师对象。
 * findWithId方法：
 * 根据给定的教师ID查找教师信息。
 * 流程与 checkAccount方法类似，通过SQL查询获取结果，并返回Teacher对象。
 * insertTeacher方法：
 * **initConnection()**：初始化数据库连接。
 * **String sql = "insert into teacher(id, password, email) values(?, ?, ?)"**：构建SQL插入语句。
 * **PreparedStatement ps = conn.prepare
 */