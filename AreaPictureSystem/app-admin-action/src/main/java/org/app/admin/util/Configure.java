package org.app.admin.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Properties;

/**
 * 读取配置文件
 */
public class Configure {
    private static final Logger log = LoggerFactory.getLogger(Configure.class);

    private Properties config = null;

    private Configure() {
        config = new Properties();
        try {
            ClassLoader CL = this.getClass().getClassLoader();
            InputStream in;
            if (CL != null) {
                in = CL.getResourceAsStream("configure.properties");
            } else {
                in = ClassLoader.getSystemResourceAsStream("configure.properties");
            }
            config.load(in);
            in.close();
        } catch (FileNotFoundException e) {
            log.error("服务器配置文件没有找到");
        } catch (Exception e) {
            log.error("服务器配置信息读取错误");
        }
    }


    private static class InnerSingletion {
        private static Configure single = new Configure();
    }

    public static Configure getInstance(){
        return InnerSingletion.single;
    }


    public Properties getConfig() {
        return config;
    }


    public String getValueString(String value){
        if(!config.contains(value)){
            return config.getProperty(value).trim();
        }
        return null;
    }

    public int getValueInt(String value){
        return Integer.valueOf(getValueString(value));
    }


}
