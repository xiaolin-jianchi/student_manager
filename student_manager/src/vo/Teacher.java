package vo;

// 定义一个Teacher类，表示教师信息
public class Teacher {

    // 私有成员变量，用于存储教师的信息
    private String id;        // 教师ID
    private String password;  // 教师密码
    private String email;     // 教师邮箱
    private String name;      // 教师姓名
    private String sex;       // 教师性别

    // 获取教师ID
    public String getId() {
        return id;
    }

    // 获取教师密码
    public String getPassword() {
        return password;
    }

    // 获取教师邮箱
    public String getEmail() {
        return email;
    }

    // 获取教师姓名
    public String getName() {
        return name;
    }

    // 获取教师性别
    public String getSex() {
        return sex;
    }

    // 设置教师ID
    public void setId(String id) {
        this.id = id;
    }

    // 设置教师密码
    public void setPassword(String password) {
        this.password = password;
    }

    // 设置教师邮箱
    public void setEmail(String email) {
        this.email = email;
    }

    // 设置教师姓名
    public void setName(String name) {
        this.name = name;
    }

    // 设置教师性别
    public void setSex(String sex) {
        this.sex = sex;
    }
}
/**类声明：
 public class Teacher：
 Teacher类表示一个教师的信息，包括教师ID、密码、邮箱、姓名和性别。
 使用public访问修饰符，使这个类可以被其他包中的类访问。
 私有成员变量：
 private String id：存储教师的ID。
 private String password：存储教师的密码。
 private String email：存储教师的邮箱。
 private String name：存储教师的姓名。
 private String sex：存储教师的性别。
 使用private修饰符，使成员变量只能在类的内部访问，提高封装性。
 公有的getter方法：
 **public String getId()**：返回教师的ID。
 **public String getPassword()**：返回教师的密码。
 **public String getEmail()**：返回教师的邮箱。
 **public String getName()**：返回教师的姓名。
 **public String getSex()**：返回教师的性别。
 这些方法使其他类可以读取这些私有成员变量的值。
 公有的setter方法：
 **public void setId(String id)**：设置教师的ID。
 **public void setPassword(String password)**：设置教师的密码。
 **public void setEmail(String email)**：设置教师的邮箱。
 **public void setName(String name)**：设置教师的姓名。
 **public void setSex(String sex)**：设置教师的性别。
 这些方法使其他类可以修改这些私有成员变量的值。
 类的封装性：
 Teacher类使用了封装的概念，将数据成员设为私有，并提供了公有的getter和setter方法，以控制对这些数据的访问和修改。这是一种良好的编程实践，有助于保护数据的完整性和安全性。*/