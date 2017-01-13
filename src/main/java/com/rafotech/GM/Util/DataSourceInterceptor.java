package com.rafotech.GM.Util;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect    // for aop
@Component // for auto scan
public class DataSourceInterceptor {
	   //* com.xyz.service.AccountService.*(..) execution(* com.rafotech.GM.Service..*.*(..))
//	    @Pointcut("within(com.rafotech.GM.Service..*)")
//	    public void dataSourceGM(){
//	    	
//	    	System.out.println(DataSource.dataSource_GM+"------------------------------------------");
//	    };
	     
	    @Before("within(com.rafotech.GM.Service.BaseService..*)")
	    public void beforeGM(JoinPoint jp) {
	    	DataSourceContextHolder.setDbType(DataSource.dataSource_GM);
	    	System.out.println(DataSource.dataSource_GM+"------------------------------------------");
	    }
	    // ... ...
	    @Before("within(com.rafotech.GM.Service.LoginService..*)")
	    public void beforeLogin(JoinPoint jp) {
	    	DataSourceContextHolder.setDbType(DataSource.dataSource_login);
	    	System.out.println(DataSource.dataSource_login+"------------------------------------------");
	    }
	
}
