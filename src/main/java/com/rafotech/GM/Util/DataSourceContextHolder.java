package com.rafotech.GM.Util;

public class DataSourceContextHolder {  
	 
    private static final ThreadLocal<DataSource> contextHolder = new ThreadLocal<DataSource>();  
  
    public static void setDbType(DataSource dbType) {  
        contextHolder.set(dbType);
    }  
  
    public static DataSource getDbType() {  
        return ((DataSource) contextHolder.get());  
    }  
  
    public static void clearDbType() {  
        contextHolder.remove();  
    }  
}  