/**
 * @Author wpzhang
 * @Date 2019/4/30
 * @Description
 */
package com.itek.netctoss.util;


import org.apache.commons.dbcp.BasicDataSource;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * @program: Wpzhang
 * @description: 数据库连接工具类
 * @author: wpzhang
 * @create: 2019-04-30 16:20
 **/
public class DBUtil {

    //存储配置信息
    private static Properties props = new Properties();
    //数据库连接池对象
   private static BasicDataSource ds = new BasicDataSource();

    private  static  String driver;
    private static  String url;
    private static String name;
    private static String pwd;

      static {
          //获取驱动，创建连接
          FileInputStream fis = null;
          try {
//              fis = new FileInputStream("C:\\Users\\Administrator\\IdeaProjects\\Wpzhang\\src\\com\\wpzhang\\jdbc\\day01\\JDBC.properties");
              //从项目下的classpath作为相对路径下直接在该路径下加载文件 当前classpath路径下只有两个文件：src&resources
              InputStream is = DBUtil.class.getClassLoader().getResourceAsStream("JDBC.properties");
              props.load(is);
              driver = props.getProperty("driver");
              url = props.getProperty("url");
              name =  props.getProperty("name");
              pwd =  props.getProperty("pwd");

              //设置连接池对象的初始化参数
              ds.setDriverClassName(driver);
              ds.setUrl(url);
              ds.setUsername(name);
              ds.setPassword(pwd);

              //设置其他的数据库连接池信息
              ds.setInitialSize(10);

          } catch (IOException e) {
              System.out.println("初始化配置信息失败");
          }
      }
      /**
       * @Param
       * @description 获取连接对象
       * @date 2019/5/2 10:21
       * @return
       */

        public static Connection  getConnection() {
            try {
                Class.forName(driver);
                return DriverManager.getConnection(url,name,pwd);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                System.out.println("获取连接对象失败");
            }
            return null;
        }
        /**
         * @Param
         * @description 通过连接池获取数据库连接对象
         * @date 2019/5/12 23:34
         * @return
         */
        public static Connection getPoolConnection(){
            try {
                return ds.getConnection();
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
        }

    /**
     * @Param
     * @description 关闭连接对象
     * @date 2019/5/2 10:28
     * @return
     */

    public static void closeConnection(Connection conn){
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println("关闭连接对象失败");
            }
        }
    }

}
