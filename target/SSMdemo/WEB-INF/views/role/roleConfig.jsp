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
  
	<script src="<%=basePath %>js/jquery.min.js"></script>
	<script src="<%=basePath %>js/bootstrap.js"></script>

	<script src="<%=basePath %>js/bootstrap-modal.js"></script>
	<script type="text/javascript">
function addRole(){
	$('#addRoleModal').modal({
				keyboard: true
			});
}
function add(){
	var roleName = $('#roleName').val();
		$.ajax({
		type:"post",
		url:"role/ajaxAddRole.do",
		data:{
			roleName:roleName										
					},		
		dataType:"json",
		success:function(data){	
		if(data.success){
			alert("添加成功！");
			window.location.reload();
			}else{
			alert("添加失败");
			}
					
			},
		error:function(){
									
		}
	});	
}
function del(roleId){
	$.ajax({
		type:"post",
		url:"role/ajaxDeleteRole.do",
		data:{
			roleId:roleId										
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
                          
                          <th>角色Id</th>
                          <th>角色名称</th>
                          <th>角色权限</th>
                          <th>Status</th>
                          <th>操作</th>
                        </tr>
                      </thead>
                      <tbody>
						<c:forEach items="${roleList }" var="role">
							<tr>
		                          <td>${role.id}</td>
		                          <td>${role.roleName}</td>
		                          <td>${role.roleAuthority}</td>
		                          <td>
		                          <c:if test="${role.state == 1}">
		                          <span class="label label-success">Active</span>
		                          </c:if>
		                          
		                          </td>
		                          <td>	
		                          <c:if test="${role.id != 1}">
		                          	<a class="btn btn-xs btn-warning" href="<%=basePath %>role/getRoleMenu.do?roleId=${role.id}"><i class="icon-pencil"></i> </a>
		                          	<button class="btn btn-xs btn-danger" onclick="del(${role.id})"><i class="icon-remove"></i> </button>
		                          </c:if>	                          		                          
		                         
		                          </td>

                        	</tr>
						</c:forEach>
                        
                                                                                   

                      </tbody>
                    </table>

                    <div class="widget-foot">
					<button type="button" class="btn btn-success" onclick="addRole()">新增</button>
                     
                      
                     
                      <div class="clearfix"></div> 

                    </div>

                  </div>

                </div>
              </div>

              

            </div>                    
        </div>
		  </div>

		<!-- Matter ends -->
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
									                                  <label class="col-lg-4 control-label">角色名称</label>
									                                  <div class="col-lg-8">
									                                    <input type="text" class="form-control"  id = "roleName" >
									                                  </div>
									                                </div>                                	                              				                                				                              			                                
									                                    <hr />
									                       
									                              </form>
									                  </div>
									                </div>
								            
								            </div>
								            <div class="modal-footer">
								                <button type="reset" class="btn btn-default" data-dismiss="modal">关闭或 ESC</button>
								                <button type="button" class="btn btn-primary" onclick="add()">添加</button>
								            </div>
								        </div><!-- /.modal-content -->
								    </div><!-- /.modal-dialog -->
								</div>
			<!-- /.modal -->      
    </div>

   <!-- Mainbar ends -->
   <div class="clearfix"></div>

</div>

<jsp:include page="../foot.jsp"></jsp:include>



</body>
</html>
