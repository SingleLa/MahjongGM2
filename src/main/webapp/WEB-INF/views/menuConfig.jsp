<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<jsp:include page="head.jsp"></jsp:include>

<!-- Main content starts -->

<div class="content">

<jsp:include page="menu.jsp"></jsp:include>
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
				
				
				              <div class="widget wgreen">
				                
				                <div class="widget-head">
				                  <div class="pull-left">编辑</div>
				                  <div class="widget-icons pull-right">
				                    <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a> 
				                    <a href="#" class="wclose"><i class="icon-remove"></i></a>
				                  </div>
				                  <div class="clearfix"></div>
				                </div>
				
				                <div class="widget-content">
				                  <div class="padd">
				
				                    <h6>菜单编辑</h6>
				                    <hr />
				                    <!-- Form starts.  -->
				                     <form class="form-horizontal" role="form">
				                              
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
				                                <input type="hidden"  id = "level">
				                                <input type="hidden"  id = "parent">
				                                <div class="form-group">
				                                  <label class="col-lg-4 control-label">菜单url</label>
				                                  <div class="col-lg-8">
				                                    <input type="text" class="form-control" id = "menuUrl">
				                                  </div>
				                                </div>
				                                
				                                <div class="form-group">
				                                  <label class="col-lg-4 control-label">菜单状态</label>
				                                  <div class="col-lg-8">
				                                    <label class="checkbox-inline">
				                                      <input type="checkbox" id="menuState" value="1"> 
				                                    </label>				                                  
				                                  </div>
				                                </div>			                                
				                                    <hr />
				                                <div class="form-group">
				                                  <div class="col-lg-offset-1 col-lg-9">
				                                   <button type="button" class="btn btn-success" onclick="updateMenu()">提交</button>
				                                   <button type="button" class="btn btn-default" onclick="resist()">重置</button>
				                                   
				                                   			                                    				                                   				                                    
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
	</div>
    </div>
   <div class="clearfix"></div>
</div>
<jsp:include page="foot.jsp"></jsp:include>
    
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
							   $('#menuId').val(data.id);
							   $('#menuName').val(data.menuName);
							   $('#menuUrl').val(data.menuUrl);
							   $('#level').val(data.level);
							   $('#parent').val(data.parent);
							   if(data.menuState == 1){
							   	$('#menuState').attr('checked',true);
							   }else{
							   	$('#menuState').attr('checked',false);
							   }
  								
							}         
				        });
					
						},
				error:function(){
									
						}
						});	
						
        
      });
      function resist(){
      
		   
		var data =  $('#treeview').treeview('getSelected')[0];
			 $('#menuId').val(data.id);
			$('#menuName').val(data.menuName);
			$('#menuUrl').val(data.menuUrl);
			$('#level').val(data.level);
			$('#parent').val(data.parent);
			if(data.menuState == 1){
				$('#menuState').attr('checked',true);
			}else{
				$('#menuState').attr('checked',false);
			}
      
      }
      function updateMenu(){
      		var id = $('#menuId').val();
      		var menuName = $('#menuName').val();
      		var menuUrl = $('#menuUrl').val();
      		var level = $('#level').val();
      		var parent = $('#parent').val();
      		var state = 0;
      		if($('#menuState').isChecked){
      			state = 0;
      		}else{
      			state = 1;
      		}
      $.ajax({
				type:"post",
				url:"menu/ajaxUpdateMenu.do",
				data:{
					id : id ,
					menuName : menuName,
					menuUrl	: menuUrl,
					state : state,
					level : level,
					parent : parent			
						},		
				dataType:"json",
				success:function(data){	
					if(data.success){
						alert("修改成功！");
						window.location.reload();
					}else{
						alert("修改失败");
					}
					
						},
				error:function(){
									
						}
						});	
						
      
      }
  	</script>
</body>
</html>
