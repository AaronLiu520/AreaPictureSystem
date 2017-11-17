package org.app.framework.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
/**
 * 编 url地址。
 * @author mac
 *
 */
public class UrlEncUtil {

	public static String encode(String para){
		try {
			return URLEncoder.encode(para, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String decode(String para){
		try {
			return URLDecoder.decode(para, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static Map<String, String> decode(Map<String, Object> params){
		Map<String, String> ret = new HashMap<String, String>();
		
		for (Entry<String, Object> entry : params.entrySet()) {  
			String value = (String) entry.getValue();
			try {
				value = URLDecoder.decode(value,"utf-8");
				ret.put(entry.getKey(), value);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
        } 
		return ret;
	}
	
}
