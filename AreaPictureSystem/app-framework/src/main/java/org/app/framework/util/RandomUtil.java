package org.app.framework.util;
import java.util.UUID;
/**
 * 
 * java 随机生成一个UUID
 * @author aaron lau
 *
 */
public class RandomUtil {
	/**
	 * 得到一个UUID
	 * @return
	 */
	public static String getUUID() {
		return StringUtil.replace("-", "", UUID.randomUUID().toString()) ;
	}
	public static void main(String[] args) {
		System.out.println(getUUID());
	}
}
