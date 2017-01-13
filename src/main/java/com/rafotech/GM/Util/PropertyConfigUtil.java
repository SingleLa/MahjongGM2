package com.rafotech.GM.Util;


import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;



public class PropertyConfigUtil {
	/**
	 * 获取属性文件
	 * @param key
	 * @param path
	 * @return String
	 * @author wwc
	 * @throws IOException 
	 * @date 2016-6-15 下午12:17:18
	 */
	public static String getValue(String key,String path)  {
		InputStream in =null;
		 String value="";
		 try {
			 
			 Properties prop = new Properties();     
			 in = PropertyConfigUtil.class.getResourceAsStream(path);   
			 prop.load(in);   
			 value = prop.getProperty(key).trim();
			 in.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(in!=null){
				try {
					in.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
	       return value; 
	}
	
	       
}
