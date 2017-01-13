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
  <link href="<%=basePath %>css/bootstrap.min.css" rel="stylesheet">
<script src="<%=basePath %>js/jquery.min.js"></script>
<script src="<%=basePath %>js/bootstrap.min.js"></script>
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
							                      <input type="checkbox"  value="1"  id = "addCheckBox${menu.id}"
							                      <c:if test="${menu.add == 1}">
							                      checked="checked"
							                      </c:if>
							                      > 
							           </label>	
		                          </td>
		                          <td>
		                              <label class="checkbox-inline">
							                      <input type="checkbox"  value="1"  id = "deleteCheckBox${menu.id}"
							                      <c:if test="${menu.delete == 1}">
							                      checked="checked"
							                      </c:if>
							                      > 
							           </label>	
		                          </td>
		                          <td>
		                              <label class="checkbox-inline">
							                      <input type="checkbox"  value="1"  id = "updateCheckBox${menu.id}"
							                      <c:if test="${menu.update == 1}">
							                      checked="checked"
							                      </c:if>
							                      > 
							           </label>	
		                          </td>
		                          <td>				                         
						               <label class="checkbox-inline">
						                      <input type="checkbox"  value="1"  id = "queryCheckBox${menu.id}"
						                      <c:if test="${menu.query == 1}">
						                      checked="checked"
						                      </c:if>
						                      > 
						               </label>				                                  
						                  
				                          
		                          
		                          
		                          </td>
		                          <td>	
		                         
		                          	<button class="btn btn-xs btn-warning" onclick="update()" ><i class="icon-pencil"></i>修改 </button>
		                          	<button class="btn btn-xs btn-danger"><i class="icon-remove"></i>删除</button>
		                         	                          		                          
		                         
		                          </td>

                        	</tr>
						</c:forEach>
                        
                                                                                   

                      </tbody>
                    </table>

<button onclick="aa()">  </button>



                    <div class="widget-foot">

                     
                      
                     
                      <div class="clearfix"></div> 

                    </div>

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
// 							   $('#menuId').val(data.id);
// 							   $('#menuName').val(data.menuName);
// 							   $('#menuUrl').val(data.menuUrl);
// 							   $('#level').val(data.level);
// 							   $('#parent').val(data.parent);
// 							   if(data.menuState == 1){
// 							   	$('#menuState').attr('checked',true);
// 							   }else{
// 							   	$('#menuState').attr('checked',false);
// 							   }
  								
							}         
				        });
					
						},
				error:function(){
									
						}
						});	
						
        
      });
 function  ccc(){
     $("table tr").click(function()
		{
		

})
    }; 
function update(){
var $this = $("table tr");
		
		getRow($this.context.rowIndex);
alert($this.context.rowIndex);
}
     function getRow(rowIndex){
    var row = $("table tr").eq(rowIndex).find("td").eq(0);
    var roleMenuId =row[0].innerHTML;
    return row;

}
  	</script>
</body>
</html>
