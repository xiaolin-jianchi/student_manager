package vo;

// 定义一个Score类，表示学生的成绩
public class Score {

    // 私有成员变量，用于存储学生的ID和各科成绩
    private String id;        // 学生ID
    private String database;  // 数据库课程成绩
    private String android;   // Android课程成绩
    private String jsp;       // JSP课程成绩

    // 获取学生ID
    public String getId() {
        return id;
    }

    // 获取数据库课程成绩
    public String getDatabase() {
        return database;
    }

    // 获取Android课程成绩
    public String getAndroid() {
        return android;
    }

    // 获取JSP课程成绩
    public String getJsp() {
        return jsp;
    }

    // 设置学生ID
    public void setId(String id) {
        this.id = id;
    }

    // 设置数据库课程成绩
    public void setDatabase(String database) {
        this.database = database;
    }

    // 设置Android课程成绩
    public void setAndroid(String android) {
        this.android = android;
    }

    // 设置JSP课程成绩
    public void setJsp(String jsp) {
        this.jsp = jsp;
    }
}
/**类声明：
 public class Score：
 Score类表示一个学生的成绩，包括学生ID以及数据库、Android和JSP课程的成绩。
 使用public访问修饰符，使这个类可以被其他包中的类访问。
 私有成员变量：
 private String id：存储学生的ID。
 private String database：存储数据库课程的成绩。
 private String android：存储Android课程的成绩。
 private String jsp：存储JSP课程的成绩。
 使用private修饰符，使成员变量只能在类的内部访问，提高封装性。
 公有的getter方法：
 **public String getId()**：返回学生的ID。
 **public String getDatabase()**：返回数据库课程的成绩。
 **public String getAndroid()**：返回Android课程的成绩。
 **public String getJsp()**：返回JSP课程的成绩。
 这些方法使其他类可以读取这些私有成员变量的值。
 公有的setter方法：
 **public void setId(String id)**：设置学生的ID。
 **public void setDatabase(String database)**：设置数据库课程的成绩。
 **public void setAndroid(String android)**：设置Android课程的成绩。
 **public void setJsp(String jsp)**：设置JSP课程的成绩。
 这些方法使其他类可以修改这些私有成员变量的值。
 类的封装性：
 Score类使用了封装的概念，将数据成员设为私有，并提供了公有的getter和setter方法，以控制对这些数据的访问和修改。这是一种良好的编程实践，有助于保护数据的完整性和安全性。*/