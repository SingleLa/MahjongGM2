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
	      <h2 class="pull-left"><i class="icon-home"></i> 首页/查询</h2>

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
			<div class="col-lg-3 "></div>
			<div class="col-lg-6 ">
			<!-- Form starts.  -->
				<form class="form-horizontal" role="form" id = "searchForm"  action = "<%=basePath%>card/queryUserByUserName.do" method="post">
									                   
									                    			
					<div class="form-group">
						
						<label class="col-lg-3 control-label pull-left">手机号</label>
							<div class="col-lg-5">
							
								<input type="text" class="form-control"  name = "userName" id = "userName" >
							</div>
							<div class="col-lg-2 ">
								<button type="button" class="btn btn-default" onclick = "search()">查询</button>
							</div>
							<div class="col-lg-2 ">
								${msg}
							</div>
							
					</div>
					                            	                              				                                				                              			                                
					
				</form>		
			</div>
			
			
			<div class="col-lg-3 "></div>
        </div>
		  </div>

		<!-- Matter ends -->

    </div>

   <!-- Mainbar ends -->
   <div class="clearfix"></div>

</div>

<jsp:include page="../foot.jsp"></jsp:include>

<script type="text/javascript">

function search(){
	var userName = $('#userName').val();
	if(userName == null || userName == ''){
		alert("请输入手机号码");
		return;
	}
	$('#searchForm').submit();
}

</script>

</body>
</html>
