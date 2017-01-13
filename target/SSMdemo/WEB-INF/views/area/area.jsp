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
	     		 <form class="navbar-form navbar-right "  role="search" action="<%=basePath%>area/queryArea.do" method="post">
					<div class="form-group">
						 <div class="form-group">							
							<div class="col-lg-4">
							<input type="text" class="form-control" placeholder="区域名称" name = "areaName">
							</div>
							<div class="col-lg-4">
							
							</div>
							<div class="col-lg-4">
							<button type="submit" class="btn btn-default" onclick="search()">查询</button>              
							</div>
						</div>
						
					</div>
				 </form>
				<div class="matter">
			        <div class="container">
			
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
			                          <th>#</th>
			                          <th>区域名称</th>
			                          <th>区域说明</th>
			                          <th>创建时间</th>
			                          <th>Control</th>
			                        </tr>
			                      </thead>
			                      <tbody>
									<c:forEach items="${list}" var="area" varStatus ="index">
										<tr>
					                          <td>${index.index+1}</td>
					                          <td>${area.areaName}</td>
					                          <td>${area.areaDescription}</td> 
					                          <td><fmt:formatDate value="${area.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>                         
					                          <td>
					                              <button class="btn btn-xs btn-danger" onclick="del(${area.id})"><i class="icon-remove"></i> </button>
					                          
					                          </td>
				                        </tr> 
									</c:forEach>
			                                                                                                                                                                        
			                      </tbody>
			                    </table>
			
			                    <div class="widget-foot">
									<button type="button" class="btn btn-primary" onclick="add()">添加区域</button>                                                                 
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
									                                <div class="form-group">
									                                  <label class="col-lg-4 control-label">区域名称</label>
									                                  <div class="col-lg-8">
									                                    <input type="text" class="form-control"  id = "areaName" >
									                                  </div>
									                                </div>
									                    			<div class="form-group">
									                                  <label class="col-lg-4 control-label">区域说明</label>
									                                  <div class="col-lg-8">
									                                 	<input type="text" class="form-control"  id = "areaDescription" >
									                                  </div>
									                                </div>                                	                              				                                				                              			                                
									                                    <hr />
									                       
									                              </form>
									                  </div>
									                </div>
								            
								            </div>
								            <div class="modal-footer">
								                <button type="reset" class="btn btn-default" data-dismiss="modal">关闭或 ESC</button>
								                <button type="button" class="btn btn-primary" onclick="addArea()">增加</button>
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
function add(){
	$('#addModal').modal({
				keyboard: true
			});
 }
function addArea(){
	var areaName = $('#areaName').val();
	var areaDescription = $('#areaDescription').val();
	if(areaName == null || areaName == ''){
		alert("区域名称不能为空");
		return;
	}
	if(areaDescription == null || areaDescription == ''){
		alert("区域说明不能为空");
		return;
	}
	$.ajax({
		type:"post",
		url:"area/ajaxAddArea.do",
		data:{
			areaName:areaName,
			areaDescription:areaDescription										
					},		
		dataType:"json",
		success:function(data){	
		if(data.success){
			alert("添加成功！");
			window.location.href = "area/getArea.do";
			}else{
			var msg = data.errorMsg;
			alert(msg);
			}
					
			},
		error:function(){
									
		}
	});	
}
function del(id){
	if(confirm("确定删除？")){
	$.ajax({
		type:"post",
		url:"area/ajaxDeleteArea.do",
		data:{
			id : id										
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
}
</script>


</body>
</html>
