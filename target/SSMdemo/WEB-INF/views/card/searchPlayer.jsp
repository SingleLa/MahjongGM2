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
			<div class="row">

            <div class="col-md-12">


              <div class="widget wgreen">
                
                <div class="widget-head">
                  <div class="pull-left">Search</div>
                  <div class="widget-icons pull-right">
                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a> 
                    <a href="#" class="wclose"><i class="icon-remove"></i></a>
                  </div>
                  <div class="clearfix"></div>
                </div>

	                <div class="widget-content">
		                  <div class="padd">
		
		                    <h6>Search</h6>
		                    <hr>
		                    <!-- Form starts.  -->
		                     <form class="form-horizontal" role="form">
		                              <div class="row" style="height: 150"></div>
		        					  <div class="row" >
		        					  		<div class="col-lg-4 "></div>
		        					  		<div class="col-lg-4 ">
		        					  			<div class="form-group">						
													<label class="col-lg-3 control-label pull-left">玩家ID</label>
														<div class="col-lg-6">
														
															<input type="text" class="form-control"  name = "playerId" id = "playerId" >
														</div>
														<div class="col-lg-3 ">
															<button type="button" class="btn btn-default" onclick = "search()">查询</button>
														</div>
												</div>
		        					  		</div>
		        					  		<div class="col-lg-4 "></div>
		        					  	
		        					  </div>
									  <div class="row" style="height: 150"></div>
		                                    <hr>
		                                <div class="form-group">
		                                  <div class="col-lg-offset-1 col-lg-9">
		                                    
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
			
			
			<div class="col-lg-4 "></div>
        </div>
		  </div>

		<!-- Matter ends -->

    </div>

   <!-- Mainbar ends -->
   <div class="clearfix"></div>

</div>

<!-- model -->
		
		<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								    <div class="modal-dialog" style="left:0">
								        <div class="modal-content">
								            <div class="modal-header">
								                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								                <h4 class="modal-title" id="myModalLabel">编辑</h4>
								            </div>
								            <div class="modal-body">
								            		 <div class="row">
											            <div class="col-md-12">																					
											              <div class="widget wgreen">
											                
											            
											
												                <div class="widget-content">
													                  <div class="padd">
													
													                    <h6>Search</h6>
													                    <hr>
													                    <!-- Form starts.  -->
													                     <form class="form-horizontal" role="form">
													                              <div class="form-group">
													                                  <label class="col-lg-4 control-label">玩家ID</label>
													                                  <div class="col-lg-8">
													                                    <input type="text" class="form-control" placeholder="玩家ID" id = "playerId2" readonly="readonly">
													                                  </div>
													                                </div>
													                                <div class="form-group">
													                                  <label class="col-lg-4 control-label">玩家昵称</label>
													                                  <div class="col-lg-8">
													                                    <input type="text" class="form-control" placeholder="玩家昵称" id = "playerName" readonly="readonly">
													                                  </div>
													                                </div>
													                                <div class="form-group">
													                                  <label class="col-lg-4 control-label">房卡数量</label>
													                                  <div class="col-lg-8">
													                                    <input type="text" class="form-control" placeholder="房卡数量" id = "playerCard" readonly="readonly">
													                                  </div>
													                                </div>
													                              <div class="form-group">
													                                  <label class="col-lg-4 control-label">充值数量</label>
													                                  <div class="col-lg-8">
													                                    <input type="text" class="form-control" placeholder="房卡数量" id = "card">
													                                  </div>
													                                </div>
													                              
													                                    <hr>
													                                <div class="form-group">
													                                  <div class="col-lg-offset-1 col-lg-9">
													                                    
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
								            <div class="modal-footer">
								                <button type="reset" class="btn btn-default" data-dismiss="modal">关闭或 ESC</button>
								                <button type="button" class="btn btn-primary" onclick="update()">充值</button>
								            </div>
								        </div><!-- /.modal-content -->
								    </div><!-- /.modal-dialog -->
		</div>



<jsp:include page="../foot.jsp"></jsp:include>

<script type="text/javascript">
$(function(){
$('#updateModal').on('hidden.bs.modal', function () {
	  // 执行一些动作...
			
			$('#playerId2').val('');
			$('#playerName').val('');
			$('#playerCard').val('');
			$('#card').val('');
	
	})
})
function search(){
	var playerId = $('#playerId').val();
	if(playerId == null && playerId == ''){
		alert("请输入玩家ID");
		return;
	}
	
	$.ajax({
		type:"post",
		url:"card/ajaxQueryPlayerById.do",
		data:{
			PlayerId : playerId									
					},		
		dataType:"json",
		success:function(data){	
		if(data.success){
			if(data.player == null){
				alert("无此玩家数据");
				return;
			}
			data = data.player;
			$('#playerId2').val(data.id);
			$('#playerName').val(data.name);
			$('#playerCard').val(data.card);
			
			$('#updateModal').modal({
				keyboard: true
			});
			
		}else{
			alert(data.errorMsg);
		}

					
			},
		error:function(){
									
		}
	});	
}
function update(){
 var card = $('#card').val();
 var playerId = $('#playerId2').val();
 if(card == null || card == ''){
 	alert("请填写充值数量");
 	return;
 }
	$.ajax({
		type:"post",
		url:"card/ajaxUpdatePlayer.do",
		data:{
			playerId : playerId,
			card : card								
					},		
		dataType:"json",
		success:function(data){	
		
			if(data.success){
				alert("充值成功")
			}else{
				alert(data.errorMsg);
			}
			window.location.reload();

					
			},
		error:function(){
									
		}
	});	
}
</script>

</body>
</html>
