<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	  <meta charset="utf-8">

</head>

<body>

<jsp:include page="../head.jsp"></jsp:include>

<!-- Main content starts -->

<div class="content">

<jsp:include page="../menu.jsp"></jsp:include>

  	  	<!-- Main bar -->
  	<div class="mainbar">
      
	    <!-- Page heading -->
	    <div class="page-head">
	      <h2 class="pull-left"><i class="icon-home"></i> 首页</h2>

        <!-- Breadcrumb -->
        <div class="bread-crumb pull-right">
          <a href="index.html"><i class="icon-home"></i> 首页</a> 
          <!-- Divider -->
          <span class="divider">/</span> 
          <a href="#" class="bread-current">控制台</a>
        </div>

        <div class="clearfix"></div>

	    </div>
	    <!-- Page heading ends -->



	    <!-- Matter -->

	   <div class="matter">
     <div class="container">

			<!-- Form starts.  -->
				<form class="form-horizontal" role="form" >
									                   
									                    			
					<div class="form-group">
						<label class="col-lg-4 control-label">原始密码</label>
							<div class="col-lg-8">
								<input type="text" class="form-control"  id = "oldPwd" >
							</div>
					</div>
					<div class="form-group">
						 <label class="col-lg-4 control-label">新密码</label>
							<div class="col-lg-8">
								<input type="text" class="form-control"  id = "newPwd" >
						    </div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 control-label">重新输入密码</label>
							<div class="col-lg-8">
									<input type="text" class="form-control"  id = "againPwd" >
							</div>
					</div>                               	                              				                                				                              			                                
					
				</form>		

        </div>
		  </div>

		<!-- Matter ends -->

    </div>

   <!-- Mainbar ends -->
   <div class="clearfix"></div>

</div>

<jsp:include page="../foot.jsp"></jsp:include>



</body>
</html>
