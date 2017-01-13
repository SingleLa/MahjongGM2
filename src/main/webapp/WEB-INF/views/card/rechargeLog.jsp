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

				<div class="matter">
			        <div class="container">
						<button type="button" id = "buy" class="btn btn-default">充值记录</button>
						<button type="button" id = "sell" class="btn btn-default">销售记录</button>
						<button type="button" id = "sellToPlayer" class="btn btn-default">充值给玩家</button>
						<input type="hidden" id = "userId" value = "${user.id }">
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
			                          
			                          <th>卖方</th>
			                          <th>买方</th>
			                          <th>销售类型</th>
			                          <th>交易房卡数量</th>
			                          <th>返现房卡数量</th>
			                          <th>提成房卡数量</th>
			                          <th>创建时间</th>
			                       
			                        </tr>
			                      </thead>
			                      <tbody>
									<c:forEach items="${rechargeList}" var="recharge" varStatus ="index">
										<tr>	
											  <td>${index.index+1}</td>
					                          
					                          <td>${recharge.seller.userName}</td>
					                          <td>
					                          <c:choose>
					                          <c:when test="${recharge.isplayer == 0}">
					                          		${recharge.buyer.userName}
					                          </c:when>
					                          <c:when test="${recharge.isplayer == 1}">
					                          		${recharge.playerName}
					                          </c:when>
					                          </c:choose>
					                          </td> 
					                          <td>
					                          <c:choose>
					                          	<c:when test="${recharge.seller.agentType == 4}">
					                          		admin
					                          	</c:when>
					                          	<c:when test="${recharge.seller.agentType == 3}">
					                          		总代理
					                          	</c:when>
					                          	<c:when test="${recharge.seller.agentType == 2}">
					                          		区域代理
					                          	</c:when>
					                          	<c:when test="${recharge.seller.agentType == 1}">
					                          		普通代理
					                          	</c:when>
					                          	</c:choose>
					                          →
					                          	   <c:choose>
					                          	<c:when test="${recharge.buyer.agentType == 4}">
					                          		admin
					                          	</c:when>
					                          	<c:when test="${recharge.buyer.agentType == 3}">
					                          		总代理
					                          	</c:when>
					                          	<c:when test="${recharge.buyer.agentType == 2}">
					                          		区域代理
					                          	</c:when>
					                          	<c:when test="${recharge.buyer.agentType == 1}">
					                          		普通代理
					                          	</c:when>
					                          	<c:when test="${recharge.isplayer == 1}">
					                          		玩家
					                          	</c:when>
					                          	</c:choose>
					                          </td>
					                          <td>${recharge.cardNum}</td>
					                          <td>${recharge.awardNum}</td>
					                          <td>${recharge.percentageNum}</td>
					                          <td><fmt:formatDate value="${recharge.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>                         
					                          
				                        </tr> 
									</c:forEach>
			                                                                                                                                                                        
			                      </tbody>
			                    </table>
			
			                
			
			                    </div>
			
			                  </div>
			
			                </div>
			
			
			              </div>
			
			            </div>
			
			        </div>
				</div>
	
	        </div>
	        

		   </div>


    </div>

   <!-- Mainbar ends -->
   <div class="clearfix"></div>

</div>

<jsp:include page="../foot.jsp"></jsp:include>
<script type="text/javascript">
$(function(){
	$('#buy').click(function(){
		window.location.href = "recharge/getRecharge.do?isplayer=0&buyid="+$('#userId').val();
	})
	$('#sell').click(function(){
		window.location.href = "recharge/getRecharge.do?isplayer=0&sellerid="+$('#userId').val();
	})
	$('#sellToPlayer').click(function(){
		window.location.href = "recharge/getRecharge.do?isplayer=1&sellerid="+$('#userId').val();
	})
})
</script>


</body>
</html>
