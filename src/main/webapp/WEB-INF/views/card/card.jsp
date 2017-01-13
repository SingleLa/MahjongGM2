<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

			<!-- Form starts. 
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
					
				</form>		 -->
				
				<!-- table -->
				<div class="row">
			
			              <div class="col-md-12">
			                <div class="widget">
			
			                <div class="widget-head">
			                  <div class="pull-left">房卡价目表</div>
			                  <div class="widget-icons pull-right">
			                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a> 
			                    <a href="#" class="wclose"><i class="icon-remove"></i></a>
			                  </div>  
			                  <div class="clearfix"></div>
			                </div>
			
			                  <div class="widget-content">
			
			                    <table class="table table-striped table-bordered table-hover">
			                      <thead>
			                        <tr>
			                          <th></th>
			                          <th>充值额度</th>
			                          <th>返现</th>
			                          <th>创建时间</th>
			                          <th>Control</th>
			                        </tr>
			                      </thead>
			                      <tbody>
									<c:forEach items="${cardList}" var="card" varStatus ="index">
										<tr>
					                          <td>${index.index+1}</td>
					                          <td>${card.card}</td>
					                          <td>${card.award}</td> 
					                          <td><fmt:formatDate value="${card.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>                         
					                          <td>
					                          	  <button class="btn btn-xs btn-default" onclick="updateCard(${card.id})"><i class="icon-pencil"></i> </button>
					                              <button class="btn btn-xs btn-default" onclick="deleteCard(${card.id})"><i class="icon-remove"></i> </button>
					                          
					                          </td>
				                        </tr> 
									</c:forEach>
			                                                                                                                                                                        
			                      </tbody>
			                    </table>
			
			                    <div class="widget-foot">
									<button type="button" class="btn btn-primary" onclick="addCard()">添加区域</button>                                                                 
			                      <div class="clearfix"></div> 
			
			                    </div>
			
			                  </div>
			
			                </div>
			
			
			              </div>
			
			            </div>
        </div>
		  </div>

		<!-- Matter ends -->
		<!-- model -->
		
		<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								    <div class="modal-dialog" style="left:0">
								        <div class="modal-content">
								            <div class="modal-header">
								                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								                <h4 class="modal-title" id="myModalLabel">编辑</h4>
								            </div>
								            <div class="modal-body">
								            		      <div class="widget-content">
									                  <div class="padd">
									
									                    <h6>价目编辑</h6>
									                    <hr />
									                    <!-- Form starts.  -->
									                     <form class="form-horizontal" role="form">
																	<input type="hidden" id = "updateId">																
									                                <div class="form-group">
									                                  <label class="col-lg-4 control-label">价目额度</label>
									                                  <div class="col-lg-8">
									                                    <input type="text" class="form-control"  id = "updateCard" >
									                                  </div>
									                                </div>
									                    			<div class="form-group">
									                                  <label class="col-lg-4 control-label">返现</label>
									                                  <div class="col-lg-8">
									                                 	<input type="text" class="form-control"  id = "updateAward" >
									                                  </div>
									                                </div>                                	                              				                                				                              			                                
									                                    <hr />
									                       
									                              </form>
									                  </div>
									                </div>
								            
								            </div>
								            <div class="modal-footer">
								                <button type="reset" class="btn btn-default" data-dismiss="modal">关闭或 ESC</button>
								                <button type="button" class="btn btn-primary" onclick="update()">修改</button>
								            </div>
								        </div><!-- /.modal-content -->
								    </div><!-- /.modal-dialog -->
		</div>
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								    <div class="modal-dialog" style="left:0">
								        <div class="modal-content">
								            <div class="modal-header">
								                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								                <h4 class="modal-title" id="myModalLabel">添加</h4>
								            </div>
								            <div class="modal-body">
								            		      <div class="widget-content">
									                  <div class="padd">
									
									                    <h6>价目添加</h6>
									                    <hr />
									                    <!-- Form starts.  -->
									                     <form class="form-horizontal" role="form">																	
									                                <div class="form-group">
									                                  <label class="col-lg-4 control-label">价目额度</label>
									                                  <div class="col-lg-8">
									                                    <input type="text" class="form-control"  id = "addCard" >
									                                  </div>
									                                </div>
									                    			<div class="form-group">
									                                  <label class="col-lg-4 control-label">返现</label>
									                                  <div class="col-lg-8">
									                                 	<input type="text" class="form-control"  id = "addAward" >
									                                  </div>
									                                </div>                                	                              				                                				                              			                                
									                                    <hr />
									                       
									                              </form>
									                  </div>
									                </div>
								            
								            </div>
								            <div class="modal-footer">
								                <button type="reset" class="btn btn-default" data-dismiss="modal">关闭或 ESC</button>
								                <button type="button" class="btn btn-primary" onclick="add()">增加</button>
								            </div>
								        </div><!-- /.modal-content -->
								    </div><!-- /.modal-dialog -->
		</div>
    </div>

   <!-- Mainbar ends -->
   <div class="clearfix"></div>

</div>

<jsp:include page="../foot.jsp"></jsp:include>

<script type="text/javascript">
$(function(){
$('#addModal').on('hidden.bs.modal', function () {
	  // 执行一些动作...
	 
	  $('#addCard').val('');
	  $('#addAward').val('');
	})
	$('#updateModal').on('hidden.bs.modal', function () {
	  // 执行一些动作...

	  $('#updateId').val('');
	  $('#updateCard').val('');
	  $('#updateAward').val('');
	})
});
function updateCard(id){
	$('#updateModal').modal({
				keyboard: true
			});
	$.ajax({
		type:"post",
		url:"card/ajaxQueryCardById.do",
		data:{
			id : id									
					},		
		dataType:"json",
		success:function(data){	
			$('#updateId').val(data.id);
			$('#updateCard').val(data.card);
			$('#updateAward').val(data.award);
					
			},
		error:function(){
									
		}
	});
}
function addCard(){
	$('#addModal').modal({
				keyboard: true
			});
}
function update(){
	
	var id = $('#updateId').val();
	var card = $('#updateCard').val();
	var award = $('#updateAward').val();
	$.ajax({
		type:"post",
		url:"card/ajaxUpdateCardById.do",
		data:{
			id : id,
			card:card,
			award:award								
					},		
		dataType:"json",
		success:function(data){	
		$('#updateModal').modal('hide');
		if(data.success){
			alert("添加成功！");
			window.location.reload();
			}else{
			var msg = data.errorMsg;
			alert(msg);
			}
					
			},
		error:function(){
									
		}
	});
}
function add(){
	var card = $('#addCard').val();
	var award = $('#addAward').val();
	$.ajax({
		type:"post",
		url:"card/ajaxAddCard.do",
		data:{
			card:card,
			award:award										
					},		
		dataType:"json",
		success:function(data){	
		if(data.success){
			alert("添加成功！");
			window.location.reload();
			}else{
			var msg = data.errorMsg;
			alert(msg);
			}
					
			},
		error:function(){
									
		}
	});
}
function deleteCard(id){
	if(confirm("确定删除？")){
		$.ajax({
		type:"post",
		url:"card/ajaxDeleteCardById.do",
		data:{
			id:id								
					},		
		dataType:"json",
		success:function(data){	
		if(data.success){
			alert("删除成功！"); 
			window.location.reload();
			}else{
			var msg = data.errorMsg;
			alert(msg);
			}
					
			},
		error:function(){
									
		}
	});
	}
	
}
</script>

</body>
</html>
