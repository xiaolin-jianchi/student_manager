package dao;

import vo.Student;

import java.sql.*;
import java.util.ArrayList;

public class StudentD {

    // JDBC 数据库连接对象
    private Connection conn = null;

    // 检查账户
    public Student checkAccount(String user, String password) throws Exception {
        // 初始化数据库连接
        initConnection();
        // 创建Statement对象
        Statement stat = conn.createStatement();
        // SQL 查询语句
        String sql = "select * from student where id = '" + user + "' and password = '" + password + "'";
        // 执行查询操作
        ResultSet rs = stat.executeQuery(sql);
        // 获取学生对象
        Student stu = getStudent(rs);
        // 关闭数据库连接
        closeConnection();
        // 返回学生对象
        return stu;
    }

    // 根据ID查找学生记录
    public Student findWithId(String id) throws Exception {
        // 初始化数据库连接
        initConnection();
        // 创建Statement对象
        Statement stat = conn.createStatement();
        // SQL 查询语句
        String sql = "select * from student where id = '" + id + "'";
        // 执行查询操作
        ResultSet rs = stat.executeQuery(sql);
        // 获取学生对象
        Student stu = getStudent(rs);
        // 关闭数据库连接
        closeConnection();
        // 返回学生对象
        return stu;
    }

    // 根据姓名查找学生记录，返回列表
    public ArrayList<Student> findWithName(String name) throws Exception {
        ArrayList<Student> al = new ArrayList<>();
        // 初始化数据库连接
        initConnection();
        // 创建Statement对象
        Statement stat = conn.createStatement();
        // SQL 查询语句
        String sql = "select * from student where name = '" + name + "'";
        // 执行查询操作
        ResultSet rs = stat.executeQuery(sql);
        // 获取多个学生对象
        getMoreStudent(al, rs);
        // 关闭数据库连接
        closeConnection();
        // 返回结果列表
        return al;
    }

    // 插入学生记录
    public boolean insertStudent(String id, String name, String sex, String school_date, String major) throws Exception {
        // 初始化数据库连接
        initConnection();
        // SQL 插入语句
        String sql = "insert into student(id, name, sex, school_date, major) values(?, ?, ?, ?, ?)";
        // 创建PreparedStatement对象
        PreparedStatement ps = conn.prepareStatement(sql);
        // 设置参数
        ps.setString(1, id);
        ps.setString(2, name);
        ps.setString(3, sex);
        ps.setString(4, school_date);
        ps.setString(5, major);
        // 执行插入操作
        int i = ps.executeUpdate();
        // 关闭数据库连接
        closeConnection();
        // 返回插入是否成功
        return i == 1;
    }

    // 删除学生记录
    public boolean deleteStudent(String id) throws Exception {
        // 初始化数据库连接
        initConnection();
        // 创建Statement对象
        Statement stat = conn.createStatement();
        // SQL 删除语句
        String sql = "delete from student where id='" + id + "'";
        // 执行删除操作
        int i = stat.executeUpdate(sql);
        // 关闭数据库连接
        closeConnection();
        // 返回删除是否成功
        return i == 1;
    }

    // 获取一页的学生记录
    public ArrayList<Student> getOnePage(int page, int size) throws Exception {
        ArrayList<Student> al = new ArrayList<>();
        // 初始化数据库连接
        initConnection();
        // SQL 分页查询语句
        String sql = "SELECT * FROM student limit ?, ?";
        // 创建PreparedStatement对象
        PreparedStatement ps = conn.prepareStatement(sql);
        // 设置参数
        ps.setInt(1, (page - 1) * size);
        ps.setInt(2, size);
        // 执行查询操作
        ResultSet rs = ps.executeQuery();
        // 获取多个学生对象
        getMoreStudent(al, rs);
        // 关闭数据库连接
        closeConnection();
        // 返回结果列表
        return al;
    }

    // 获取所有学生记录的数量
    public int getStudentCount() throws Exception {
        // 初始化数据库连接
        initConnection();
        // SQL 查询语句
        String sql = "select count(*) from student";
        // 创建Statement对象
        Statement stat = conn.createStatement();
        // 执行查询操作
        ResultSet rs = stat.executeQuery(sql);
        rs.next();
        // 获取记录数量
        int count = rs.getInt(1);
        // 关闭数据库连接
        closeConnection();
        // 返回记录数量
        return count;
    }

    // 更新学生信息
    public void updateStudentInfo(String id, String name, String sex, String major) throws Exception {
        // 初始化数据库连接
        initConnection();
        // SQL 更新语句
        String sql = "update student set name=?, sex=?, major=? where id=?";
        // 创建PreparedStatement对象
        PreparedStatement ps = conn.prepareStatement(sql);
        // 设置参数
        ps.setString(1, name);
        ps.setString(2, sex);
        ps.setString(3, major);
        ps.setString(4, id);
        // 执行更新操作
        ps.executeUpdate();
        // 关闭数据库连接
        closeConnection();
    }

    // 更新学生的安全信息（密码和邮箱）
    public void updateStudentSecurity(String id, String email, String password) throws Exception {
        // 初始化数据库连接
        initConnection();
        // SQL 更新语句
        String sql = "update student set password=?, email=? where id=?";
        // 创建PreparedStatement对象
        PreparedStatement ps = conn.prepareStatement(sql);
        // 设置参数
        ps.setString(1, password);
        ps.setString(2, email);
        ps.setString(3, id);
        // 执行更新操作
        ps.executeUpdate();
        // 关闭数据库连接
        closeConnection();
    }

    // 从ResultSet中获取单个学生对象
    private Student getStudent(ResultSet rs) throws SQLException {
        Student stu = null;
        if (rs.next()) {
            stu = new Student();
            stu.setId(rs.getString("id"));
            stu.setPassword(rs.getString("password"));
            stu.setName(rs.getString("name"));
            stu.setSex(rs.getString("sex"));
            stu.setSchool_date(rs.getString("school_date"));
            stu.setMajor(rs.getString("major"));
            stu.setEmail(rs.getString("email"));
        }
        return stu;
    }

    // 从ResultSet中获取多个学生对象并添加到列表中
    private void getMoreStudent(ArrayList<Student> al, ResultSet rs) throws SQLException {
        while (rs.next()) {
            Student stu = new Student();
            stu.setId(rs.getString("id"));
            stu.setPassword(rs.getString("password"));
            stu.setName(rs.getString("name"));
            stu.setSex(rs.getString("sex"));
            stu.setSchool_date(rs.getString("school_date"));
            stu.setMajor(rs.getString("major"));
            stu.setEmail(rs.getString("email"));
            al.add(stu);
        }
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
/***checkAccount方法：根据用户名和密码检查学生账户是否存在。通过SQL查询获取匹配的学生记录。
 findWithId方法：根据学生ID查找学生信息。通过SQL查询获取匹配的学生记录。
 findWithName方法：根据学生姓名查找学生信息。通过SQL查询获取匹配的所有学生记录，并存储到列表中。
 insertStudent方法：插入新的学生记录。通过准备好的SQL插入语句将学生信息插入数据库。
 deleteStudent方法：根据学生ID删除学生记录。通过SQL删除语句从数据库中删除相应的记录。
 getOnePage方法：分页获取学生记录。通过SQL分页查询语句获取特定页码的学生记录。
 getStudentCount方法：获取学生记录的总数量。通过SQL查询语句获取所有学生记录的数量。
 updateStudentInfo方法：更新学生的基本信息（如姓名、性别、专业）。通过准备好的SQL更新语句更新学生记录。
 updateStudentSecurity方法：更新学生的安全信息（如密码和邮箱）。通过准备好的SQL更新语句更新学生记录。
 getStudent方法：从ResultSet中获取单个学生对象。
 getMoreStudent方法：从ResultSet中获取多个学生对象，并添加到列表中。
 initConnection方法：初始化数据库连接。加载JDBC驱动并建立数据库连接。
 closeConnection方法：关闭数据库连接。*/