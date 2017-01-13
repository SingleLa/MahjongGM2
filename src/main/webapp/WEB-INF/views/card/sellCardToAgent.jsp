<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

			<div class="row">

            <div class="col-md-12">


              <div class="widget wgreen">
                
                <div class="widget-head">
                  <div class="pull-left">信息</div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="icon-remove"></i></a>
                  </div>
                  <div class="clearfix"></div>
                </div>

                <div class="widget-content">
                  <div class="padd">

                    <h6>列表</h6>
                    <hr>
                    <!-- Form starts.  -->
                     <!-- Form starts.  -->
				<form class="form-horizontal" role="form" >
									                   
					<input type="hidden" id = "userId" value = "${agent.id}">				                    			
					<div class="form-group">
						<label class="col-lg-4 control-label">手机号码</label>
							<div class="col-lg-4">
								<input type="text" class="form-control"  id = "userName" name = "userName" value="${agent.userName }" >
							</div>
					</div>
					<div class="form-group">
						 <label class="col-lg-4 control-label">昵称</label>
							<div class="col-lg-4">
								<input type="text" class="form-control"  id = "name" name = "name"  value = "${agent.name }">
						    </div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 control-label">区域</label>
							<div class="col-lg-4">
									<input type="text" class="form-control"  id = "area"  value = "${agent.area.areaName }">
							</div>
					</div>                               	                              				                                				                              			                                
					<div class="form-group">
						<label class="col-lg-4 control-label">代理性质</label>
							<div class="col-lg-4">
									<input type="text" class="form-control"  id = "agentType" value = "${agent.agentType }">
							</div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 control-label">可用房卡数</label>
							<div class="col-lg-4">
									<input type="text" class="form-control"  id = "againPwd" >
							</div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 control-label">房卡小号数</label>
							<div class="col-lg-4">
									<input type="text" class="form-control"  id = "againPwd" >
							</div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 control-label">冲房卡数量</label>
							<div class="col-lg-4">
									<select class="form-control" id = "card" onchange="getAward()">
										
										<c:forEach items="${cardList }" var="card" >
											<option value = "${card.id }">${card.card}</option>
										</c:forEach>
									</select>
							</div>
					</div>
					<div class="form-group">
						<label class="col-lg-4 control-label">返现数量</label>
							<div class="col-lg-4">
									<input type="text" class="form-control"  id = "Award" >
							</div>
					</div>
                              
                           
                            
                                
                                    <hr>
                                <div class="form-group">
                                  <div class="col-lg-offset-1 col-lg-9">

                                    <button type="button" class="btn btn-success" onclick="submitUpdate()">Success</button>
                                  
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
				

        </div>
		  </div>

		<!-- Matter ends -->
		
		

    </div>

   <!-- Mainbar ends -->
   <div class="clearfix"></div>

</div>

<jsp:include page="../foot.jsp"></jsp:include>

<script type="text/javascript">
$(function(){
getAward();
})
function getAward(){
	var cardId = $('#card').val();
	
	$.ajax({
		type:"post",
		url:"card/ajaxQueryCardById.do",
		data:{
			id : cardId									
					},		
		dataType:"json",
		success:function(data){	
			$('#Award').val(data.award);
					
			},
		error:function(){
									
		}
	});	
}
function submitUpdate(){
	var userId = $('#userId').val();
	var card = $('#card').find("option:selected").text();
	var award = $('#Award').val();
	$.ajax({
		type:"post",
		url:"card/ajaxUpdateUser.do",
		data:{
			userId:userId,
			card : card,
			award : award									
					},		
		dataType:"json",
		success:function(data){	
			
			if(data.success){
				if(!confirm("充值成功,是否继续充值")){
					window.location.href = "card/getSearch.do"
				};
			}else{
				alert(data.errorMsg);
			}		
			},
		error:function(){
									
		}
	});	
}
</script>

</body>
</html>
