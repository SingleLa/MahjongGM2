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
								
								
								
			<div class="widget wgreen col-lg-5">
                
                <div class="widget-head">
                  <div class="pull-left">修改密码</div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="icon-remove"></i></a>
                  </div>
                  <div class="clearfix"></div>
                </div>

                <div class="widget-content">
                  <div class="padd">

                    <h6>修改密码</h6>
                    <hr>
                    <!-- Form starts.  -->
                     <form class="form-horizontal" role="form">
                              
                                
                    <div class="form-group">
						<label class="col-lg-4 control-label">原始密码</label>
							<div class="col-lg-8">
								<input type="password" class="form-control"  id = "oldPassword" >
							</div>
					</div>
					<div class="form-group">
						 <label class="col-lg-4 control-label">新密码</label>
							<div class="col-lg-8">
								<input type="password" class="form-control"  id = "passWord" >
						    </div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 control-label">重新输入密码</label>
							<div class="col-lg-8">
									<input type="password" class="form-control"  id = "againPassword" >
							</div>
					</div> 
                                                                                                  
                                                                                                                               
                                    
  
                                 
                                
                                    <hr>
                                <div class="form-group">
                                  <div class="col-lg-offset-1 col-lg-9">
                                 	 <button type="button" class="btn btn-success" onclick="updatePassword()">Success</button>
                                    <button type="button" class="btn btn-default" onclick="clear()">Default</button>
                               
                                    
                                    
                                  </div>
                                </div>
                              </form>
                  </div>
                </div>
                  <div class="widget-foot">
                    <!-- Footer goes here -->
                  </div>
              </div>																										               									               	

        </div>
		  </div>

		<!-- Matter ends -->

    </div>

   <!-- Mainbar ends -->
   <div class="clearfix"></div>

</div>

<jsp:include page="../foot.jsp"></jsp:include>

<script type="text/javascript">
 function updatePassword(){
 	var oldPassword = $('#oldPassword').val();
 	var passWord = $('#passWord').val();
 	var againPassword = $('#againPassword').val();
 	if(oldPassword == null || oldPassword == ''){
 		alert("原始密码不能为空");
 		return;
 	}
 	if(passWord == null || passWord == ''){
 		alert("新密码不能为空");
 		return;
 	}
 	if(againPassword == null || againPassword == ''){
 		alert("重复密码不能为空");
 		return;
 		
 	}
 	if(passWord != againPassword){
 		alert("重复密码与新密码不一致");
 		return;
 	}
 	 $.ajax({
		type:"post",
		url:"userMsg/ajaxUpdatePassword.do",
		data:{
			oldPassword:oldPassword,	
			passWord:passWord,			
			againPassword:againPassword
								
					},		
		dataType:"json",
		success:function(data){	
			if(data.success){
				alert("修改成功");
				window.location.reload();
			}else{
				alert(data.errorMsg);
			}								
			},
		error:function(){
									
		}
	});	
 }
 function clear(){
 	$('#oldPassword').val('');
 	$('#passWord').val('');
 	$('#againPassword').val('');
 }
</script>

</body>
</html>
