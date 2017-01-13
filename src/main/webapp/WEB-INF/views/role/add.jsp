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
    
    <title>My JSP 'head.jsp' starting page</title>
    
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
  
  <link href="<%=basePath %>css/bootstrap-treeview.css" rel="stylesheet">
</head>

<body>

<jsp:include page="../head.jsp"></jsp:include>

<!-- Main content starts -->

<div class="content">

<jsp:include page="../menu.jsp"></jsp:include>
  	<div class="mainbar">
	    <div class="page-head">
	      <h2 class="pull-left"><i class="icon-home"></i> 首页</h2>
	        <div class="bread-crumb pull-right">
	          <a href="index.html"><i class="icon-home"></i> 首页</a> 
	          <!-- Divider -->
	          <span class="divider">/</span> 
	          <a href="#" class="bread-current">权限控制</a>
	        </div>
        <div class="clearfix"></div>
	    </div>
	<div class="matter">
	  	<div class="container">
	      <h1>菜单</h1>
	      <br/>
	      
	      <div class="row">
	        <div class="col-sm-4">
	          <label for="treeview"></label>
	          <div id="treeview"/>
	        </div>	       
	      </div>
	      <div class = "col-sm-8">
	       		<div class="row">

              <div class="col-md-12">
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

                    <table id = "RoleMenuTable" class="table table-striped table-bordered table-hover" >
                      <thead>
                        <tr>
                          
                          <th>权限Id</th>
                          <th>权限名称</th>
                          <th>add</th>
                          <th>delete</th>
                          <th>update</th>
                          <th>query</th>
                          <th>操作</th>
                        </tr>
                      </thead>
                      <tbody>
						<c:forEach items="${menu}" var="menu">
							<tr>
		                          <td>${menu.id}</td>
		                          <td>${menu.menu.menuName}</td>
		                          <td>
			                          <label class="checkbox-inline">							                     
							                      <c:if test="${menu.tAdd == 1}">
							                      		<span class="label label-success">Active</span>
							                      </c:if> 
							           </label>	
		                          </td>
		                          <td>
		                              <label class="checkbox-inline">							                      
							                      <c:if test="${menu.tDelete == 1}">
							                      	<span class="label label-success">Active</span>
							                      </c:if>
							           </label>	
		                          </td>
		                          <td>
		                              <label class="checkbox-inline">							                     
							                      <c:if test="${menu.tUpdate == 1}">
							                      	<span class="label label-success">Active</span>
							                      </c:if>							                       
							           </label>	
		                          </td>
		                          <td>				                         
						               <label class="checkbox-inline">						                     
						                      <c:if test="${menu.tQuery == 1}">
						                     	<span class="label label-success">Active</span>
						                      </c:if>						                     
						               </label>				                                  
						                  
				                          
		                          
		                          
		                          </td>
		                          <td>	
		                         
		                          	<button class="btn btn-xs btn-warning" onclick="openModal(${menu.id})" ><i class="icon-pencil"></i>修改 </button>
		                          	<button class="btn btn-xs btn-danger" onclick="deleteRoleMenu(${menu.id})"><i class="icon-remove"></i>删除</button>		                         	                          		                          		                         
		                          </td>
                        	</tr>
						</c:forEach>
                      </tbody>
                    </table>
                    <div class="widget-foot">                  
                      <div class="clearfix"></div> 

                    </div>

                  </div>

                </div>
              </div>

            </div>
	        </div>
	       <!-- 模态框（Modal） -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-dialog" style="left:0">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			                <h4 class="modal-title" id="myModalLabel">编辑</h4>
			            </div>
			            <div class="modal-body">
			            		      <div class="widget-content">
				                  <div class="padd">
				
				                    <h6>菜单编辑</h6>
				                    <hr />
				                    <!-- Form starts.  -->
				                     <form class="form-horizontal" role="form">
				                              
				                                <div class="form-group">
				                                  <label class="col-lg-4 control-label">权限ID</label>
				                                  <div class="col-lg-8">
				                                    <input type="text" class="form-control"  id = "roleMenuId" readonly="readonly">
				                                  </div>
				                                </div>
				                                <div class="form-group">
				                                  <label class="col-lg-4 control-label">菜单ID</label>
				                                  <div class="col-lg-8">
				                                    <input type="text" class="form-control"  id = "menuId" readonly="readonly">
				                                  </div>
				                                </div>
				                    			<div class="form-group">
				                                  <label class="col-lg-4 control-label">菜单名称</label>
				                                  <div class="col-lg-8">
				                                    <input type="text" class="form-control" id = "menuName">
				                                  </div>
				                                </div>
				                                <div class="form-group">
				                                <label class="col-lg-4 control-label">权限添加</label>
				                                
				                                <label class="col-lg-8">
				                                	<div class="col-lg-3">
					                                	添加
					                                	<input type="checkbox" name="add" id="add" value="1" >
				                                	</div>
				                                	<div class="col-lg-3">
					                                	修改 
				                                		<input type="checkbox" name="update" id="update" value="1" >
				                                	</div>
				                                	<div class="col-lg-3">
					                                	删除 
				                                		<input type="checkbox" name="delete" id="delete" value="1" >
				                                	</div>
				                                	<div class="col-lg-3">
					                               		 查询
			                                        	<input type="checkbox" name="query" id="query" value="1" >
				                                	</div>				                                	
				                                					                                					                                				                                        
			                                      </label>	
			                                    </div>			                              				                                				                              			                                
				                                    <hr />
				                       
				                              </form>
				                  </div>
				                </div>
			            
			            </div>
			            <div class="modal-footer">
			                <button type="reset" class="btn btn-default" data-dismiss="modal">关闭或 ESC</button>
			                <button type="button" class="btn btn-primary" onclick="updataRoleMenu()">提交更改</button>
			            </div>
			        </div><!-- /.modal-content -->
			    </div><!-- /.modal-dialog -->
			</div>
<!-- 添加模态框（Modal） -->
			<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			    <div class="modal-dialog" style="left:0">
			        <div class="modal-content">
			            <div class="modal-header">
			                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			                <h4 class="modal-title" id="myModalLabel">编辑</h4>
			            </div>
			            <div class="modal-body">
			            		      <div class="widget-content">
				                  <div class="padd">
				
				                    <h6>菜单添加</h6>
				                    <hr />
				                    <!-- Form starts.  -->
				                     <form class="form-horizontal" role="form">
												<input type="hidden" name = "roleId" id = "roleId" value="${roleId}">
				                                <div class="form-group">
				                                  <label class="col-lg-4 control-label">菜单ID</label>
				                                  <div class="col-lg-8">
				                                    <input type="text" class="form-control"  id = "addMenuId" readonly="readonly">
				                                  </div>
				                                </div>
				                    			<div class="form-group">
				                                  <label class="col-lg-4 control-label">菜单名称</label>
				                                  <div class="col-lg-8">
				                                    <input type="text" class="form-control" id = "addMenuName" readonly="readonly">
				                                  </div>
				                                </div>
				                                <div class="form-group">
				                                <label class="col-lg-4 control-label">权限添加</label>
				                                
				                                <label class="col-lg-8">
				                                	<div class="col-lg-3">
					                                	添加
					                                	<input type="checkbox" name="add" id="tAdd" value="1" >
				                                	</div>
				                                	<div class="col-lg-3">
					                                	修改 
				                                		<input type="checkbox" name="update" id="tUpdate" value="1" >
				                                	</div>
				                                	<div class="col-lg-3">
					                                	删除 
				                                		<input type="checkbox" name="delete" id="tDelete" value="1" >
				                                	</div>
				                                	<div class="col-lg-3">
					                               		 查询
			                                        	<input type="checkbox" name="query" id="tQuery" value="1" >
				                                	</div>				                                	
				                                					                                					                                				                                        
			                                      </label>	
			                                    </div>			                              				                                				                              			                                
				                                    <hr />
				                       
				                              </form>
				                  </div>
				                </div>
			            
			            </div>
			            <div class="modal-footer">
			                <button type="reset" class="btn btn-default" data-dismiss="modal">关闭或 ESC</button>
			                <button type="button" class="btn btn-primary" onclick="addRoleMenu()">提交更改</button>
			            </div>
			        </div><!-- /.modal-content -->
			    </div><!-- /.modal-dialog -->
			</div>
			<!-- /.modal --> 
	    </div>
	</div>
    </div>
   <div class="clearfix"></div>
</div>
<jsp:include page="../foot.jsp"></jsp:include>
    
    <script src="<%=basePath %>js/bootstrap-treeview.js"></script>
  	<script type="text/javascript">
      $(function() {            	 	
          	 	$.ajax({
				type:"post",
				url:"menu/ajaxGetMenu.do",
				data:{
									
						},		
				dataType:"json",
				success:function(data){	
					 $('#treeview').treeview({
				         // color: "#428bca",
// 				          icon : "glyphicon glyphicon-stop",
 				          color: "#000000",
   						  backColor: "#FFFFFF",
// 				          expandIcon: 'glyphicon glyphicon-chevron-right',
// 				          collapseIcon: 'glyphicon glyphicon-chevron-down',
// 				          nodeIcon: 'glyphicon glyphicon-bookmark',
					      bootstrap2: false, 
					      showTags: true,
					      levels: 5,
				          enableLinks: false,
				          data: data,
				          onNodeSelected: function(event, data) {
							    // 事件代码...
							   $('#addMenuId').val(data.id);
							   $('#addMenuName').val(data.menuName);
							   
								$('#addModal').modal({
							        keyboard: true
							    });
							  
  								
							}         
				        });
					
						},
				error:function(){
									
						}
						});	
						
        })
     
function openModal(menuId){
	//查询权限信息
	$.ajax({
				type:"post",
				url:"role/ajaxQueryRoleMenu.do",
				data:{
					roleMenuId :	menuId			
						},		
				dataType:"json",
				success:function(data){	
					$("#roleMenuId").val(data.id);
					$("#menuId").val(data.menu.id);
					$("#menuName").val(data.menu.menuName);
					if(data.tAdd == 1){
						$("#add").attr("checked",true);
					}
					if(data.tDelete == 1){
						$("#delete").attr("checked",true);
					}
					if(data.tUpdate == 1){
						$("#update").attr("checked",true);
					}
					if(data.tQuery == 1){
						$("#query").attr("checked",true);
					}
				       $('#myModal').modal({
					        keyboard: true
					    });
					
						},
				error:function(){
									
						}
						});	
}
function updataRoleMenu(){
				 	var id =  $("#roleMenuId").val();
					var tAdd;
					var tUpdate;
					var tQuery;
					var tDelet; 
					
					if($("#add").is(':checked')){
						tAdd = 1;
					}else{
						tAdd = 0;
					}
					if($("#query").is(':checked')){
						tQuery = 1;
					}else{
						tQuery = 0;
					}
					if($("#update").is(':checked')){
						tUpdate = 1;
					}else{
						tUpdate = 0;
					}
					if($("#delete").is(':checked')){
						tDelet = 1;
					}else{
						tDelet = 0;
					}
				$.ajax({
				type:"post",
				url:"role/ajaxUpdateRoleMenu.do",
				data:{
					id : id,
					tAdd : tAdd,
					tQuery : tQuery,
					tUpdate : tUpdate,
					tDelete : tDelet,			
						},		
				dataType:"json",
				success:function(data){	
					if(data.success){
					 $('#myModal').modal('hide');
					 window.location.reload();
					}
						},
				error:function(){
									
						}
						});
}
function addRoleMenu(){
	var menuId = $('#addMenuId').val();
	var roleId = $('#roleId').val();
	var tAdd;
	var tUpdate;
	var tQuery;
	var tDelete; 
	if($("#tQuery").is(':checked')){
		tQuery = 1;
	}else{
		alert("请添加查询权限，查询权限为最基本权限");
		return;
	}
	
	if($("#tAdd").is(':checked')){
		tAdd = 1;
	}else{
		tAdd = 0;
	}
	if($("#tUpdate").is(':checked')){
		tUpdate = 1;
	}else{
		tUpdate = 0;
	}
	if($("#tDelete").is(':checked')){
		tDelete = 1;
	}else{
		tDelete = 0;
	}
	$.ajax({
				type:"post",
				url:"role/ajaxAddRoleMenu.do",
				data:{
					roleId : roleId,
					menueId : menuId,
					tAdd : tAdd,
					tQuery : tQuery,
					tUpdate : tUpdate,
					tDelete : tDelete,			
						},		
				dataType:"json",
				success:function(data){	
					if(data.success){
					alert('添加成功');
					 $('#addModal').modal('hide');
					 window.location.reload();
					}else{
					alert('添加失败或选择菜单已经存在');
					 $('#addModal').modal('hide');
					}
						},
				error:function(){
									
						}
	});
}
$(function(){
	$('#addModal').on('hidden.bs.modal', function () {
	  // 执行一些动作...
	  $('#addMenuId').val('');
	 
	  $("#tAdd").attr('checked',false);
	  $("#tUpdate").attr('checked',false);
	  $("#tDelete").attr('checked',false);
	  $("#tQuery").attr('checked',false);
	})
	$('#myModal').on('hidden.bs.modal', function () {
	  // 执行一些动作...
	  $("#roleMenuId").val('');
	  $("#menuId").val('');
	  $("#menuName").val('');
	  $("#add").attr("checked",false);
	  $("#delete").attr("checked",false);
	  $("#update").attr("checked",false);
	  $("#query").attr("checked",false);
	})
});
function deleteRoleMenu(id){
var statu = confirm("确定删除?");
   if(!statu){
       return false;
   }
$.ajax({
				type:"post",
				url:"role/ajaxDeleteRoleMenu.do",
				data:{
					id : id							
						},		
				dataType:"json",
				success:function(data){	
					if(data.success){
					alert('删除成功');
					 $('#addModal').modal('hide');	
					  window.location.reload();				
					}else{
					alert('删除失败');
					 $('#addModal').modal('hide');
					}
						},
				error:function(){
									
						}
	});
}
  	</script>
</body>
</html>
