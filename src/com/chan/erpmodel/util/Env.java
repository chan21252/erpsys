package com.chan.erpmodel.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 加载数据库配置文件
 *
 * @author CuiCan
 * @version 2019-10-07
 */
public class Env extends Properties {
    private final static String DRIVER_CLASS;
    private final static String JDBC_URL;
    private final static String USERNAME;
    private final static String PASSWORD;
    private final static String DB_PROPERTIES = "com/chan/erpmodel/conf/dbconf.properties";

    private static Env env;

    static {
        newInstance();
        InputStream in = Env.class.getClassLoader().getResourceAsStream(DB_PROPERTIES);

        try {
            env.load(in);
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        DRIVER_CLASS = env.getProperty("jdbc_driver");
        JDBC_URL = env.getProperty("jdbc_url");
        USERNAME = env.getProperty("jdbc_username");
        PASSWORD = env.getProperty("jdbc_password");
    }

    private static void newInstance() {
        if (env == null) {
            env = new Env();
        }
    }
}
