<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'foot.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    
  <footer>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
            <!-- Copyright info -->
            <p class="copy">Copyright &copy; 2012 | <a href="#">Your Site</a> </p>
      </div>
    </div>
  </div>
</footer> 	


<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span> 

<!-- JS -->
<script src="<%=basePath %>js/jquery.js"></script> <!-- jQuery -->
<script src="<%=basePath %>js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="<%=basePath %>js/jquery-ui-1.9.2.custom.min.js"></script> <!-- jQuery UI -->
<script src="<%=basePath %>js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
<script src="<%=basePath %>js/jquery.rateit.min.js"></script> <!-- RateIt - Star rating -->
<script src="<%=basePath %>js/jquery.prettyPhoto.js"></script> <!-- prettyPhoto -->

<!-- jQuery Flot -->
<script src="<%=basePath %>js/excanvas.min.js"></script>
<script src="<%=basePath %>js/jquery.flot.js"></script>
<script src="<%=basePath %>js/jquery.flot.resize.js"></script>
<script src="<%=basePath %>js/jquery.flot.pie.js"></script>
<script src="<%=basePath %>js/jquery.flot.stack.js"></script>

<!-- jQuery Notification - Noty -->
<script src="<%=basePath %>js/jquery.noty.js"></script> <!-- jQuery Notify -->
<script src="<%=basePath %>js/themes/default.js"></script> <!-- jQuery Notify -->
<script src="<%=basePath %>js/layouts/bottom.js"></script> <!-- jQuery Notify -->
<script src="<%=basePath %>js/layouts/topRight.js"></script> <!-- jQuery Notify -->
<script src="<%=basePath %>js/layouts/top.js"></script> <!-- jQuery Notify -->
<!-- jQuery Notification ends -->

<script src="<%=basePath %>js/sparklines.js"></script> <!-- Sparklines -->
<script src="<%=basePath %>js/jquery.cleditor.min.js"></script> <!-- CLEditor -->
<script src="<%=basePath %>js/bootstrap-datetimepicker.min.js"></script> <!-- Date picker -->

<script src="<%=basePath %>js/bootstrap-switch.min.js"></script> <!-- Bootstrap Toggle -->
<script src="<%=basePath %>js/filter.js"></script> <!-- Filter for support page -->
<script src="<%=basePath %>js/custom.js"></script> <!-- Custom codes -->
<script src="<%=basePath %>js/charts.js"></script> <!-- Charts & Graphs -->

<!-- Script for this page -->
  </body>
</html>
