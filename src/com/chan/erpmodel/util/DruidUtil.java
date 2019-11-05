package com.chan.erpmodel.util;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class DruidUtil {
    private final static String DB_PROPERTIES = "com/chan/erpmodel/conf/druid.properties";
    private static DataSource ds;

    static {
        try {
            Properties pro = new Properties();
            InputStream is = DruidUtil.class.getClassLoader().getResourceAsStream(DB_PROPERTIES);
            pro.load(is);
            ds = DruidDataSourceFactory.createDataSource(pro);
            is.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static DataSource getDataSource() {
        return ds;
    }

    public static Connection getConnection() throws SQLException {
        return ds.getConnection();
    }

    public static void close(Connection conn, PreparedStatement ps, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        close(conn, ps);
    }

    public static void close(Connection conn, PreparedStatement ps) {
        if (conn != null && ps != null) {
            try {
                conn.close();
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
