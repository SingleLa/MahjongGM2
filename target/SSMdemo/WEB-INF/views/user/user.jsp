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
    
    <title>用户管理</title>
    
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
	<script src="<%=basePath %>js/jquery.min.js"></script>
	<script src="<%=basePath %>js/bootstrap-modal.js"></script>
	<script src="<%=basePath %>js/bootstrap-modalmanager.js"></script>
	<script src="<%=basePath %>js/bootstrap.js"></script>
</head>

<script type="text/javascript">
 var hiddenUserId;
 var hiddenData; 
 
$(function(){
	$('#roleDiv').hide();
});
function queryUser(userId){
	hiddenUserId = userId;
		 $.ajax({
				type:"post",
				url:"user/ajaxGetUserRole.do",
				data:{
					userId : userId ,
						
						},		
				dataType:"json",
				success:function(data){	
					var userId = data.id;
					$('#userIdHidden').val(userId);
					var roleList = data.roleList;
					$('#roleDiv').show();
					$('#roleTable').empty();
					var _html = "";
					_html += "<thead>"
							+"<tr>"
							+"<th>角色Id</th>"
							+"<th>角色名称</th>"
							+"<th></th>"
							
							+"</tr>"
							+"</thead>"
							+" <tbody>";
					if(roleList.length==0){
					_html += "<tr><td></td><td></td><td></td></tr>";
					}else{
						for(var i = 0; i<roleList.length; i++){
						_html += "<tr>"
					             +"<td>"+roleList[i].id+"</td>"
					             +"<td>"+roleList[i].roleName+"</td>"
					             +"<td>"+"<button class='btn btn-xs btn-danger'  onclick='deleteRole("+roleList[i].id+")'><i class='icon-remove'></i> </button>"+"</td>"					                      					                        			
			                     +"</tr>";												
						}
					}
					_html += "</tbody>";
					$('#roleTable').append(_html);
						},
				error:function(){
									
						}
						});	
						
      
      }
			                      		
function deleteRole(id){
	$.ajax({
		type:"post",
		url:"user/ajaxDeleteUserRole.do",
		data:{
			roleId:id,
			userId:hiddenUserId										
					},		
		dataType:"json",
		success:function(data){	
		if(data.success){
			alert("删除成功！");
			window.location.reload();
			}else{
			alert("删除失败");
			}
					
			},
		error:function(){
									
		}
	});	
}
function addUser(){

			$('#addUserModal').modal({
				keyboard: true
			});

}
function add(){
	var userName = $('#userName').val();
	var password = $('#password').val();
			$.ajax({
				type:"post",
				url:"user/ajaxAddUser.do",
				data:{
						userName:userName,	
						password:password									
						},		
				dataType:"json",
				success:function(data){	
					if(data.success){
						alert("添加成功！");
						window.location.reload();
					}else{
						alert("添加失败,用户名重复");
					}
					
						},
				error:function(){
									
						}
						});	
						
}
function deleteUser(userId){
		$.ajax({
				type:"post",
				url:"user/ajaxDeleteUser.do",
				data:{
						userId:userId										
						},		
				dataType:"json",
				success:function(data){	
					if(data.success){
						alert("删除成功！");
						window.location.reload();
					}else{
						alert("删除失败");
					}
					
						},
				error:function(){
									
						}
						});	
						
}
function addRole(){
 var userId = hiddenUserId;
$.ajax({
				type:"post",
				url:"user/ajaxQueryUserRole.do",
				data:{
						userId:userId										
						},		
				dataType:"json",
				success:function(data){	
					hiddenData = data;
					$('#addRoleModal').modal({
						keyboard: true
					});
					$('#addUserName').val(data.user.userName);
					$('#addRole').empty();
					var html_ = '';
					if(data.role.length == 0){
						html_ += '<option></option>';
					}else{
						for(var i = 0 ; i < data.role.length; i++){
							html_ += "<option value = '"+data.role[i].id+"'>"+data.role[i].roleName+"</option>";
						}
					}
					$('#addRole').append(html_);
						},
				error:function(){
									
						}
						});	

}
function addUserRole(){
	var roleId = $('#addRole').val();
	var flag = true;
	for(var i = 0 ; i < hiddenData.user.roleList.length; i++){
		if(hiddenData.user.roleList[i].id == roleId){
			flag = false;
			break;
		}
	}
	if(!flag){
		alert("已经存在该角色");
	}else{
			$.ajax({
				type:"post",
				url:"user/ajaxAddUserRole.do",
				data:{
						userId:hiddenData.user.id,
						roleId:roleId										
						},		
				dataType:"json",
				success:function(data){	
					if(data.success){
						alert('添加成功');
						$('#addRoleModal').modal('hide');
					 	window.location.reload();
					}
						},
				error:function(){
									
						}
						});	
	}
}

</script>

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
		              <div class="col-md-4">
		                <div class="widget">
			                <div class="widget-head">
			                  <div class="pull-left">Tables</div>
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
		                          <th>用户Id</th>
		                          <th>用户名称</th>
		                          <th>用户密码</th>                          
		                          <th>操作</th>
		                        </tr>
		                      </thead>
		                      <tbody>
								<c:forEach items="${userList }" var="user">
									<tr>
				                          <td>${user.id}</td>
				                          <td>${user.userName}</td>
				                          <td>${user.password}</td>		                      
				                          <td>
				                          	<button class="btn btn-xs btn-warning"  onclick="queryUser(${user.id})"><i class="icon-pencil"></i> </button>
				                          	<button class="btn btn-xs btn-danger"  onclick="deleteUser(${user.id})"><i class="icon-remove"></i> </button>
				                          </td>
		                        	</tr>
								</c:forEach>                                                                                                           
		                      </tbody>
		                    </table>
		                    <div class="widget-foot">                    
		                      <button class="label label-success" onclick="addUser()" >新增用户</button>                                          
		                      <div class="clearfix"></div> 
		                    </div>
		                  </div>
		                </div>
		              </div>
		               <div class="col-md-4">
		               	<div id="roleDiv">
					               	<div class="widget">			
					                <div class="widget-head">
					                  <div class="pull-left">Tables</div>
					                  <div class="widget-icons pull-right">
					                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a> 
					                    <a href="#" class="wclose"><i class="icon-remove"></i></a>
					                  </div>  
					                  <div class="clearfix"></div>
					                </div>		
					                  <div class="widget-content">
										<input type="hidden" id= "userIdHidden">
					                    <table id = "roleTable" class="table table-striped table-bordered table-hover">		                      
					                    </table>			
					                    <div class="widget-foot">			                     
					                      <div class="clearfix"></div> 
					 						<button class="label label-success" onclick="addRole()" >添加角色</button>
					                    </div>			
					                  </div>			
					                </div>
					           <!-- 添加模态框（Modal） -->
								<div class="modal fade" id="addRoleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								    <div class="modal-dialog" style="left:0">
								        <div class="modal-content">
								            <div class="modal-header">
								                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								                <h4 class="modal-title" id="myModalLabel">编辑</h4>
								            </div>
								            <div class="modal-body">
								            		      <div class="widget-content">
									                  <div class="padd">
									
									                    <h6>角色添加</h6>
									                    <hr />
									                    <!-- Form starts.  -->
									                     <form class="form-horizontal" role="form">																	
									                                <div class="form-group">
									                                  <label class="col-lg-4 control-label">用户名称</label>
									                                  <div class="col-lg-8">
									                                    <input type="text" class="form-control"  id = "addUserName" readonly="readonly">
									                                  </div>
									                                </div>
									                    			<div class="form-group">
									                                  <label class="col-lg-4 control-label">用户角色</label>
									                                  <div class="col-lg-8">
									                                    <select class = "form-control" id = "addRole">
									                                    
									                                    </select>
									                                  </div>
									                                </div>                                	                              				                                				                              			                                
									                                    <hr />
									                       
									                              </form>
									                  </div>
									                </div>
								            
								            </div>
								            <div class="modal-footer">
								                <button type="reset" class="btn btn-default" data-dismiss="modal">关闭或 ESC</button>
								                <button type="button" class="btn btn-primary" onclick="addUserRole()">提交更改</button>
								            </div>
								        </div><!-- /.modal-content -->
								    </div><!-- /.modal-dialog -->
								</div>
								
								<!-- user添加模态框（Modal） -->
								<div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								    <div class="modal-dialog" style="left:0">
								        <div class="modal-content">
								            <div class="modal-header">
								                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								                <h4 class="modal-title" id="myModalLabel">编辑</h4>
								            </div>
								            <div class="modal-body">
								            		      <div class="widget-content">
									                  <div class="padd">
									
									                    <h6>角色添加</h6>
									                    <hr />
									                    <!-- Form starts.  -->
									                     <form class="form-horizontal" role="form">																	
									                                <div class="form-group">
									                                  <label class="col-lg-4 control-label">用户名称</label>
									                                  <div class="col-lg-8">
									                                    <input type="text" class="form-control"  id = "userName" >
									                                  </div>
									                                </div>
									                    			<div class="form-group">
									                                  <label class="col-lg-4 control-label">用户密码</label>
									                                  <div class="col-lg-8">
									                                    <input type="text" class="form-control"  id = "password" >
									                                  </div>
									                                </div>                                	                              				                                				                              			                                
									                                    <hr />
									                       
									                              </form>
									                  </div>
									                </div>
								            
								            </div>
								            <div class="modal-footer">
								                <button type="reset" class="btn btn-default" data-dismiss="modal">关闭或 ESC</button>
								                <button type="button" class="btn btn-primary" onclick="add()">提交更改</button>
								            </div>
								        </div><!-- /.modal-content -->
								    </div><!-- /.modal-dialog -->
								</div>
			<!-- /.modal -->      
					                
					           
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

</body>
</html>
