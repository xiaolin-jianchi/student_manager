package vo;

import java.sql.Date;
import java.sql.PseudoColumnUsage;
import java.util.regex.Pattern;

// 定义一个Student类，表示学生信息
public class Student {

    // 私有成员变量，用于存储学生的信息
    private String id;           // 学生ID
    private String password;     // 学生密码
    private String name;         // 学生姓名
    private String sex;          // 学生性别
    private String school_date;  // 入学日期
    private String major;        // 学生专业
    private String email;        // 学生邮箱

    // 获取学生ID
    public String getId() {
        return id;
    }

    // 获取学生密码
    public String getPassword() {
        return password;
    }

    // 获取学生姓名
    public String getName() {
        return name;
    }

    // 获取学生性别
    public String getSex() {
        return sex;
    }

    // 获取学生入学日期
    public String getSchool_date() {
        return school_date;
    }

    // 获取学生专业
    public String getMajor() {
        return major;
    }

    // 获取学生邮箱
    public String getEmail() {
        return email;
    }

    // 设置学生ID
    public void setId(String id) {
        this.id = id;
    }

    // 设置学生密码
    public void setPassword(String password) {
        this.password = password;
    }

    // 设置学生姓名
    public void setName(String name) {
        this.name = name;
    }

    // 设置学生性别
    public void setSex(String sex) {
        this.sex = sex;
    }

    // 设置学生入学日期
    public void setSchool_date(String school_date) {
        this.school_date = school_date;
    }

    // 设置学生专业
    public void setMajor(String major) {
        this.major = major;
    }

    // 设置学生邮箱
    public void setEmail(String email) {
        this.email = email;
    }
}
/**类声明：
 public class Student：
 Student类表示一个学生的信息，包括学生ID、密码、姓名、性别、入学日期、专业和邮箱。
 使用public访问修饰符，使这个类可以被其他包中的类访问。
 私有成员变量：
 private String id：存储学生的ID。
 private String password：存储学生的密码。
 private String name：存储学生的姓名。
 private String sex：存储学生的性别。
 private String school_date：存储学生的入学日期。
 private String major：存储学生的专业。
 private String email：存储学生的邮箱。
 使用private修饰符，使成员变量只能在类的内部访问，提高封装性。
 公有的getter方法：
 **public String getId()**：返回学生的ID。
 **public String getPassword()**：返回学生的密码。
 **public String getName()**：返回学生的姓名。
 **public String getSex()**：返回学生的性别。
 **public String getSchool_date()**：返回学生的入学日期。
 **public String getMajor()**：返回学生的专业。
 **public String getEmail()**：返回学生的邮箱。
 这些方法使其他类可以读取这些私有成员变量的值。
 公有的setter方法：
 **public void setId(String id)**：设置学生的ID。
 **public void setPassword(String password)**：设置学生的密码。
 **public void setName(String name)**：设置学生的姓名。
 **public void setSex(String sex)**：设置学生的性别。
 **public void setSchool_date(String school_date)**：设置学生的入学日期。
 **public void setMajor(String major)**：设置学生的专业。
 **public void setEmail(String email)**：设置学生的邮箱。
 这些方法使其他类可以修改这些私有成员变量的值。
 类的封装性：
 Student类使用了封装的概念，将数据成员设为私有，并提供了公有的getter和setter方法，以控制对这些数据的访问和修改。这是一种良好的编程实践，有助于保护数据的完整性和安全性。*/