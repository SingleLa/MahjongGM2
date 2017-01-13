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
    
    <title>会员查询</title>
    
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
		    <div class="page-head">
			      <h2 class="pull-left"><i class="icon-home"></i> 首页</h2>
			        <div class="bread-crumb pull-right">
				          <a href="index.html"><i class="icon-home"></i> 首页</a> 
				          <!-- Divider -->
				          <span class="divider">/</span> 
				          <a href="#" class="bread-current">控制台</a>
			        </div>
		        <div class="clearfix"></div>
		    </div>		
		   <div class="matter">
	     	 <div class="container">
	     		 <form class="navbar-form navbar-right "  role="search" >
					<div class="form-group">
						 <div class="form-group">							
							<div class="col-lg-4">
							
							</div>
							<div class="col-lg-4">
							<button type="button" class="btn btn-default" onclick="searchModel()">查询</button>   
							</div>
							<div class="col-lg-4">
							           
							</div>
						</div>
						
					</div>
				 </form>
				<div class="matter">
			        <div class="container">
				<input type="hidden" id = "useragentType" value = "${user.agentType}"> 
				<input type="hidden" id = "userareaId" value = "${user.areaId}">
			          <!-- Table -->
			
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
			
			                    <table class="table table-striped table-bordered table-hover">
			                      <thead>
			                        <tr>
			                          <th></th>
			                          <th>昵称</th>
			                          <th>所属区域</th>
			                          <th>代理性质</th>
			                          <th>可用房卡总数</th>
			                          <th>消费房卡总数</th>
			                          <th>微信号</th>
			                          <th>手机号</th>
			                          <th>状态</th>
			                          
			                          <th>创建时间</th>
			                          <th>查看子代理</th>
			                          <th>Control</th>
			                        </tr>
			                      </thead>
			                      <tbody id = "agentBody">
									
			                                                                                                                                                                        
			                      </tbody>
			                    </table>
			
			                    <div class="widget-foot">
									<button type="button" class="btn btn-primary" onclick="add()">添加</button>     
									<ul class="pagination pull-right" id = "pageFoot">
									
									</ul>                                                            
			                      <div class="clearfix"></div> 
								
									
								
								
			                    </div>
			
			                  </div>
			
			                </div>
			
			
			              </div>
			
			            </div>
			
			        </div>
				</div>
	
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
									
									                    <h6>角色添加</h6>
									                    <hr />
									                    <!-- Form starts.  -->
									                     <form class="form-horizontal" role="form">
									                     	<c:if test="${user.agentType > 2}">																	
									                                <div class="form-group">
									                              
									                                  <label class="col-lg-4 control-label">所属区域</label>
									                                  <div class="col-lg-8">
									                                     <select class = "form-control" id = "areaId">								                                  
											                                  <c:forEach items="${areaList }" var="area">																				  																				 
																				  	<option value="${area.id }">${area.areaName }</option>																				  
																			 </c:forEach>
																			 </select>		
									                                  </div>
									                                </div>
									                          </c:if>
									                    			<div class="form-group">
									                                  <label class="col-lg-4 control-label">代理性质</label>
									                                  <div class="col-lg-8">
									                                  <select class = "form-control" id = "agentType">	
									                                   	<c:if test="${user.agentType == 1}">
																		  	<option value = "1">普通代理</option>
																		  </c:if>							                                  
									                                  <c:forEach var="agentType" begin="1" end="${user.agentType-1}">
																		  <c:if test="${agentType == 1}">
																		  	<option value = "1">普通代理</option>
																		  </c:if>
																		  <c:if test="${agentType == 2}">
																		  	<option value = "2">区域代理</option>
																		  </c:if>
																		  <c:if test="${agentType == 3}">
																		  	<option value = "3">总代理</option>
																		  </c:if>
																		  <c:if test="${agentType == 4}">
																		  	<option value = "4">admin</option>
																		  </c:if>
																	 </c:forEach>
																	 </select>									                                 	
									                                  </div>
									                                </div> 
									                                <div class="form-group">
									                                  <label class="col-lg-4 control-label">昵称</label>
									                                  <div class="col-lg-8">
									                                    <input type="text" class="form-control"  id = "name" >
									                                  </div>
									                                </div>
									                                <div class="form-group">
									                                  <label class="col-lg-4 control-label">手机号</label>
									                                  <div class="col-lg-8">
									                                    <input type="text" class="form-control"  id = "userName" >
									                                  </div>
									                                </div>
									                                <div class="form-group">
									                                  <label class="col-lg-4 control-label">微信号</label>
									                                  <div class="col-lg-8">
									                                    <input type="text" class="form-control"  id = "weixin" >
									                                  </div>
									                                </div>                               	                              				                                				                              			                                
									                                    <hr />
									                       
									                              </form>
									                  </div>
									                </div>
								            
								            </div>
								            <div class="modal-footer">
								                <button type="reset" class="btn btn-default" data-dismiss="modal">关闭或 ESC</button>
								                <button type="button" class="btn btn-primary" onclick="addUser()">添加</button>
								            </div>
								        </div><!-- /.modal-content -->
								    </div><!-- /.modal-dialog -->
								</div>
			<!-- 添加模态框（Modal） -->
								<div class="modal fade" id="queryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								    <div class="modal-dialog" style="left:0">
								        <div class="modal-content">
								            <div class="modal-header">
								                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								                <h4 class="modal-title" id="myModalLabel">编辑</h4>
								            </div>
								            <div class="modal-body">
								            		      <div class="widget-content">
									                  <div class="padd">
									
									                    <h6>代理查询</h6>
									                    <hr />
									                    <input type="hidden" id= "createrid" >
									                    <!-- Form starts.  -->
									                     <form class="form-horizontal" role="form">
									                     	<c:if test="${user.agentType > 2}">																	
									                                <div class="form-group">
									                              
									                                  <label class="col-lg-4 control-label">所属区域</label>
									                                  <div class="col-lg-8">
									                                     <select class = "form-control" id = "queryareaId">	
									                                    	 <option value="">所有</option>								                                  
											                                  <c:forEach items="${areaList }" var="area">																				  																				 
																				  	<option value="${area.id }">${area.areaName }</option>																				  
																			 </c:forEach>
																			 </select>		
									                                  </div>
									                                </div>
									                          </c:if>
									                    			<div class="form-group">
									                                  <label class="col-lg-4 control-label">代理性质</label>
									                                  <div class="col-lg-8">
									                                  <select class = "form-control" id = "queryagentType">	
									                                   <option value="">所有</option>								                                  
									                                  <c:forEach var="agentType" begin="1" end="${user.agentType}">
																		  <c:if test="${agentType == 1}">
																		  	<option value = "1">普通代理</option>
																		  </c:if>
																		  <c:if test="${agentType == 2}">
																		  	<option value = "2">区域代理</option>
																		  </c:if>
																		  <c:if test="${agentType == 3}">
																		  	<option value = "3">总代理</option>
																		  </c:if>
																		  <c:if test="${agentType == 4}">
																		  	<option value = "4">admin</option>
																		  </c:if>
																	 </c:forEach>
																	 </select>									                                 	
									                                  </div>
									                                </div> 
									                                <div class="form-group">
									                                  <label class="col-lg-4 control-label">昵称</label>
									                                  <div class="col-lg-8">
									                                    <input type="text" class="form-control"  id = "queryname" >
									                                  </div>
									                                </div>
									                                <div class="form-group">
									                                  <label class="col-lg-4 control-label">手机号</label>
									                                  <div class="col-lg-8">
									                                    <input type="text" class="form-control"  id = "queryuserName" >
									                                  </div>
									                                </div>
									                                <div class="form-group">
									                                  <label class="col-lg-4 control-label">微信号</label>
									                                  <div class="col-lg-8">
									                                    <input type="text" class="form-control"  id = "queryweixin" >
									                                  </div>
									                                </div>                               	                              				                                				                              			                                
									                                    <hr />
									                       
									                              </form>
									                  </div>
									                </div>
								            
								            </div>
								            <div class="modal-footer">
								                <button type="reset" class="btn btn-default" data-dismiss="modal">关闭或 ESC</button>
								                <button type="button" class="btn btn-primary" onclick="queryUser()">查询</button>
								            </div>
								        </div><!-- /.modal-content -->
								    </div><!-- /.modal-dialog -->
								</div>
					<!-- 添加模态框（Modal） -->
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
									
									                    <h6>代理修改</h6>
									                    <hr />
									                   
									                    <!-- Form starts.  -->
									                     <form class="form-horizontal" role="form">
									                     			  <input type="hidden" class="form-control"  id = "updateUserId" >														
									                                <div class="form-group">
									                              
									                                  <label class="col-lg-4 control-label">所属区域</label>
									                                  <div class="col-lg-8">
									                                     <input class = "form-control" id = "updateareaId" readonly="readonly">		
									                                  </div>
									                                </div>
									                       
									                    			<div class="form-group">
									                                  <label class="col-lg-4 control-label">代理性质</label>
									                                  <div class="col-lg-8">
									                                  <select class = "form-control" id = "updateagentType">	
									                                   							                                  

																	 </select>									                                 	
									                                  </div>
									                                </div> 
									                                <div class="form-group">
									                                  <label class="col-lg-4 control-label">昵称</label>
									                                  <div class="col-lg-8">
									                                    <input type="text" class="form-control"  id = "updatename"  readonly="readonly">
									                                  </div>
									                                </div>
									                                <div class="form-group">
									                                  <label class="col-lg-4 control-label">手机号</label>
									                                  <div class="col-lg-8">
									                                    <input type="text" class="form-control"  id = "updateuserName"  readonly="readonly">
									                                  </div>
									                                </div>
									                                <div class="form-group">
									                                  <label class="col-lg-4 control-label">微信号</label>
									                                  <div class="col-lg-8">
									                                    <input type="text" class="form-control"  id = "updateweixin" readonly="readonly" >
									                                  </div>
									                                </div>                               	                              				                                				                              			                                
									                                    <hr />
									                       
									                              </form>
									                  </div>
									                </div>
								            
								            </div>
								            <div class="modal-footer">
								                <button type="reset" class="btn btn-default" data-dismiss="modal">关闭或 ESC</button>
								                <button type="button" class="btn btn-primary" onclick="updateUser()">修改</button>
								            </div>
								        </div><!-- /.modal-content -->
								    </div><!-- /.modal-dialog -->
								</div>
		   </div>


    </div>

   <!-- Mainbar ends -->
   <div class="clearfix"></div>

</div>

<jsp:include page="../foot.jsp"></jsp:include>
<script type="text/javascript">

$(function(){
getAgent();
	$('#addModal').on('hidden.bs.modal', function () {
	  // 执行一些动作...

	  $('#name').val('');
	  $('#userName').val('');
	  $('#weixin').val('');
	})
	$('#queryModal').on('hidden.bs.modal', function () {
	  // 执行一些动作...

	  $('#queryname').val('');
	  $('#queryuserName').val('');
	  $('#queryweixin').val('');
	})
})
function add(){
	$('#addModal').modal({
				keyboard: true
			});
	
 }
function addUser(){
  var useragentType = $('#useragentType').val();
  var userareaId = $('#userareaId').val();
  var areaId;
  if(useragentType<3){
  	  areaId = userareaId;
  }else{
  	  areaId = $('#areaId').val();
  }
  var agentType = $('#agentType').val();
  var name =$('#name').val();
  var userName =$('#userName').val();
  var weixin =$('#weixin').val();
  $.ajax({
		type:"post",
		url:"agent/ajaxAddAgent.do",
		data:{
			areaId:areaId,	
			agentType:agentType,
			name:name,
			userName:userName,
			weixin:weixin						
					},		
		dataType:"json",
		success:function(data){	
			if(data.success){
				alert("添加成功");
				window.location.reload();
			}else{
				alert(data.errorMsg);
			}								
			},
		error:function(){
									
		}
	});	

}
function getAgent(pageNo,params){
	
	if(pageNo == null || pageNo == 0){
		pageNo = 1;
	}
	var areaId;
	var agentType;
	var name;
	var userName;
	var weixin;
	var id;
	var createrid;
	if(params != undefined){
		if(params.areaId != undefined){
			areaId = params.areaId;
		}
		if(params.agentType != undefined){
			agentType = params.agentType;
		}
		if(params.name != undefined){
			name = params.name;
		}
		if(params.userName != undefined){
			userName = params.userName;
		}
		if(params.weixin != undefined){
			weixin = params.weixin;
		}
		if(params.id != undefined){
			id = params.areaId;
		}
		if(params.createrid != undefined){
			createrid = params.createrid;
		}
		
	}
	
	
	$.ajax({
		type:"post",
		url:"agent/ajaxQueryAgent.do",
		data:{
			pageNo:pageNo,
			pageSize:20,
			id:id,
			areaId:areaId,
			agentType:agentType,
			name:name,
			userName:userName,	
			weixin:weixin,
			createrid:createrid							
					},		
		dataType:"json",
		success:function(data){	
		
			var list = data.list;
			var tbody = $('#agentBody');
			tbody.empty();
			var html = "";
			if(list == null){
			      html += "<tr>"
			     	   + "<td></td>"
			     	   + "<td></td>"
			     	   + "<td></td>"
			     	   + "<td></td>"
			     	   + "<td></td>"
			     	   + "<td></td>"
			     	   + "<td></td>"
			     	   + "<td></td>"
			     	   + "<td></td>"
			     	   + "<td></td>"
			     	   + "<td>"
			     	   + "<button class='btn btn-xs btn-danger' onclick='del(${area.id})'><i class='icon-remove'></i> </button>"
			     	   + "</tr>";
			    
			}else{
				for(var i = 0; i <list.length; i ++){
				var date = formatDate(list[i].createtime);
				var agent = "";
				if(list[i].agentType == 3){
					agent = "总代理";
				}
				if(list[i].agentType == 2){
					agent = "区域代理";
				}
				if(list[i].agentType == 1){
					agent = "普通代理";
				}
					 html += "<tr>"
			     	   + "<td></td>"
			     	   + "<td>"+list[i].name+"</td>"
			     	   + "<td>"+list[i].area.areaName+"</td>"
			     	   + "<td>"+agent+"</td>"
			     	   + "<td>"+list[i].card+"</td>"
			     	   + "<td>"+list[i].usecard+"</td>"
			     	   + "<td>"+list[i].weixin+"</td>"
			     	   + "<td>"+list[i].userName+"</td>"
			     	   + "<td>"+list[i].status+"</td>"
			     	   
			     	   + "<td>"+date+"</td>"
			     	   + "<td><a href = 'javaScript:void(0)' onclick='queryAgentUser("+list[i].id+")'>查看</a></td>"
			     	   + "<td>"
			     	   + "<button class='btn btn-xs btn-warning' onclick='updateAgent("+list[i].id+")'><i class='icon-pencil'></i> </button>"
			     	   + "<button class='btn btn-xs btn-danger' onclick='del("+list[i].id+")'><i class='icon-remove'></i> </button>"
			     	   + "</tr>";
				}
			}
			 									
						tbody.append(html);	
						pageFoot(data);
					
			},
		error:function(){
									
		}
	});	
}
function pageFoot(data){
	var pageNo = Number(data.pageNum);	
    var firstPage = data.firstPage;
    var hasNextPage = data.hasNextPage;
    var hasPreviousPage = data.hasPreviousPage;
    var isFirstPage = data.isFirstPage;
    var isLastPage = data.isLastPage;
    var lastPage = data.lastPage;
    var pageSize = data.pageSize;
    var pages = data.pages;
	var pageFoot = $('#pageFoot');
	pageFoot.empty();
	var html = "";
	if(hasPreviousPage){
		var num = pageNo-1;
		html += "<li><a href='javaScript:void(0)' onclick='getAgent("+num+")'>Prev</a></li>";
	}else{
		html += "<li><a href='javaScript:void(0)'>Prev</a></li>";
	}
	if(pages > 1){
	for(var i =1; i<= pages; i++){
		html += "<li><a href='javaScript:void(0)' onclick='getAgent("+i+")'>"+i+"</a></li>";
	}
	}else{
		html += "<li><a href='javaScript:void(0)' onclick='getAgent("+1+")'>"+1+"</a></li>";
	}
	
	if(hasNextPage){
		var num = pageNo+1;
		html += "<li><a href='javaScript:void(0)' onclick='getAgent("+num+")'>Next</a></li>";
	}else{
		html += "<li><a href='javaScript:void(0)'>Next</a></li>";
	}
          pageFoot.append(html);


}
function queryAgentUser(id){
	$('#createrid').val(id);
	var params = [];
	params.createrid = id;
	getAgent(null,params);
}
function searchModel(){
	$('#queryModal').modal({
				keyboard: true
			});

}
function updateAgent(id){

$.ajax({
		type:"post",
		url:"agent/ajaxQueryAgentById.do",
		data:{
				id : id		
					},		
		dataType:"json",
		success:function(data){	
			var useragentType = $('#useragentType').val();
			$('#updateUserId').val(data.id);
			$('#updateareaId').val(data.area.areaName);
			$('#updatename').val(data.name);
			$('#updateuserName').val(data.userName);
			$('#updateweixin').val(data.weixin);
			$('#updateagentType').empty();
			if(useragentType>3){
			var html = "";
			html += "<option value = '3'";
			if(data.agentType == 3){
			html += "selected = 'selected'";
			}
			html += ">总代理</option>";
			$('#updateagentType').append(html);
			}
			if(useragentType>2){
			var html = "";
			html += "<option value = '2'";
			if(data.agentType == 2){
			html += "selected = 'selected'";
			}
			html += ">区域代理</option>";
			$('#updateagentType').append(html);
			}
			var html = "";
			html += "<option value = '1'";
			if(data.agentType == 1){
			html += "selected = 'selected'";
			}
			html += ">普通代理</option>";
			$('#updateagentType').append(html);
			
			$('#updateModal').modal({
				keyboard: true
			});

		},
		error:function(){
									
		}
	});	

}
function updateUser(){
	var id = $('#updateUserId').val();
	var agentType = $('#updateagentType').val();
	$.ajax({
		type:"post",
		url:"agent/ajaxUpdateAgent.do",
		data:{
				id : id	,
				agentType:agentType	
					},		
		dataType:"json",
		success:function(data){	
			if(data.success){
				alert("修改成功！");
				window.location.reload();
			}else{
				alert(data.errorMsg);
			}
		},
		error:function(){
									
		}
	});	
}
function queryUser(){
	var params = [];
	params.areaId = $('#queryareaId').val();
	params.agentType = $('#queryagentType').val();
	params.name = $('#queryname').val();
	params.userName = $('#queryuserName').val();
	params.weixin = $('#queryweixin').val();
	params.createrid = $('#createrid').val();
	getAgent(null,params);
	$('#queryModal').modal('hide');
}
function   formatDate(now)   { 
			  now  = new Date(now);    
              var   year=now.getYear();     
              var   month=now.getMonth()+1;     
              var   date=now.getDate();     
              var   hour=now.getHours();     
              var   minute=now.getMinutes();     
              var   second=now.getSeconds();     
              return   year+"-"+month+"-"+date+"   "+hour+":"+minute+":"+second;     
              }   
</script>


</body>
</html>
