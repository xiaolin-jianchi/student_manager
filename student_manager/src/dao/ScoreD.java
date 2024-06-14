package dao;

import vo.Score;

import java.sql.*;
import java.util.ArrayList;

public class ScoreD {

    // 数据库连接对象
    private Connection conn = null;

    // 插入分数记录
    public boolean insertScore(String id) throws Exception {
        // 初始化数据库连接
        initConnection();
        // SQL插入语句
        String sql = "insert into score(id) values(?)";
        // 创建PreparedStatement对象
        PreparedStatement ps = conn.prepareStatement(sql);
        // 设置参数
        ps.setString(1, id);
        // 执行插入操作
        int i = ps.executeUpdate();
        // 关闭数据库连接
        closeConnection();
        // 返回插入是否成功
        return i == 1;
    }

    // 删除分数记录
    public boolean deleteScore(String id) throws Exception {
        // 初始化数据库连接
        initConnection();
        // 创建Statement对象
        Statement stat = conn.createStatement();
        // SQL删除语句
        String sql = "delete from score where id='" + id + "'";
        // 执行删除操作
        int i = stat.executeUpdate(sql);
        // 关闭数据库连接
        closeConnection();
        // 返回删除是否成功
        return i == 1;
    }

    // 更新分数信息
    public void updateScoreInfo(String id, String database, String android, String jsp) throws Exception {
        // 初始化数据库连接
        initConnection();
        // SQL更新语句
        String sql = "update score set dat=?, android=?, jsp=? where id=?";
        // 创建PreparedStatement对象
        PreparedStatement ps = conn.prepareStatement(sql);
        // 设置参数
        ps.setString(1, database);
        ps.setString(2, android);
        ps.setString(3, jsp);
        ps.setString(4, id);
        // 执行更新操作
        ps.executeUpdate();
        // 关闭数据库连接
        closeConnection();
    }

    // 根据ID查找分数记录
    public Score findWithId(String id) throws Exception {
        // 初始化数据库连接
        initConnection();
        // 创建Statement对象
        Statement stat = conn.createStatement();
        // SQL查询语句
        String sql = "select * from score where id = '" + id + "'";
        // 执行查询操作
        ResultSet rs = stat.executeQuery(sql);
        // 获取分数对象
        Score stu = getScore(rs);
        // 关闭数据库连接
        closeConnection();
        // 返回分数对象
        return stu;
    }

    // 获取一页的分数记录
    public ArrayList<Score> getOnePage(int page, int size) throws Exception {
        ArrayList<Score> al = new ArrayList<>();
        // 初始化数据库连接
        initConnection();
        // SQL分页查询语句
        String sql = "SELECT * FROM score limit ?, ?";
        // 创建PreparedStatement对象
        PreparedStatement ps = conn.prepareStatement(sql);
        // 设置参数
        ps.setInt(1, (page - 1) * size);
        ps.setInt(2, size);
        // 执行查询操作
        ResultSet rs = ps.executeQuery();
        // 获取多个分数对象
        getMoreScore(al, rs);
        // 关闭数据库连接
        closeConnection();
        // 返回结果列表
        return al;
    }

    // 获取所有分数记录的数量
    public int getScoreCount() throws Exception {
        // 初始化数据库连接
        initConnection();
        // SQL查询语句
        String sql = "select count(*) from score";
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

    // 从ResultSet获取单个分数对象
    private Score getScore(ResultSet rs) throws SQLException {
        Score stu = null;
        // 如果有结果
        if (rs.next()) {
            stu = new Score();
            stu.setId(rs.getString("id"));
            stu.setDatabase(rs.getString("dat"));
            stu.setAndroid(rs.getString("android"));
            stu.setJsp(rs.getString("jsp"));
        }
        return stu;
    }

    // 从ResultSet获取多个分数对象并添加到列表中
    private void getMoreScore(ArrayList<Score> al, ResultSet rs) throws SQLException {
        // 遍历所有结果
        while (rs.next()) {
            Score score = new Score();
            score.setId(rs.getString("id"));
            score.setDatabase(rs.getString("dat"));
            score.setAndroid(rs.getString("android"));
            score.setJsp(rs.getString("jsp"));
            // 添加到列表中
            al.add(score);
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
/**insertScore 方法：初始化数据库连接，准备SQL插入语句，执行插入操作，并关闭连接。
 deleteScore 方法：初始化数据库连接，准备SQL删除语句，执行删除操作，并关闭连接。
 updateScoreInfo 方法：初始化数据库连接，准备SQL更新语句，设置参数，执行更新操作，并关闭连接。
 findWithId 方法：初始化数据库连接，准备SQL查询语句，执行查询操作，获取结果并返回分数对象，并关闭连接。
 getOnePage 方法：初始化数据库连接，准备SQL分页查询语句，设置参数，执行查询操作，获取多个分数对象并返回结果列表，并关闭连接。
 getScoreCount 方法：初始化数据库连接，准备SQL查询语句，执行查询操作，获取记录数量并返回，并关闭连接。
 getScore 方法：从ResultSet中获取单个分数对象。
 getMoreScore 方法：从ResultSet中获取多个分数对象并添加到列表中。
 initConnection 方法：加载JDBC驱动，建立数据库连接。
 closeConnection 方法：关闭数据库连接。
 这些注释有助于理解代码每个部分的功能和实现细节。希望这对你有帮助！如果有其他问题或需要更多帮助，请告诉我。*/